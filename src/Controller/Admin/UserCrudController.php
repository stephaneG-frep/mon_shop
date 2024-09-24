<?php

namespace App\Controller\Admin;

use App\Entity\User;
use Doctrine\ORM\Cache\TimestampRegion;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    // configuration en français
    public function configureCrud(Crud $crud): Crud 
    {
        return $crud
        ->setEntityLabelInSingular('Utilisateur')
        ->setEntityLabelInPlural('Utilisateurs')
        //...
        ;
    }

  
    public function configureFields(string $pageName): iterable
    {

        return [

            
            TextField::new('firstname')->setLabel('Prénom'),
            TextField::new('lastname')->setLabel('Nom de famille'),
            DateField::new('LastLoginAt')->setLabel('Derniere connexion')->onlyOnIndex(),
            ChoiceField::new('roles')->setLabel('Permission')->setHelp("Choissir le role de l'utulisateur")
                ->setChoices([
                'ROLE_USER' => 'ROLE_USER',
                'ROLE_ADMIN' => 'ROLE_ADMIN',
            ])->allowMultipleChoices(),
            TextField::new('email')->setLabel('Email')->onlyOnIndex(),
            
        ];
    }
   
}