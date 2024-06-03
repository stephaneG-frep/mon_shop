<?php

namespace App\Controller;

use App\Form\OrderType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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

        $form = $this->createForm(OrderType::class, null, [
            'adresses' => $this->getUser()->getAdresses()
        ]);


        return $this->render('order/index.html.twig', [
            'deliveryForm' => $form->createView(),
        ]);
    }
}
