<?php 

namespace tomfaust\craftportfoliocore\controllers;

use craft\web\Controller;
use Craft;
use craft\web\View;
use craft\elements\Entry;

Class SpritesController extends Controller{

    protected int|bool|array $allowAnonymous = true;

    public function actionGetData(){
        $entries = Entry::find()->section('sprites')->all();

        $spritesObject = [];

        foreach($entries as $entry){

            $object = [];
            $object['weight'] = $entry->weight;

            foreach($entry->spriteOptions->all() as $spriteOption){

                $optionObject = [
                    "sprite" => $spriteOption->sprite->one()->url,
                    "delayRange" => [$spriteOption->minimumDelay,$spriteOption->maximumDelay]
                ];

                if($spriteOption->startFunction->value){
                    $optionObject['startFunction'] = $spriteOption->startFunction->value;
                }

                if($spriteOption->endFunction->value){
                    $optionObject['endFunction'] = $spriteOption->endFunction->value;
                }

                $object[$spriteOption->slug . "-" . $spriteOption->id] = $optionObject;
            }   

            $spritesObject[$entry->slug . "-" . $entry->id] = $object; 

        }

        return $this->asJson($spritesObject);
    }

}
