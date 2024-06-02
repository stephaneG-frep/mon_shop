<?php

namespace App\Controller;

use App\Entity\Adress;
use App\Form\AdressUserType;
use App\Form\PasswordUserType;
use App\Repository\AdressRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;


class AccountController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }


    #[Route('/compte', name: 'app_account')]
    public function index(): Response
    {
        return $this->render('account/index.html.twig');
    }

    #[Route('/compte/modifier-mdp', name: 'app_account_modify-pwd')]
    public function password(Request $request, UserPasswordHasherInterface $passwordHasher): Response
    {
        $user = $this->getUser();
           
        $form = $this->createForm(PasswordUserType::class, $user, [
            'passwordHasher' => $passwordHasher
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->flush();
            $this->addFlash(
              'success',
              'Votre mot de passe a bien été enregistré...'
            );
        }

        return $this->render('account/password.html.twig',[
           'modifyPwd' => $form->createView()
        ]);
    }

    #[Route('/compte/adresses/delete/{id}', name: 'app_account_adress_delete')]
    public function adressDelete($id, AdressRepository $adressRepository): Response
    {
        $adress = $adressRepository->findOneById($id);
        if (!$adress OR $adress->getUser() != $this->getUser()) {
            return $this->redirectToRoute('app_account_adresses');
        }
        $this->addFlash(
            'success',
            'Votre adresse a bien été supprimée...'
          );
          
        $this->entityManager->remove($adress);
        $this->entityManager->flush();

        return $this->redirectToRoute('app_account_adresses');
    }

    #[Route('/compte/adresses', name: 'app_account_adresses')]
    public function adresses(): Response
    {
        return $this->render('account/adresses.html.twig');
    }

    #[Route('/compte/adresse/ajouter/{id}', name: 'app_account_adress_form', defaults: ['id' => null])]
    public function adressForm(Request $request, $id,  AdressRepository $adressRepository): Response
    {  
        if ($id) {
            $adress = $adressRepository->findOneById($id);
            if (!$adress OR $adress->getUser() != $this->getUser()) {
                return $this->redirectToRoute('app_account_adresses');
            }
        } else {
            $adress = new Adress();
            $adress->setUser($this->getUser());
        }

       
        $form = $this->createForm(AdressUserType::class, $adress);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
             $this->entityManager->persist($adress);
             $this->entityManager->flush();

             $this->addFlash(
                'success',
                'Votre adresse a bien été sauvegardée...'
              );
              return $this->redirectToRoute('app_account_adresses');
        }

        return $this->render('account/adressForm.html.twig', [
            'adressForm' => $form,
        ]);
    }
}