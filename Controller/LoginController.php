<?php

namespace App\Controller;

use Swagger\Annotations as SWG;
use Symfony\Component\Routing\Annotation\Route;

class LoginController
{
    /**
     * @Route("/login", methods={"POST"}, name="login")
     *
     * @SWG\Response(
     *     response=200,
     *     description="Return Bearer Token",
     *
     * )
     * @SWG\Response(
     *     response=401,
     *     description="Error : Oups invalid credentials."
     * )
     * @SWG\Parameter(
     *     name="Client",
     *     in="body",
     *     description="Product pagination",
     *     @SWG\Schema(
     *         @SWG\Property(property="email", type="string", example="celestin.mombela@yahoo.fr"),
     *         @SWG\Property(property="password", type="string", example="password_bosongo456")
     *     )
     * )
     * @SWG\Tag(name="Login")
     */
    public function index()
    {
    }
}
