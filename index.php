<?php
/**
 * Created by PhpStorm.
 * User: Transn
 * Date: 2016-12-21
 * Time: 15:17
 */
error_reporting(0);
$refererControl = array(
    'login'=>array('imgNum'=>5,'excuseNum'=>5),
    'commonLogin'=>array('imgNum'=>12,'excuseNum'=>0),
    'reg'=>array('imgNum'=>6,'excuseNum'=>5),
    'findpwd'=>array('imgNum'=>6,'excuseNum'=>5),
    'userInfo'=>array('imgNum'=>6,'excuseNum'=>0)
);
include_once "./verify/ImageVerify.class.php";
session_start();



//$referer = $_SERVER['HTTP_REFERER'];
//$shortRefer = I('get.refer','','trim');
$action = $_REQUEST['action'];


switch($action){
    case 'imageVerify':
        $referer = $_REQUEST['referer'];

        $config = array('promptType'=>1);
        $imageVerifyLogic = new ImageVerify($config);
        $data = $imageVerifyLogic->setReferer($referer)->getVerify();
        header("Content-Type:text/html; charset=utf-8");
        die(json_encode($data));
        break;
    case 'verifyCode':
        $referer = $_REQUEST['referer'];
        $pos = $_REQUEST['click'];
        $imageSize = $_REQUEST['imgSize'];

        $imageVerifyLogic = new ImageVerify();
        $res = $imageVerifyLogic->setReferer($referer)->verifyCode($pos, $imageSize);
        if(!$res['status']) $res['msg'] = '图形验证码错误';
        header("Content-Type:text/html; charset=utf-8");
        die(json_encode($res));
        break;
    case 'submit':
        $referer = $_REQUEST['referer'];
        $imageVerifyLogic = new ImageVerify();
        $res = $imageVerifyLogic->setReferer($referer)->checkVerify();
        var_dump($res);
        break;
}
