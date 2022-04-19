<?php

namespace App\Controller;

use App\Exceptions\ApiException;
use App\Repository\ClientRepository;
use App\Responder\JsonResponder;
use App\Security\Voter\ClientVoter;
use Doctrine\ORM\EntityManagerInterface;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class DeleteClientController
{
    private $manager;
    private $security;
    private $personRepository;
    private $personVoter;
    private $responder;

    public function __construct(
        EntityManagerInterface $manager,
        Security $security,
        ClientRepository $clientRepository,
        ClientVoter $clientVoter,
        JsonResponder $responder
    ) {
        $this->manager = $manager;
        $this->security = $security;
        $this-> clientRepository = $clientRepository;
        $this->personVoter = $personVoter;
        $this->responder = $responder;
    }

    /**
     * @Route("/client/{id}", methods={"DELETE"}, name="deleteClient")
     * @SWG\Response(
     *     response=204,
     *     description="Return empty body",
     *
     * )
     * @SWG\Response(
     *     response=404,
     *     description="Error : This client not exist.",
     * )
     * @SWG\Response(
     *     response=403,
     *     description="Error : You are not authorized to access this resource..",
     * )
     * @SWG\Parameter(
     *     name="id",
     *     in="path",
     *     type="integer",
     *     description="The id of the person"
     * )
     * @SWG\Tag(name="Client")
     * @SecurityDoc(name="Bearer")
     */
    public function deletePerson($id, Request $request)
    {
        $person = $this->personRepository->findOneById($id);

        if (null == $person) {
            throw new ApiException('This person not exist.', 404);
        }

        $vote = $this->clientVoter->vote($this->security->getToken(), $person, ['delete']);
        if ($vote < 1) {
            throw new ApiException('You are not authorized to access this resource.', 403);
        }

        $this->manager->remove($client);
        $this->manager->flush();

        return $this->responder->send($request, [], 204);
    }
}
