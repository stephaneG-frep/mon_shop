<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Form\ForgotPasswordFormType;
use App\Form\ResetPasswordFormType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ForgotPasswordController extends AbstractController
{
    #[Route('/mot-de-passe-oublié', name: 'app_password')]
    public function index(Request $request, UserRepository $userRepository): Response
    {
        // 1: formulaire
        $form = $this->createForm(ForgotPasswordFormType::class);

        $form->handleRequest($request);

        // 2: traitement du formulaire
        if ($form->isSubmitted() && $form->isValid()) {
            // 3: vérifier l'email de l'utilisateur en BDD 
            $email = $form->get('email')->getData();

            $user = $userRepository->findOneByEmail($email);
            
            // notification envoyée a l'utilisateur
            $this->addFlash('success', 'si votre adresse existe un mail de réinitialisation vous sera envoyé');

             // 4: si mail ok reset du password et envoie du nouveau par mail
            if ($user) {
                 // Envoye d'un mail de réinitialisation(mailjet)
              $mail = new Mail();
              $vars = [
                 'link' => 'link',
              ];
              $mail->send($user->getEmail(), $user->getFirstname().' '.$user->getLastname(), "Réinitialisation de votre mot de passe", "forgotpassword.html", $vars);
              //
            }
           

        }

       

        return $this->render('password/index.html.twig', [
            'forgotPasswordForm' => $form->createView(),
        ]);
    }

    #[Route('/mot-de-passe/reset/{token}', name: 'app_password_update')]
    public function update(Request $request): Response
    {
        $form = $this->createForm( ResetPasswordFormType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Traitement a éffectuer
        }
         
        return $this->render('password/reset.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
