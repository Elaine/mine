var totalwishes=100;
var Drag={};
Drag.isdraging=false;
Drag.dragobj=null;
Drag.lastX=0;
Drag.lastY=0;
Drag.topIndex=1;
var lstIndex=0;
var lsttoname="";
var lstcontent="";

function pInit(){
	if(document.body.onselectstart) document.body.onselectstart=function(){return false};
	if(window.onselect) Event.observe(window,"select",function(){return false});
	for(i=0;i<totalwishes;i++){
		if(typeof($("wish_"+i))!="undefined"){
			$("wish_"+i).style.left=((screen.width-778)/2+Math.random()*460)+"px";
			$("wish_"+i).style.top=(190+Math.random()*280)+"px";
			Event.observe($("wish_"+i),"dblclick",wish_close);
			Event.observe($("btn_close_"+i),"click",wish_close);
			Event.observe($("wish_"+i),"mousedown",wish_drag_start);
			//Event.observe($("wish_"+i),"mouseover",wish_drag_onforse);
			Event.observe(window.document,"mouseup",wish_drag_end,false);
			Event.observe(window.document,"mousemove",wish_drag_move,true);
			lstIndex++;
		}
	}
}

function wish_close(evt){
	var ele=Event.element(evt);
		while(ele=ele.parentNode){
		if(ele.className && ele.className.indexOf("xy0")>-1) {ele.style.display="none";break;}
	}
}

/*
function wish_drag_onforse(evt){
	var obj=Event.element(evt);
	while(obj=obj.parentNode){
		if(obj)	if(obj.className.indexOf("xy0")>-1) {Drag.dragobj=obj;break;}
			else break;
	}
	if(Drag.dragobj.style.zIndex<Drag.topIndex) Drag.dragobj.style.zIndex=++Drag.topIndex;
}
*/

function wish_drag_start(evt){
	Drag.isdraging=true;
	var obj=Event.element(evt);
	while(obj=obj.parentNode){
		if(obj.className)
			if(obj.className.indexOf("xy0")>-1) {Drag.dragobj=obj;break;}
	}
	if(obj && obj.className && Drag.dragobj.style.zIndex<Drag.topIndex)Drag.dragobj.style.zIndex=++Drag.topIndex;
	if(obj && obj.className){
	Drag.dragobj.style.cursor="move";
	Drag.lastX=Event.pointerX(evt);
	Drag.lastY=Event.pointerY(evt);
	Event.stop(evt);
	}
}

function wish_drag_move(evt){
	if (!Drag.isdraging||Drag.dragobj==null) return;
	window.scroll(0,0);
	var _left=Math.abs(getRealLeft(Drag.dragobj))+document.body.scrollLeft;
	var _top=Math.abs(getRealTop(Drag.dragobj))+document.body.scrollTop;

if(_left+Event.pointerX(evt)-Drag.lastX>0&&_left+Event.pointerX(evt)-Drag.lastX<screen.width-Drag.dragobj.offsetWidth)Drag.dragobj.style.left=parseInt(_left+Event.pointerX(evt)-Drag.lastX)+"px";
	if(_top+Event.pointerY(evt)-Drag.lastY>0&&_top+Event.pointerY(evt)-Drag.lastY<screen.height-Drag.dragobj.offsetHeight)Drag.dragobj.style.top=parseInt(_top+Event.pointerY(evt)-Drag.lastY)+"px";
	Drag.lastX=Event.pointerX(evt);
	Drag.lastY=Event.pointerY(evt);
}

function wish_drag_end(evt){
	if(Drag.dragobj)Drag.dragobj.style.cursor="";
	Drag.isdraging=false;
	Drag.dragobj=null;
	Drag.lastX=0;
	Drag.lastY=0;
	Event.stop(evt);
}

function getRealLeft(o){
	var l=o.offsetLeft-o.scrollLeft;
	while(o=o.offsetParent){
		l+=o.offsetLeft-o.scrollLeft;
	}
	return(l);
}

function getRealTop(o){
	var t=o.offsetTop-o.scrollTop;
	while(o=o.offsetParent){
		t+=o.offsetTop-o.scrollTop;
	}
	return(t);
}

var type=1;
function saveWish(frm){

	//if(!validateStandard(frm,'error')) return false;
	var content;
	var toname="";
	var iclass;
	iclass=frm.txtclass.value;
	if(frm.wtype){
		for(i=0;i<frm.wtype.length;i++){
			if(frm.wtype.item(i).checked=="checked"||frm.wtype.item(i).checked==true)type=frm.wtype.item(i).value;
		}
	}
	if(frm.toname) toname=frm.toname.value.replace("&","");
	content=frm.content.value.replace("&","");
	lsttoname=toname;lstcontent=content;
	$('btnSave').disabled="disabled";
	jx("/wish_save.php","type="+type+"&class="+iclass+"&toname="+toname+"&content="+content,"post",callback,1);
}

function callback(rt){
	r=rt.responseText;
	if(r=="-1") {wishDlg.close();loginDlg.show();return }
	if(r!=""&&r!="0"){
		addWish(r,lsttoname,lstcontent);
		frm=$("saveform");
		if(frm.toname)frm.toname.value="";
		if(frm.content)frm.content.value="";
	}
	$('btnSave').disabled="";
	wishDlg.close();
}

function addWish(fromname,toname,content){
	lstIndex++;
	oDiv=document.createElement("div");
	oDiv.id="wish_"+lstIndex;
	oDiv.className="xy0"+type;
	$("wishes").appendChild(oDiv);
	var now=new Date();

		oDiv.innerHTML='<div class="xytitle">第['+lstIndex+']条 '+now.toLocaleString()+' </div><div class="xyclose" id="btn_close_'+lstIndex+'"><img src="../../image/blog/qyclose.gif" width="13" height="18" /></div><div class="xymain">'+content+'</div><div class="xyuser">'+fromname+(toname==""?"":" TO: "+toname)+'</div>';
	
	$("wish_"+lstIndex).style.left=((screen.width-778)/2+Math.random()*460)+"px";
	$("wish_"+lstIndex).style.top=(190+Math.random()*280)+"px";
	Event.observe($("wish_"+lstIndex),"dblclick",wish_close);
	Event.observe($("btn_close_"+lstIndex),"click",wish_close);
	Event.observe($("wish_"+lstIndex),"mousedown",wish_drag_start);
	Event.observe(window.document,"mouseup",wish_drag_end);
	Event.observe(window.document,"mousemove",wish_drag_move);
	//Event.observe($("wish_"+i),"mouseover",wish_drag_onforse);

}