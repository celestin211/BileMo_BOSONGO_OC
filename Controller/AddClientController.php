<?php

namespace App\Controller;

use App\DTO\ClientDTO;
use App\Entity\Client;
use App\Links\LinksClientDTOGenerator;
use App\Responder\JsonResponder;
use App\Security\ErrorsValidator;
use Doctrine\ORM\EntityManagerInterface;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AddClientController
{
    private $serializer;
    private $manager;
    private $security;
    private $validator;
    private $errorsValidator;
    private $responder;
    private $links;

    public function __construct(
        SerializerInterface $serializer,
        EntityManagerInterface $manager,
        Security $security,
        ValidatorInterface $validator,
        ErrorsValidator $errorsValidator,
        JsonResponder $responder,
        LinksClientDTOGenerator $links
    ) {
        $this->serializer = $serializer;
        $this->manager = $manager;
        $this->security = $security;
        $this->validator = $validator;
        $this->errorsValidator = $errorsValidator;
        $this->responder = $responder;
        $this->links = $links;
    }

    /**
     * @Route("/client", methods={"POST"}, name="addClient")
     * * @SWG\Response(
     *     response=201,
     *     description="Returns the created person",
     * )
     * @SWG\Response(
     *     response=409,
     *     description="Invalid : Return all fields with an error",
     * )
     * @SWG\Parameter(
     *     name="Client",
     *     in="body",
     *     description="The person you want add",
     *     @SWG\Schema(
     *         @SWG\Property(property="email", type="string", example="exemple_bosongocelestin@exemple.com"),
     *         @SWG\Property(property="firstname", type="string", example="Bososngo"),
     *         @SWG\Property(property="lastname", type="string", example="Celestin")
     *     )
     * )
     * @SWG\Tag(name="Client")
     * @SecurityDoc(name="Bearer")
     */
    public function addClient(Request $request)
    {
        $client = $this->serializer->deserialize($request->getContent(), Client::class, 'json');
        $client->setUserClient($this->security->getUser());

        $errors = $this->validator->validate($client);
        if (count($errors) > 0) {
            return $this->responder->send($request, $this->errorsValidator->arrayFormatted($errors), 409);
        }

        $this->manager->persist($client);
        $this->manager->flush();

        $clientDTO = new ClientDTO($client);
        $this->links->addLinks($clientDTO);

        return $this->responder->send($request, $clientDTO, 201);
    }
}
