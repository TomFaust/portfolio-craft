<?php

namespace tomfaust\craftsystemwindows\controllers;

use craft\web\Controller;
use Craft;
use craft\web\View;

Class PopupController extends Controller{

    protected int|bool|array $allowAnonymous = true;

    public function actionGetContent(){

        $page = Craft::$app->request->getBodyParam('page');
        $layout = Craft::$app->request->getBodyParam('layout');

        $html = Craft::$app->view->renderTemplate('_system-windows/pages/' . $page, ['layout' => $layout]);

        return $html;
    }

}