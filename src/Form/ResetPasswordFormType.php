<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class ResetPasswordFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
            
        $builder
        ->add('PlainPassword', RepeatedType::class, [
            'type' => PasswordType::class,
            'constraints' => [
                 new Length([
                    'min' => 4,
                    'max' => 30,
                 ])
            ],
            'first_options'  => [
                'label' => 'Votre nouveau mot de passe',
                'attr' => [
                    'style' => "color: #E1F7F5; background: #AFD198 ",
                    'placeholder' => "Entrez votre nouveau mot de passe"
                ],
                 'hash_property_path' => 'password'
            ],
            
            'second_options' => [
                'label' => 'Confirmez votre nouveau mot de passe',
                'attr' => [
                    'style' => "color: #E1F7F5; background: #AFD198",
                    'placeholder' => "Confirmez votre nouveau mot de passe"
                ],
            ],
            'mapped' => false,
        ])        
        
        ->add('submit', SubmitType::class, [
            'label' => "Envoyer mon nouveau mot de passe",
            'attr' => [
               'style' => "background: #A10035; color: #FBA834"
            ]
        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
