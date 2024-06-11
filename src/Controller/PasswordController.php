<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class PasswordController extends AbstractController
{
    #[Route('/mot-de-passe-oublié', name: 'app_password')]
    public function index(): Response
    {
        // 1: formulaire

        // 2: traitement du formulaire

        // 3: vérifier l'email de l'utilisateur en BDD

        // 4: si ok reset du password et envoie du nouveau par mail

        return $this->render('password/index.html.twig', [
            'controller_name' => 'PasswordController',
        ]);
    }
}
