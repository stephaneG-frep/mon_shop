<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CartController extends AbstractController
{
    #[Route('/mon-panier/{motif}', name: 'app_cart', defaults: [ 'motif' => null ])]
    public function index(Cart $cart, $motif): Response
    { 
        
        if ($motif == "annulation") {
            $this->addFlash(
                'info',
                'Paiement annulé : Vous pouvez mettre a jour votre commande et votre panier.'
              );
        }


        return $this->render('cart/index.html.twig', [
            'cart' => $cart->getCart(),
            'totalWt' => $cart->getTotalWt(),
        ]);
    }

    #[Route('/cart/add/{id}', name: 'app_cart_add')]
    public function add($id, Cart $cart, ProductRepository $productRepository, Request $request): Response
    {
        

        $product = $productRepository->findOneById($id);
        $cart->add($product);

        $this->addFlash(
            'success',
            'Le produit a bien été ajouté au panier...'
          );


        return $this->redirect($request->headers->get('referer'));
    }

    #[Route('/cart/decrease/{id}', name: 'app_cart_decrease')]
    public function decrease($id, Cart $cart): Response
    {
        
        $cart->decrease($id);

        $this->addFlash(
            'warning',
            'Le produit a bien été supprimé du panier...'
          );


        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/remove', name: 'app_cart_remove')]
    public function remove(Cart $cart): Response
    {

        $cart->remove();


        return $this->redirectToRoute('app_home');
    }
}
