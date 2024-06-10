<?php

namespace App\Controller\Admin;

use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Request;

class OrderCrudController extends AbstractCrudController
{
    private $em;

    public function __construct(EntityManagerInterface $entityManagerInterface)
    {
        $this->em = $entityManagerInterface;
    }

    public static function getEntityFqcn(): string
    {
        return Order::class;
    }
  
    // configuration en français
    public function configureCrud(Crud $crud): Crud
    {
        return $crud
        ->setEntityLabelInSingular('Commande')
        ->setEntityLabelInPlural('Commandes')
        //...
        ;
    }

    public function configureActions(Actions $actions): Actions
{
// amélioration du dashboard (suppression de : créer, supprimer une commande dans l'admin) 
    $show = Action::new('Afficher')->linkToCrudAction('show');
    return $actions
        // ...
        ->add(Crud::PAGE_INDEX, $show)
        ->remove(Crud::PAGE_INDEX, Action::NEW)
        ->remove(Crud::PAGE_INDEX, Action::EDIT)
        ->remove(Crud::PAGE_INDEX, Action::DELETE)

        ;
}
    /*
    * Fonction permettant le changement de statut de commande
    */
    public function changeState($order,$state)
    { 
        // 1 Modification du statut de la commande
        $order->setState($state);
        $this->em->flush();
        // 2 Affichage d'un message de statut pour l'admin...
        $this->addFlash('success', 'Statut de la commande mis a jour');

        // 3 Imformer le client du statut de commande par mail
         // Envoye d'un mail de confirmation (mailjet)
         $mail = new Mail();
         $vars = [
           'firstname' => $order->getUser()->getFirstname(),
           'lastname' => $order->getUser()->getLastname(),
           'id_order' => $order->getId(),
         ];
         $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname().' '.$order->getUser()->getLastname(), 'Modification du statut de votre commande', "order_state_".$state.".html", $vars);
         //
    }

// création d'une vue de la commande dans admin
    public function show(AdminContext $context, AdminUrlGenerator $adminUrlGenerator, Request $request)
    {
        $order = $context->getEntity()->getInstance();
        //Récupérer l'URL de l'action "show"
        $url = $adminUrlGenerator->setController(self::class)->setAction('show')->setEntityId($order->getId())->generateUrl();
 
        // Traitement du changement des statut de la commande
        if ($request->get('state')) {
            $this->changeState($order,$request->get('state'));
        }

        return $this->render('admin/order.html.twig', [
            'order' => $order,
            'current_url' => $url,
        ]);
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            DateField::new('createdAt')->setLabel('Date'),
            NumberField::new('state')->setLabel('status')->setTemplatePath('admin/state.html.twig'),
            AssociationField::new('user')->setLabel('Utilisateur'),
            TextField::new('carrierName')->setLabel('Transporteur'),
            NumberField::new('totalWt')->setLabel('Total T.T.C'),
            NumberField::new('totalTva')->setLabel('Total T.V.A'),
           
        ];
    }

}
