<?php

namespace App\Controller;

use App\DTO\ClientDTO;
use App\Exceptions\ApiException;
use App\Links\LinksClientDTOGenerator;
use App\Repository\ClientRepository;
use App\Responder\JsonResponder;
use App\Security\Voter\ClientVoter;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class DetailsClientController
{
    private $clientRepository;
    private $clientVoter;
    private $security;
    private $responder;

    public function __construct(
        ClientRepository $clientRepository,
        ClientVoter $clientVoter,
        Security $security,
        JsonResponder $responder,
        LinksClientDTOGenerator $links
    ) {
        $this->clientRepository =$clientRepository;
        $this->clientVoter = $clientVoter;
        $this->security = $security;
        $this->responder = $responder;
        $this->links = $links;
    }

    /**
     * @Route("/client/{id}", methods={"GET"}, name="detailsClient")
     * @SWG\Response(
     *     response=200,
     *     description="Returns one product",
     *
     * )
     * @SWG\Response(
     *     response=404,
     *     description="Error : This person not exist.",
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
    public function detailsClient($id, Request $request)
    {
        $client = $this->personRepository->findOneById($id);
        if (null == $person) {
            throw new ApiException('This person not exist.', 404);
        }

        $vote = $this->clientVoter->vote($this->security->getToken(), $client, ['view']);
        if ($vote < 1) {
            throw new ApiException('You are not authorized to access this resource.', 403);
        }

        $clientDTO = new ClientDTO($client);
        $this->links->addLinks($clientDTO);

        return $this->responder->send($request, $clientDTO);
    }
}
