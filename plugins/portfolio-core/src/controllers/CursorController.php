<?php 

namespace tomfaust\craftportfoliocore\controllers;

use craft\web\Controller;
use Craft;
use craft\web\View;
use craft\elements\Entry;

Class CursorController extends Controller{

    protected int|bool|array $allowAnonymous = true;

    public function actionGetCursors(){
        $entryId = Craft::$app->request->getRequiredBodyParam('entryId');
        $entry = Entry::find()->id($entryId)->one();

        $cursorEntry = $entry->relatedEntries->one();
        if($cursorEntry){

            if($cursorEntry->normal->one() && $cursorEntry->pointer->one())

            return $this->asJson([
                'normal' => $cursorEntry->normal->one()->url,
                'pointer' => $cursorEntry->pointer->one()->url
            ]);
        }
        

    }

}