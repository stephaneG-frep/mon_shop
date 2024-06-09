<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use Dompdf\Dompdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class InvoiceController extends AbstractController
{

    /*
    *  IMPRESSION FACTURE PDF
    *  vérification de la commande 
    */

    #[Route('/compte/facture/impression/{id_order}', name: 'app_invoice')]
    public function index(OrderRepository $orderRepository, $id_order): Response
    {

        // 1. Vérification de l'objet commande  ---Existe?
        $order = $orderRepository->findOneById($id_order);
        if (!$order) {
            return $this->redirectToRoute('app_account');
        }
        // 1. Vérification l'utilisateur de la commande
        if ($order->getUser() != $this->getUser()) {
            return $this->redirectToRoute('app_account');
        }

         // générer des facture au format PDF avec le bundle DomPdf
        $dompdf = new Dompdf();
      // pour revoyer la view (vue)
        $html = $this->renderView('invoice/index.html.twig', [
            'order' => $order,
        ]);
        $dompdf->loadHtml($html);
        // Format et orientation
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        // pour ouvrir le fichier dans le navigateur
        $dompdf->stream('facture.pdf', [
             'Attachment' => false,
       ]);

           exit();

    }
}
