<?php

namespace App\Controller;

use App\Exceptions\ApiException;
use App\Repository\ProductRepository;
use App\Responder\JsonResponder;
use App\Security\Voter\ProductVoter;
use Doctrine\ORM\EntityManagerInterface;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class UpdateProductController
{
    private $manager;
    private $security;
    private $productRepository;
    private $productVoter;
    private $responder;

    public function __construct(
        EntityManagerInterface $manager,
        Security $security,
        ProductRepository $productRepository,
        ProductVoter $personVoter,
        JsonResponder $responder
    ) {
        $this->manager = $manager;
        $this->security = $security;
        $this->productRepository = $productRepository;
        $this->productVoter = $productVoter;
        $this->responder = $responder;
    }

    /**
     * @Route("/product/{id}", methods={"PUT"}, name="updateProduct")
     * @SWG\Response(
     *     response=204,
     *     description="Return empty body",
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
     * @SWG\Tag(name="Product")
     * @SecurityDoc(name="Bearer")
     */
    public function updateProduct($id, Request $request)
    {
        $product = $this->personRepository->findOneById($id);

        if (null == $product) {
            throw new ApiException('This person not exist.', 404);
        }

        $vote = $this->productVoter->vote($this->security->getToken(), $product, ['update']);
        if ($vote < 1) {
            throw new ApiException('You are not authorized to access this resource.', 403);
        }

        $this->manager->flush($product);

        return $this->responder->send($request, [], 204);
    }

}
