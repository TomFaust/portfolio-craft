<?php 

namespace tomfaust\craftportfoliocore\controllers;

use craft\web\Controller;
use Craft;
use craft\web\View;
use craft\elements\Entry;

Class PopupController extends Controller{

    protected int|bool|array $allowAnonymous = true;

    public function actionGetContent(){

        $entryId = Craft::$app->request->getRequiredBodyParam('entryId');
        $entry = Entry::find()->id($entryId)->one();

        if(!$entry){
            return null;
        }

        $html = Craft::$app->view->renderTemplate('_system-windows/pages/' . $entry->contentId, [
            'title' => $entry->contentId,
            'layout' => $entry->windowType,
            'titleIcon' => $entry->windowIcon->one()->getUrl()
        ]);

        return $this->asJson([
            'title' => $entry->contentId,
            'content' => $html,
            'icon' => $entry->windowIcon->one()->getUrl()
        ]);
    }

}