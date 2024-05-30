<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class RegisterUserTest extends WebTestCase
{
    public function testSomething(): void
    {

        /*
        * 1. Créer un faux client(navigateur) de pointer vers une URL
        * 2. Remplire le formulaire 
        * 3. le test regarde si le message alert est bien là ( votre compte à bien été crée ....)
        */

        // 1.
        $client = static::createClient();
        $client->request('GET', '/inscription');

        // 2.
        $client->submitForm('Envoyer', [
            'register_user[email]'=> 'peter@parker.fr',
            'register_user[PlainPassword][first]' => 'peter',
            'register_user[PlainPassword][second]' => 'peter',
            'register_user[firstname]' => 'Peter',
            'register_user[lastname]' => 'Parker',

        ]);

        // FOLLOW
        $this->assertResponseRedirects('/connexion');
        $client->followRedirect();

        // 3. 
        $this->assertSelectorExists('div:contains("Votre compte a bien été crée...")');


    }
}
