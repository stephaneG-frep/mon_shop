<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Form\ForgotPasswordFormType;
use App\Form\ResetPasswordFormType;
use App\Repository\UserRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class ForgotPasswordController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

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
            // 4.a Créer un token et le stocker en BDD               
            $token = bin2hex(random_bytes(15));
            $user->setToken($token);
            $date= new DateTime();
            $date->modify('+10 minutes');
            $user->setTokenExpireAt($date);            
            $this->em->flush();


            // Envoye d'un mail de réinitialisation(mailjet)
            $mail = new Mail();
            $vars = [
                 'link' => $this->generateUrl('app_password_update', ['token' => $token], UrlGeneratorInterface::ABSOLUTE_URL),
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
    public function update(Request $request, UserRepository $userRepository, $token): Response
    {
        if (!$token) {
           return $this->redirectToRoute('app_password');
        } 

        $user = $userRepository->findOneByToken($token);

        $now = new DateTime();
        if (!$user || $now > $user->getTokenExpireAt()) {
            return $this->redirectToRoute('app_password');
        }

        $form = $this->createForm(ResetPasswordFormType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Traitement a éffectuer
            $user->setToken(null);
            $user->setTokenExpireAt(null);
            $this->em->flush();
            $this->addFlash(
              'success',
              'Votre mot de passe a bien été enregistré...'
            );
            return $this->redirectToRoute('app_login');
        }
         
        return $this->render('password/reset.html.twig', [
            'formResetPassword' => $form->createView(),
        ]);
    }
}
