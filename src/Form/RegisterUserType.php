<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class RegisterUserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'label' => "Votre Email",
                'attr' => [
                    'style' => "color: #028391; background: #AFD198",
                    'placeholder' => "Entrez votre Email exemple:dugenou@quiclac.com"
                ]
            ])
            ->add('PlainPassword', RepeatedType::class, [
                'type' => PasswordType::class,
                'constraints' => [
                     new Length([
                        'min' => 4,
                        'max' => 30,
                     ])
                ],
                'first_options'  => [
                    'label' => 'Votre mot de passe',
                    'attr' => [
                        'style' => "color: #E1F7F5; background: #AFD198 ",
                        'placeholder' => "Entrez votre mot de passe"
                    ],
                     'hash_property_path' => 'password'
                ],
                
                'second_options' => [
                    'label' => 'Confirmez votre mot de passe',
                    'attr' => [
                        'style' => "color: #E1F7F5; background: #AFD198",
                        'placeholder' => "Confirmez votre mot de passe"
                    ],
                ],
                'mapped' => false,
            ])
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
                 'label' => "votre nom",
                 'constraints' => [
                    new Length([
                       'min' => 2,
                       'max' => 30,
                    ])
               ],
                 'attr' => [
                    'style' => "color: #D96098; background: #AFD198",
                    'placeholder' => "Entrez votre nom"
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Envoyer",
                'attr' => [
                   'style' => "background: #A10035; color: #FBA834"
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'constraints' => [
                new UniqueEntity([
                    'entityClass' => User::class,
                    'fields' => 'email'
                ])
            ],
            'data_class' => User::class,
        ]);
    }
}
