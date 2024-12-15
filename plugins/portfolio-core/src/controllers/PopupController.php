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

        $snakeTitle = $this->sanitizeString($entry->title);

        $html = Craft::$app->view->renderTemplate('_system-windows/pages/' . $entry->contentId, [
            'entryTitle' => $entry->title,
            'snakeTitle' => $snakeTitle,
            'contentId' => $entry->contentId,
            'layout' => $entry->windowType,
            'titleIcon' => $entry->windowIcon->one()->getUrl()
        ]);

        return $this->asJson([
            'title' => $snakeTitle,
            'content' => $html,
            'icon' => $entry->windowIcon->one()->getUrl()
        ]);
    }

    private function sanitizeString($input) {
        // Remove special characters
        $sanitized = preg_replace('/[^a-zA-Z0-9\s]/', '', $input);
    
        // Replace spaces with underscores
        $sanitized = str_replace(' ', '_', $sanitized);
    
        return strtolower($sanitized);
    }

}