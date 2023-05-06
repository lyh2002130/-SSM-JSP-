/**
 * Created by ow on 2017/9/17.
 */
/**
 * 评价星星
 */
var s1=document.getElementById('star1');
var s2=document.getElementById('star2');
var s3=document.getElementById('star3');
var s4=document.getElementById('star4');
var s5=document.getElementById('star5');
var n=document.getElementById('num');


s1.on = function () {
    s1.style.backgroundColor="#666";
    n.innerHTML=1;
}
s1.onmouseout=function(){
    s1.style.backgroundColor="#fff";
    n.innerHTML=0;

}
s1.onmousedown= function () {
    s1.style.display="hidden";
    s1.innerHTML="<span id='star11' class='pstar'>"+"</span>";
    document.getElementById('star11').style.width="20px";
    document.getElementById('star11').style.height="20px";
    document.getElementById('star11').style.backgroundColor="red";
    document.getElementById('star11').style.zIndex=99;
    n.innerHTML="<span id='n1'></span>";
}



s2.onmouseover= function () {
    s1.style.backgroundColor="#666";
    s2.style.backgroundColor="#666";
    n.innerHTML=2;
}
s2.onmouseover= function () {
    s1.style.backgroundColor="#ee6";
    s2.style.backgroundColor="#ee6";
    s3.style.backgroundColor="#ee6";
    n.innerHTML=3;
}

