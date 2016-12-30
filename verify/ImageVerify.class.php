<?php
/**
 * Created by PhpStorm.
 * 图形验证码操作逻辑
 * User: Lee
 * Date: 2016-12-27
 * Time: 16:13
 */
class ImageVerify
{
    private $refererControl;
    private $cur_time;
    private $referer;

    private $_image;     // 验证码图片实例
    protected $config =	array(
        'defaultConfig' => array('imgNum'=>6,'excuseNum'=>0),
        'baseKey'      =>  'image_verify_',   // 验证码加密密钥
        'seKey'        =>  '',             // 验证码会话key
        'expire'       =>  60,            // 验证码过期时间（s）
        'basePath'     =>  'Uploads/Verify/',           // 图形库路径
        'promptType'   =>  1, // 提示语类型 1:纯文字 2:文字加图形
        'textH'        => 0, //验证码图片提示语高度
        'imageW'        => 0, //验证码图片宽度
        'imageH'        => 0, //验证码图片高度
        'textH1'         =>  30,//验证码图片类型1提示语高度
        'textH2'         =>  40,//验证码图片类型2提示语高度
        'itemW'         =>  30,//验证码图形单元宽度
        'itemH'         =>  50,//验证码图形单元高度
        'spacing'      =>  10,//验证码图形单元间隔
        'imgCount'     =>  6,//验证码图形单元数
        'lineCount'    =>  6,//验证码图形单元单行图形数
        'fontSize'    =>  12,//验证码提示语字体大小
        'font'        => '',//验证码提示语字体
    );


    /**
     * 架构方法 设置参数
     * @access public
     * @param  array $config 配置参数
     */
    public function __construct($config=array()){
        global $refererControl;
        $this->cur_time = time();
        $this->refererControl = $refererControl;
        $this->config   =   array_merge($this->config, $config);
    }

    /**
     * 使用 $this->name 获取配置
     * @access public
     * @param  string $name 配置名称
     * @return multitype    配置值
     */
    public function __get($name) {
        return $this->config[$name];
    }

    /**
     * 设置验证码配置
     * @access public
     * @param  string $name 配置名称
     * @param  string $value 配置值
     * @return void
     */
    public function __set($name,$value){
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }

    /**
     * 检查配置
     * @access public
     * @param  string $name 配置名称
     * @return bool
     */
    public function __isset($name){
        return isset($this->config[$name]);
    }

    /* 会话接口
     **********************************/
    private function getSession($key) {
        return isset($_SESSION[$key])?$_SESSION[$key]:null;
    }

    private function setSession($key, $value) {
        $_SESSION[$key] = $value;
    }

    public function setReferer($referer) {
        $referArr = array_keys($this->refererControl);
        if(in_array($referer, $referArr)){
            $this->referer = $referer;
            $this->seKey = $this->baseKey.$this->referer;
            if(empty($this->refererControl[$this->referer])) $this->refererControl[$this->referer] = $this->defaultConfig;
            return $this;
        }
        return $this;
    }

    /*从图形库随机获取验证图形数组
     **************************/
    private function getRandomImage($length) {
//        $imageVerifyModel = D("MyLib/ImageVerify");
//        $imageVerifyList = $imageVerifyModel->where(array('status'=>1))->order('rand()')->limit($length)->select();
        $imageVerifyList = array();
        $con = mysqli_connect("localhost","root","123456");
        if (!$con) die('Could not connect: ' . mysqli_error());
        mysqli_set_charset($con, 'utf8');
        mysqli_select_db($con,'imageVerify');

        $result = mysqli_query($con, "select * from ts_image_verify where status=1 order by rand() limit $length");
        while($row = mysqli_fetch_array($result)){
            array_push($imageVerifyList, $row);
        }
        mysqli_close($con);
        return $imageVerifyList;
    }

    /*获取验证码
     **************************/
    public function getVerify($length = 0) {
//        session($this->seKey, null);
        $config = $this->refererControl[$this->referer];
        if(empty($config)) return array('status'=>false, 'code'=>404);
        $token = $this->createToken($this->referer);
        $secode = $this->getSession($this->seKey);
        if($config['excuseNum']>0 && intval($secode['excuseNum'])<$config['excuseNum']){
            return array('status'=>true, 'code'=>200);//免验证
        }

        if(empty($length)){
            $length = $config['imgNum']?$config['imgNum']:5;//图形验证码个数顺序：1实参 2配置 3默认值
        }

        $imageVerifyList = $this->getRandomImage($length);
//        var_dump($imageVerifyList);exit;

        $randNum = rand(0,count($imageVerifyList)-1);
        $imageData = $this->getImageData($imageVerifyList, $randNum);

        $currVerify = array('verify_referer'=>$this->referer,'verify_time'=>$this->cur_time);
        if($secode['excuseNum']) $currVerify['excuseNum'] = $secode['excuseNum'];
        $currVerify['sPos'] = $imageData['sPos'];
        $currVerify['ePos'] = $imageData['ePos'];

        $this->setSession($this->seKey, $currVerify);

        return array('status'=>true, 'code'=>300, 'verifyImage'=>$imageData['image'],'imageSize'=>$imageData['imageSize'],'refreshArea'=>$imageData['refreshArea']);
    }

