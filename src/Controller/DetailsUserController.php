<?php

namespace App\Controller;

use App\DTO\UserDTO;
use App\Exceptions\ApiException;
use App\Links\LinksUserDTOGenerator;
use App\Repository\UserRepository;
use App\Responder\JsonResponder;
use App\Security\Voter\UserVoter;
use Nelmio\ApiDocBundle\Annotation\Security as SecurityDoc;
use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class DetailsUserController
{
    private $userRepository;
    private $userVoter;
    private $security;
    private $responder;

    public function __construct(
        UserRepository $userRepository,
        UserVoter $userVoter,
        Security $security,
        JsonResponder $responder,
        LinksUserDTOGenerator $links
    ) {
        $this->userRepository = $userRepository;
        $this->userVoter = $userVoter;
        $this->security = $security;
        $this->responder = $responder;
        $this->links = $links;
    }

    /**
     * @Route("/user/{id}", methods={"GET"}, name="detailsUser")
     * @SWG\Response(
     *     response=200,
     *     description="Returns one user",
     *
     * )
     * @SWG\Response(
     *     response=404,
     *     description="Error : This user not exist.",
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
     * @SWG\Tag(name="User")
     * @SecurityDoc(name="Bearer")
     */
    public function detailsUser($id, Request $request)
    {
        $user = $this->userRepository->findOneById($id);
        if (null == $user) {
            throw new ApiException('This user not exist.', 404);
        }

        $vote = $this->userVoter->vote($this->security->getToken(), $user, ['view']);
        if ($vote < 1) {
            throw new ApiException('You are not authorized to access this resource.', 403);
        }

        $userDTO = new UserDTO($user);
        $this->links->addLinks($userDTO);

        return $this->responder->send($request, $userDTO);
    }
}
