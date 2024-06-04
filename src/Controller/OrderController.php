<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\OrderDetail;
use App\Entity\Product;
use App\Form\OrderType;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class OrderController extends AbstractController
{
    /*
    * premiere etape du tunnel d'achat
    * choix de l'adresse de livraison et du transporteur 
    */

    #[Route('/commande/livraison', name: 'app_order')]
    public function index(): Response
    {
        $adresses = $this->getUser()->getAdresses();

        if (count($adresses) == 0) {
            return $this->redirectToRoute('app_account_adress_form');
        }

        $form = $this->createForm(OrderType::class, null, [
            'adresses' => $adresses,
            'action' => $this->generateUrl('app_order_summary'),
        ]);

        return $this->render('order/index.html.twig', [
            'deliveryForm' => $form->createView(),
        ]);
    }


     /*
    * deuxieme etape du tunnel d'achat
    * récap de la commande
    * insertion en BDD
    * préparatio du payementvers stripe
    */

    #[Route('/commande/recapitulatif', name: 'app_order_summary')]
    public function add(Request $request, Cart $cart, EntityManagerInterface $entityManager): Response
    {

        if ($request->getMethod() != 'POST') {
            return $this->redirectToRoute('app_cart');
        }

        $products = $cart->getCart();

        $form = $this->createForm(OrderType::class, null, [
            'adresses' => $this->getUser()->getAdresses(),
            
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
           // stocker les info en BDD
           // création de la chaine adresse
           $adressObj = $form->get('adresses')->getData();

           $adress = $adressObj->getFirstname().' '.$adressObj->getlastname().'</br>';
           $adress .= $adressObj->getAdress().'</br>';
           $adress .= $adressObj->getPostal().' '.$adressObj->getCity().'</br>';
           $adress .= $adressObj->getCountry().'</br>';
           $adress .= $adressObj->getPhone();


           $order = new Order();
           $order->setUser($this->getUser());
           $order->setCreatedAt(new DateTime());
           $order->setState(1);
           $order->setCarrierName($form->get('carriers')->getData()->getName());
           $order->setCarrierPrice($form->get('carriers')->getData()->getPrice());
           $order->setDelivery($adress);


           foreach ($products as $product) {           
            $orderDetail = new OrderDetail();
            $orderDetail->setProductName($product['objet']->getName());
            $orderDetail->setProductIllustration($product['objet']->getIllustration());
            $orderDetail->setProductPrice($product['objet']->getPrice());
            $orderDetail->setProductTva($product['objet']->getTva());
            $orderDetail->setProductQuantity($product['qty']);
            $order->addOrderDetail($orderDetail);
        }

        $entityManager->persist($order);
        $entityManager->flush();


    }
       
        return $this->render('order/summary.html.twig', [
            'choices' => $form->getData(),
            'cart' => $products,
            'totalWt' => $cart->getTotalWt(),
        ]);
    }
}
