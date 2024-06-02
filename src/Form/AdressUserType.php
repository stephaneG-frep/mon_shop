<?php

namespace App\Form;

use App\Entity\Adress;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class AdressUserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstname', TextType::class, [
                'label' => "Votre prénom",
                'constraints' => [
                   new Length([
                      'min' => 2,
                      'max' => 30,
                   ])
              ],
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez votre prénom"
               ]
            ])
            ->add('lastname', TextType::class, [
                'label' => "Votre nom",
                'constraints' => [
                   new Length([
                      'min' => 2,
                      'max' => 30,
                   ])
              ],
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez votre nom"
               ]
            ])
            ->add('adress', TextType::class, [
                'label' => "Votre adresse",
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez votre adresse"
               ]
            ])
            ->add('postal', TextType::class, [
                'label' => "Votre code postal",
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez votre code postal"
               ]
            ])
            ->add('city', TextType::class, [
                'label' => "Votre ville",
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez le nom de votre ville"
               ]
            ])
            ->add('country', CountryType::class, [
                'label' => "Choisisser votre pays",
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Votre pays"
                ]
            ])
            ->add('phone', TextType::class, [
                'label' => "Votre téléphone",
                'attr' => [
                   'style' => "color: #539165; background: #AFD198",
                   'placeholder' => "Entrez votre téléphone"
               ]
            ])

            ->add('submit', SubmitType::class, [
                'label' => "Sauvegarder",
                'attr' => [
                   'style' => "background: #A10035; color: #FBA834"
                ]
            ])
            ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Adress::class,
        ]);
    }
}