    protected function createToken($data){
        $digest=hash_hmac("sha256",$data,$this->baseKey);
        return $digest;
    }

    private function getImageData($imageVerifyList, $index) {
        $imgArr = array_column($imageVerifyList,'url');
        $imageVerify = $imageVerifyList[$index];
        $returnData = array();
        if(empty($imgArr)) return $returnData;

        $this->font = dirname(__FILE__) .'/font/ttf/msyh.ttf';

        $this->textH = $this->promptType == 1 ? $this->textH1 : $this->textH2;
        $this->imgCount = count($imgArr);
        if($this->lineCount > $this->imgCount) $this->lineCount = $this->imgCount;
        $this->imageW = ($this->itemW + $this->spacing*2)*$this->lineCount;
        $this->imageH = $this->textH + ceil($this->imgCount/$this->lineCount)*$this->itemH;

        $returnData['imageSize'] = array('width'=>$this->imageW,'height'=>$this->imageH);
        //创建画布
        $this->_image = imagecreate($this->imageW, $this->imageH);

        //配色板
        $white = imagecolorallocate($this->_image, 255, 255, 255);
        $grey = imagecolorallocate($this->_image, 150, 150, 150);
        $orange = imagecolorallocate($this->_image, 255, 109, 65);

        //画布着底色
        imagefilledrectangle($this->_image, 0, 0, $this->imageW, $this->imageH, $white);

        if($this->promptType == 1){
            //纯文字提示语
            $itemW = 16;
            $startW = $itemW;
            imagettftext($this->_image, $this->fontSize, 0, $startW, 20, $grey, $this->font, '请点击下图中的“');
            $startW += $itemW*8;
            imagettftext($this->_image, $this->fontSize, 0, $startW, 20, $orange, $this->font, $imageVerify['name']);
            $startW += $itemW * mb_strlen($imageVerify['name'],'utf-8');
            imagettftext($this->_image, $this->fontSize, 0, $startW, 20, $grey, $this->font, '”');
        }else{
            //文字+图形提示语
            $code = '请点击下图中的“        ”';
            imagettftext($this->_image, $this->fontSize, 0, $this->fontSize, 20, $grey, $this->font, $code);

            $imgHandler = imagecreatefrompng($imageVerify['url']); //获得验证码图片
            $imgW = imagesx($imgHandler);
            $imgH = imagesy($imgHandler);
            $baseW = 160;
            $startW = $baseW-($imgW/2);
            $startH = ($this->textH-$imgH)/4;
            imagecopy($this->_image, $imgHandler, $startW, $startH, 0, 0, $imgW, $imgH);
            imagedestroy($imgHandler);
        }

        $refreshImgPath = __DIR__.'/material/refresh.png';
        $imgHandler = imagecreatefrompng($refreshImgPath); //获得验证码图片
        $imgW = imagesx($imgHandler);
        $imgH = imagesy($imgHandler);
        $startH = 5;
        $startW = $this->imageW - $imgW - $startH;
        imagecopy($this->_image, $imgHandler, $startW, $startH, 0, 0, $imgW, $imgH);
        imagedestroy($imgHandler);
        $returnData['refreshArea'] = array(
            'sPos'=>array('x'=>$startW, 'y'=>$startH),
            'ePos'=>array('x'=>$startW+$imgW, 'y'=>$startH+$imgH)
        );

        //生成图形阵列
        foreach($imgArr as $i=>$img) {
            $imgHandler = imagecreatefrompng($img); //获得验证码图片
            $imgW = imagesx($imgHandler);
            $imgH = imagesy($imgHandler);
            $startW = ($this->itemW + $this->spacing*2)*($i%$this->lineCount) + $this->spacing + $this->itemW/2 - $imgW/2;
            $startH = $this->textH + floor($i/$this->lineCount)*$this->itemH + ($this->itemH - $imgH)/2;
            imagecopy($this->_image, $imgHandler, $startW, $startH, 0, 0, $imgW, $imgH);
            if($i == $index){
                $returnData['sPos'] = array('x'=>$startW, 'y'=>$startH);
                $returnData['ePos'] = array('x'=>$startW+$imgW, 'y'=>$startH+$imgH);
            }
            imagedestroy($imgHandler);
        }

        // 输出图像
        ob_start();
        imagepng($this->_image);
        imagedestroy($this->_image);
        $result = ob_get_contents();
        ob_end_clean();
        $returnData['image'] = 'data:image/png;base64,'.base64_encode($result);
        return $returnData;
    }

