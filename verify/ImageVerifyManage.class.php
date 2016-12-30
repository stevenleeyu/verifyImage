<?php
/**
 * Created by PhpStorm.
 * 图形验证码图形库管理
 * User: Lee
 * Date: 2016-12-29
 * Time: 10:56
 */
class ImageVerifyManage
{
    /*获取图片验证码列表
	@param $name 名称
	@param $status 状态(1:正常,2:停用)
	@param $page 页码
	@param $pageSize 每页大小
	return array
	************************************/
    public function getList($name,$status=0,$page=1,$pageSize='All'){
        if(!empty($name))$where['name']=array('like','%'.$name.'%');
        if($status>0)$where['status']=$status;
        $imageVerifyModel = D('MyLib/ImageVerify');
        if($pageSize=='All'){
            $list=$imageVerifyModel->where($where)->select();
        }else{
            $list=$imageVerifyModel->where($where)->page($page,$pageSize)->select();
        }
        $total=$imageVerifyModel->where($where)->count();
        return array(
            'list'=>$list,
            'total'=>$total
        );
    }

    /*获取图片验证码
	 @param $id 查询条件
	 @return array $imageVerify
	 */
    public static function getOne($id){
        $imageVerifyModel = D('MyLib/ImageVerify');
        $imageVerify = $imageVerifyModel->find($id);
        return $imageVerify;
    }

    /*上传图片
     **************************/
    private function uploadImage($file) {
        //if()
        if(!is_dir($this->basePath)){
            CheckDir($this->basePath);//创建文件夹
        }
        $config = array(
            'maxSize'=>1024*1024,
            'exts'=>array('jpg','gif','png','jpeg'),
            'rootPath'=>$this->basePath,
            'subName' =>array('date','Ym')
        );
        $upload = new \Think\Upload($config);
        $info = $upload->uploadOne($file);
        return $info;
    }

    /*添加图片验证码
     **************************/
    public function createImage($name, $file) {
        $imageVerifyModel = D("MyLib/ImageVerify");
        if(empty($name)) return array('status'=>1,'msg'=>L('图形名称不能为空'));
        if($imageVerifyModel->where(array('name'=>$name,'status'=>1))->find()) return array('status'=>1,'msg'=>L('图形名称不能重复'));
        $imageInfo = $this->uploadImage($file);
        if(!$imageInfo)  return array('status'=>1,'msg'=>L('图形文件上传失败'));
        $data = array(
            'code'=>md5($imageInfo['md5']),
            'name'=>$name,
            'url'=>$this->basePath . $imageInfo['savepath'] . $imageInfo['savename'],
        );
        if ($imageVerifyModel->data($data)->add()){
            $info = array('status'=>0,'msg'=>L('添加图片验证码成功'));
        }else{
            $info = array('status'=>1,'msg'=>L('添加图片验证码失败'));
        }
        return $info;
    }

    /*修改图片验证码
     **************************/
    public function updateImage($data, $file=array()) {
        $imageVerifyModel = D("MyLib/ImageVerify");
        if(empty($data['id'])) return array('status'=>1,'msg'=>L('表单有无，请联系管理员'));
        $id = $data['id'];
        unset($data['id']);
        if(!empty($file)){
            $imageInfo = $this->uploadImage($file);
            if(!$imageInfo)  return array('status'=>1,'msg'=>L('图形文件上传失败'));
            $data['code'] = md5($imageInfo['md5']);
            $data['url'] = $this->basePath . $imageInfo['savepath'] . $imageInfo['savename'];
        }

        if ($imageVerifyModel->where(array('id' => $id))->save($data)){
            $info = array('status'=>0,'msg'=>L('修改图片验证码成功'));
        }else{
            $info = array('status'=>1,'msg'=>L('修改图片验证码失败'));
        }
        return $info;
    }

    /*删除图片验证码
     **************************/
    public function deleteImage() {}
}