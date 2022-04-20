<?php

namespace App\Controller;

use App\DTO\ClientDTO;
use App\Links\LinksClientDTOGenerator;
use App\Paging\ClientPaging;
use App\Responder\JsonResponder;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ListOfClientController
{
    private $responder;
    private $paging;
    private $clientDTO;
    private $links;

    public function __construct(
        JsonResponder $responder,
        ClientPaging $paging,
        ClientDTO $clientDTO,
        LinksClientDTOGenerator $links
    ) {
        $this->responder = $responder;
        $this->paging = $paging;
        $this->clientDTO = $clientDTO;
        $this->links = $links;
    }

    /**
     * @Route("/client", methods={"GET"}, name="ListOfClient")
     *
     * @SWG\Response(
     *     response=200,
     *     description="Return list of client",
     *
     * )
     * @SWG\Response(
     *     response=404,
     *     description="Error : The page must be between X and X."
     * )
     * @SWG\Parameter(
     *     name="page",
     *     in="query",
     *     type="integer",
     *     description="Client pagination"
     * )
     * @SWG\Tag(name="Client")
     * @SecurityDoc(name="Bearer")
     */
    public function ListOfClient(Request $request)
    {
        $client = $this->paging->getDatas($request->query->get('page'));

        $clientDTO = $this->clientDTO->getClientDTO($client);

        $this->links->addLinks($clientDTO);

        return $this->responder->send($request, $clientDTO);
    }
}
