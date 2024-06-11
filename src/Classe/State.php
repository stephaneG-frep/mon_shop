<?php
// en fonction du statut de la commande la classe State est mise en relation avec OrderCrudController
namespace App\Classe;

 class State
 {
     public const STATE = [
        '3' => [
            'label' => 'En préparation',
            'email_subject' => 'Commande en cours de préparation',
            'email_template' => 'order_state_3.html',
        ],

        '4' => [
            'label' => 'Expédiée',
            'email_subject' => 'Commande expédiée',
            'email_template' => 'order_state_4.html',
        ], 

        '5' => [
            'label' => 'Annulée',
            'email_subject' => 'Commande annulée',
            'email_template' => 'order_state_5.html',
        ]

    ];
 }