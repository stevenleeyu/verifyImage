/**
 * Created by Lee on 2016-12-29.
 */
function getClickPos(e, id){
    //find the screen location of an element
    function getLocation(element, type){
        offsetTotal = type == 'y' ? element.offsetTop : element.offsetLeft;
        scrollTotal = 0; //element.scrollTop but we dont want to deal with scrolling - already in page coords

        if (element.tagName != "BODY"){
            if (element.offsetParent != null){
                return offsetTotal+scrollTotal+getLocation(element.offsetParent, type);
            }
        }
        return offsetTotal+scrollTotal;
    }

    var xPage = (navigator.appName == 'Netscape')? e.pageX : event.x+document.body.scrollLeft;
    var yPage = (navigator.appName == 'Netscape')? e.pageY : event.y+document.body.scrollTop;
    identifyImage = document.getElementById(id);
    img_x = getLocation(identifyImage, 'x');
    img_y = getLocation(identifyImage, 'y');
    return {x:xPage-img_x, y:yPage-img_y};
}

function imageVerify(domObj, interface){
    this.container = domObj;
    this.interface = interface;
    this.imageSize = {};
    this.checkRefresh = function(clickPos, sPos, ePos){
        if(clickPos.x>=sPos.x && clickPos.x<=ePos.x && clickPos.y>=sPos.y && clickPos.y<=ePos.y){
            return true;
        }
        return false;
    };
}

imageVerify.prototype.reload = function() {
    var _this = this;
    var _container = this.container;
    $.ajax({
        url:this.interface.getImageUrl,
        type: "POST",
        timeout: 60000,
        data: {referer:this.interface.referer},
        dataType: "json",
        beforeSend: function(XMLHttpRequest) {

        },
        success: function (data) {
            if(data.status){
                if(data.code == 300){
                    _this.imageSize = data.imageSize;
                    _container.empty();
                    var html = '<a href="javascript:void(0);" class="vImg"><img id="vImg" src="'+data.verifyImage+'" title="" alt=""></a>';

                    var _imageDom = $(html);
                    _imageDom.find('#vImg').off("click").click(function(event){
                        var _pos = getClickPos(event, "vImg");
                        if(_this.checkRefresh(_pos, data.refreshArea.sPos, data.refreshArea.ePos)){
                            _this.reload();
                        }else{
                            _this.verifyCode(_pos);
                        }
                    });
                    _imageDom.appendTo(_container);
                    _container.show();
                }else if(data.code == 200){
                    _container.hide();
                }
            }else{
                _container.hide();
            }
        }
    });
}

imageVerify.prototype.verifyCode = function(_pos) {
    var _this = this;
    var _container = this.container;
    $.ajax({
        url:this.interface.verifyImageUrl,
        type: "POST",
        timeout: 60000,
        data: {referer:this.interface.referer,click:_pos,imgSize:_this.imageSize},
        dataType: "json",
        beforeSend: function(XMLHttpRequest) {

        },
        success: function (data) {
            if(data.status){
                $('#vImg').attr('src',data.image).off("click");
                _container.fadeOut("slow");
            }else{
                if(data.msg){
                    console.log(data.msg);
                }
                $('#vImg').attr('src',data.image).off("click");
                setTimeout(function(){
                    _this.reload();
                },1000)

            }
        }
    });
}
