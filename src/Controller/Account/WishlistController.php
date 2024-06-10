<?php

namespace App\Controller\Account;

use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class WishlistController extends AbstractController
{
    #[Route('/compte/liste-de-souhait', name: 'app_account_wishlist')]
    public function index(): Response
    {
        return $this->render('account/wishlist/index.html.twig');
    }
    
    #[Route('/compte/liste-de-souhait/add/{id}', name: 'app_account_wishlist_add')]
    public function add(ProductRepository $productRepository, EntityManagerInterface $entityManager, Request $request, $id): Response
    {
        // 1. Récupérer le produit souhaité
        $product = $productRepository->findOneById($id);
        // 2. Si produit existant l'ajouter a la liste d'envie
        if ($product) {
            $this->getUser()->addWishlist($product);
            // 3. sauvegarder en BDD
            $entityManager->flush();
        }
        $this->addFlash(
            'success',
            "Le produit a bien été ajouté a votre liste d'envie..."
          );


        return $this->redirect($request->headers->get('referer'));

    }

    #[Route('/compte/liste-de-souhait/remove/{id}', name: 'app_account_wishlist_remove')]
    public function remove(ProductRepository $productRepository, EntityManagerInterface $entityManager, Request $request, $id): Response
    {
        // 1. Récupérer le produit a supprimer
        $product = $productRepository->findOneById($id);
        // 2. Si produit existant l'enlever de la liste d'envie
        if ($product) {
            $this->addFlash('success', "le produit à bien été supprimeé de votre liste d'envie");
            $this->getUser()->removeWishlist($product);
            // 3. sauvegarder en BDD
            $entityManager->flush();
        } else {
            $this->addFlash('danger', "le produit est introuvable!!");
        }
        
        return $this->redirect($request->headers->get('referer'));
    }
}