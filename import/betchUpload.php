<?php
//echo "<meta http-equiv=\"content-type\" content=\"text/html\" charset=\"gb2312\" />";
/**
 * Created by PhpStorm.
 * User: Transn
 * Date: 2016-12-22
 * Time: 15:43
 */
define('UPLOAD_IMG','http://127.0.0.1/we/admin/verify/add');
function upload_curl_pic($file)
{
    $url  = UPLOAD_IMG;
    $name = substr($file, 0, strrpos($file, '.'));
    $uploaddir = getcwd();
    $filename = $uploaddir.'/images/'.$file;
    $fields['name'] = iconv('gb2312', 'utf-8', $name);

    $ch = curl_init($url);

    $cfile = curl_file_create($filename);
    $fields['image'] = $cfile;
//    $filename = iconv('utf-8', 'gb2312', $filename);
//        var_dump($cfile, $filename, filesize($filename), $cfile, $fields);exit;

    curl_setopt($ch, CURLOPT_POST,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
    curl_setopt($ch, CURLOPT_INFILESIZE,filesize($filename));

    ob_start();
    curl_exec($ch);
    $result = ob_get_contents();
    ob_end_clean();
    curl_close($ch);
    return $result;
}

function tree($directory)
{
    $mydir = dir($directory);
    while($file = $mydir->read())
    {
        if(($file!=".") AND ($file!="..")){
            if((is_file("$directory/$file")))
            {
                echo "<li>$file</li>\n";
                $return = upload_curl_pic($file);
                echo "<li>$return</li>\n";
            }
        }

    }
    echo "</ul>\n";
    $mydir->close();
}

tree('./images');

//$src = upload_curl_pic($file);
//echo $src;