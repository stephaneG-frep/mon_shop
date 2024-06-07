<?php


namespace  App\Classe;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{
  
    public function send($to_email, $to_name, $subject, $template)
       {

        //Récupération du template
        $content = file_get_contents(dirname(__DIR__).'/Mail/'.$template);


        $mj = new Client($_ENV['MJ_APIKEY_PUBLIC'], $_ENV['MJ_APIKEY_PRIVATE'], true, ['version' => 'v3.1']);
        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => "stephanegaillet44@gmail.com",
                        'Name' => "Mon_shop"
                    ],
                    'To' => [
                        [
                            'Email' => "$to_email",
                            'Name' => "$to_name"
                        ]
                    ],
                    'TemplateID' => 6033636,
                    'TemplateLanguage' => true,
                    'Subject' => $subject,
                    'Variables' => [
                        'content' => $content
                    ],
                ]
            ]
        ];
          $mj->post(Resources::$Email, ['body' => $body]);

       }
}







?>