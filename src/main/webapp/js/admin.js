/**
 * Created by Administrator on 2019/10/20.
 */
var n=0;
function setImagePreviews() {
    var oList = document.getElementById('list');
    var oInput=document.getElementById('files');
    var ni=document.getElementById('ni');
    var fi=document.getElementById('fi');
    oList.innerHTML += "";
    var fileList = oInput.files;
    n+=fileList.length;
    if(n<=10){
        for (var i = 0; i < fileList.length; i++) {
            if (oInput.files && oInput.files[i]) {
                createLi(window.URL.createObjectURL(oInput.files[i]));
                // console.log(oInput.files[i].name);
            }
        }
        ni.innerHTML=n;
        fi.innerHTML=10-n;
    }else{
        ni.innerHTML=10;
        fi.innerHTML=0;
    }

    function createLi(ImgSrc) {
        var oLi = document.createElement('li');
        var oImg = document.createElement('img');
        oImg.src = ImgSrc;
        oLi.appendChild(oImg);
        oList.appendChild(oLi);
    }
}