    //验证点击的坐标
    private function checkPosition($position, $sPos, $ePos) {
        if($position['x']>=$sPos['x'] && $position['x']<=$ePos['x'] && $position['y']>=$sPos['y'] && $position['y']<=$ePos['y']){
            return true;
        }
        return false;
    }

    private function getVerifyResult($result=true, $imageSize) {
        $returnData['status'] = boolval($result);

        //创建画布
        $image = imagecreate($imageSize['width'], $imageSize['height']);

        //配色板
        $white = imagecolorallocate($image, 255, 255, 255);
        $grey = imagecolorallocate($image, 150, 150, 150);
        $orange = imagecolorallocate($image, 255, 109, 65);

        //画布着底色
        imagefilledrectangle($image, 0, 0, $imageSize['width'], $imageSize['height'], $white);

        //文字+图形提示语
        $this->font = dirname(__FILE__) .'/font/ttf/msyh.ttf';
        if($returnData['status']){
            $code = '图形验证成功！';
            $iconImgPath = __DIR__.'/material/success.png';
            $color = $grey;
        }else{
            $code = '图形验证失败！';
            $iconImgPath = __DIR__.'/material/error.png';
            $color = $orange;
        }
        //验证结果图标
        $imgHandler = imagecreatefrompng($iconImgPath);
        $imgW = imagesx($imgHandler);
        $imgH = imagesy($imgHandler);
        $startW = ($imageSize['width']-$imgW-($this->fontSize + 4)*mb_strlen($code,'utf-8'))/2;
        $startH = ($imageSize['height']-$imgH)/2;
        imagecopy($image, $imgHandler, $startW, $startH, 0, 0, $imgW, $imgH);
        imagedestroy($imgHandler);
        //验证结果文字
        imagettftext($image, $this->fontSize, 0, $startW+$imgW+$this->fontSize, ($imageSize['height']+$this->fontSize)/2, $color, $this->font, $code);

        // 输出图像
        ob_start();
        imagepng($image);
        imagedestroy($image);
        $returnImg = ob_get_contents();
        ob_end_clean();
        $returnData['image'] = 'data:image/png;base64,'.base64_encode($returnImg);
        return $returnData;
    }

    /*验证图片
     **************************/
    public function verifyCode($pos, $imageSize) {
        $secode = $this->getSession($this->seKey);
        // 验证码不能为空
        if(empty($secode) || $secode['verify_result'] === false) {
            return $this->getVerifyResult(false, $imageSize);
        }
        // session 过期
        if($this->cur_time - $secode['verify_time'] > $this->expire) {
            return $this->getVerifyResult(false, $imageSize);
        }
//        var_dump($pos, $secode, $this->checkPosition($pos, $secode['sPos'], $secode['ePos']));exit;
        if($this->checkPosition($pos, $secode['sPos'], $secode['ePos'])) {
            $secode['verify_result'] = true;
            $this->setSession($this->seKey, $secode);
            return $this->getVerifyResult(true, $imageSize);
        }
        $secode['verify_result'] = false;
        $this->setSession($this->seKey, $secode);
        return $this->getVerifyResult(false, $imageSize);
    }

    public function checkVerify() {
        $config = $this->refererControl[$this->referer];
        if(empty($config)) return false;
        $secode = $this->getSession($this->seKey);;

        $currVerify = null;
        if($config['excuseNum']>0){
            $currVerify = array('excuseNum'=>intval($secode['excuseNum']));
            if($currVerify['excuseNum']<$config['excuseNum']){
                $currVerify['excuseNum']++;
                $this->setSession($this->seKey, $currVerify);
                return true;//免验证
            }
        }

        // 验证码不能为空
        if(empty($secode)) return false;

        $this->setSession($this->seKey, $currVerify);
        if($secode['verify_result'] && $secode['verify_referer'] == $this->referer){
            return true;
        }

        return false;
    }
}