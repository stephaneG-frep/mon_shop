<?php

namespace App\Form;

use App\Entity\Adress;
use App\Entity\Carrier;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
       
        $builder
            ->add('adresses', EntityType::class, [
                'label' => "Choisissez votre adresse de livraison",
                'attr' => [
                    'style' => "color: #E55604; background: #427D9D; padding: 10px 40px; max-width: 600px; margin: 0 auto; ",
                   
                ],
                'required' => true,
                'class' => Adress::class,
                'expanded' => true,
                'choices' => $options['adresses'],
                'label_html' => true,
            ])
            ->add('carriers', EntityType::class, [
                'label' => "Choisissez votre transporteur",
                'attr' => [
                    'style' => "color: #E55604; background: #4D4C7D; padding: 10px 40px; max-width: 600px; margin: 0 auto;",
                    
                ],
                'required' => true,
                'class' => Carrier::class,
                'expanded' => true,
                'label_html' => true,
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Valider",
                'attr' => [
                   'style' => "background: #A10035; color: #FBA834;",

                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'adresses' => null
        ]);
    }
}
