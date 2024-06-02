<?php

namespace App\Classe;

use Symfony\Component\HttpFoundation\RequestStack;

Class Cart 
{    
    public function __construct(private RequestStack $requestStack)
    {
        
    }

/*
*add()
*fonction permettant l'ajout d'un produit au panier
*/
    public function add($product)
    {
       
        
        $cart = $this->requestStack->getSession()->get('cart');

        if (isset($cart[$product->getId()])) {         
            $cart[$product->getId()] = [
                'objet' => $product,
                'qty' => $cart[$product->getId()]['qty'] + 1
            ];
        } else {
            $cart[$product->getId()] = [
                'objet' => $product,
                'qty' => 1,
            ];
        }   
        $this->requestStack->getSession()->set('cart', $cart);       
    }

/*
*decrease()
*fonction permettant la suppression d'une quantitée d'un produit du panier (-)
*/
    public function decrease($id)
    {
        $cart = $this->requestStack->getSession()->get('cart');

        if ($cart[$id]['qty'] > 1) {
            $cart[$id]['qty'] = $cart[$id]['qty'] - 1;
        } else {
            unset($cart[$id]);
        }
        $this->requestStack->getSession()->set('cart', $cart);
    }

/*
*fullQuantity()
*fonction retournant le total de produits du panier
*/
    public function fullQuantity()
    {
        $cart = $this->requestStack->getSession()->get('cart');
        $quantity = 0;

        if (!isset($cart)) {
            return $quantity;
        }

        foreach($cart as $product) {
             $quantity = $quantity + $product['qty'];
        }

        return $quantity;
    }

/*
*getTotalWt()
*fonction retournant le prix total du panier
*/
    public function getTotalWt()
    {
        $cart = $this->requestStack->getSession()->get('cart');
        $price = 0;

        if (!isset($cart)) {
            return $price;
        }

        foreach($cart as $product) {
             $price = $price + ($product['objet']->getPriceWt()* $product['qty']);
        }

        return $price;
    }

/*
*remove()
*fonction permettant la suppression total du panier
*/
    public function remove()
    {
        return $this->requestStack->getSession()->remove('cart');
    }
    
/*
*getCart()
*fonction retournant le panier 
*/
    public function getCart()
    {
          return $this->requestStack->getSession()->get('cart');
    }
}