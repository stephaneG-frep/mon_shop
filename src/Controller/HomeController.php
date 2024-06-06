<?php

namespace App\Controller;

use App\Classe\Mail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
       $mail = new Mail();
       $mail->send('weshsteff@yahoo.fr', 'Devid Symfony', 'bonjour cei est un test de mailjet ', 'Votre commande');
      
        return $this->render('home/index.html.twig');
    }
}
