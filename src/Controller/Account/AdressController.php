<?php

namespace App\Controller\Account;

use App\Entity\Adress;
use App\Form\AdressUserType;
use App\Repository\AdressRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;



class AdressController extends AbstractController
{

    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/compte/adresses', name: 'app_account_adresses')]
    public function index(): Response
    {
        return $this->render('account/adress/index.html.twig');
    }

    #[Route('/compte/adresses/delete/{id}', name: 'app_account_adress_delete')]
    public function delete($id, AdressRepository $adressRepository): Response
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


    #[Route('/compte/adresse/ajouter/{id}', name: 'app_account_adress_form', defaults: ['id' => null])]
    public function form(Request $request, $id,  AdressRepository $adressRepository): Response
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

        return $this->render('account/adress/form.html.twig', [
            'adressForm' => $form,
        ]);
    }
}



