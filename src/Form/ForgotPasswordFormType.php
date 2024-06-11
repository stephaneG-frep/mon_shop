<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ForgotPasswordFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'label' => "Votre adresse mail",
                'help' => "Vous receverez votre nouveau mot de passe par mail.",
                'attr' => [
                    'style' => "color: #BED1CF",
                    'placeholder' => 'email@exemple.fr',
                    
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Réinitialiser",
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
