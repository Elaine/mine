document.domain = "abang.com";
uy='abang.com';if(!this.uz)uz=uy
function ze(p,c){var e,r='',i=c.indexOf(p);if(i<0)return r
i+=p.length;e=c.indexOf(";",i);if(e<0)e=c.length
r=c.substring(i,e);return r}
function zc(o,p,v,m,d){var eD=new Date(),Dt,iV,D=';Path=/;Domain='+d+'.'+uz+';Expires='
if(o){eD.setTime(eD.getTime()+(60000*m))
Dt=eD.toGMTString()
document.cookie=p+v+D+Dt;return v}
if(!document.cookie)return ''
return ze(p,document.cookie)}

/*标签*/

//home_flash()_start(flash valid or invalid)
var i_flash;
//var v_flash;
if(navigator.userAgent.indexOf("MSIE")>0)
{
	try
	{
	var flashObject=new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
	if(typeof flashObject == "object")
	{
		i_flash=true;
		//v_flash = hex(flashObject.FlashVersion())
	}
	}
	catch(e){}
}
else
if (navigator.plugins)
{
	for (var i=0; i < navigator.plugins.length; i++)
	{
	//alert(navigator.plugins[i].name);
		if (navigator.plugins[i].name.toLowerCase().indexOf("shockwave flash") >= 0)
		{
			i_flash = true;
			//v_flash = navigator.plugins[i].description.substring(navigator.plugins[i].description.toLowerCase().lastIndexOf("flash ") + 6, navigator.plugins[i].description.length);
		}
	}
}
// -->
//home_flash_end

//加入收藏
function addfavorite()
{
   if (document.all)
   {
      window.external.addFavorite('http://www.abang.com','阿邦网');
   }
   else if (window.sidebar)
   {
      window.sidebar.addPanel('阿邦网', 'http://www.abang.com', "");
   }
} 



//设为首页
function setHomePage(){
if(window.netscape){
try { 
netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
} 
catch (e) {}}
var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
prefs.setCharPref('browser.startup.homepage','http://www.abang.com');
}

function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
                        } 
                        catch (e) { 
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]设置为'true'"); 
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}


//轮播页面
function pagediv(){
	var how_many_ads = 3;   
	var now = new Date()
	var sec = now.getSeconds()
	var i = sec % how_many_ads;
	i +=1;
	//alert(ad);
	if (i==1) {
	document.getElementById("box_con0").style.display="block";
	document.getElementById("box_con1").style.display="none";
	document.getElementById("box_con2").style.display="none";
	}
	else if (i==2) {
	document.getElementById("box_con0").style.display="none";
	document.getElementById("box_con1").style.display="block";
	document.getElementById("box_con2").style.display="none";
	}
	else {
	document.getElementById("box_con0").style.display="none";
	document.getElementById("box_con1").style.display="none";
	document.getElementById("box_con2").style.display="block";
	}
}


// add(2008-05改版)

// 首页/
function showFocus(num)
{
 for(var id = 1;id<=4;id++)
 {
  var fpid="focusPic"+id;
  //var fcid="focusContent"+id;
  var fcid="focusBg";
  var fnid="focusnav"+id;
  if(id==num){
  	try{document.getElementById(fpid).style.display="block"}catch(e){};
	//try{document.getElementById(fcid).style.display="block"}catch(e){};
	try{document.getElementById(fnid).className="span_b span01"}catch(e){};
  }else{
	try{document.getElementById(fpid).style.display="none"}catch(e){};
	//try{document.getElementById(fcid).style.display="none"}catch(e){};
	try{document.getElementById(fnid).className="span_b span02"}catch(e){};
  }
 } 
 if(num==1){document.getElementById(fcid).className="focus01";}
 if(num==2){document.getElementById(fcid).className="focus02";}
 if(num==3){document.getElementById(fcid).className="focus03";}
 if(num==4){document.getElementById(fcid).className="focus04";}
}

// SwichTab
function SwichTab(tabName,btnId,tabNumber){
	for(i=0;i<tabNumber;i++){
		document.getElementById(tabName+"_c0"+i).style.display = "none";
		document.getElementById(tabName+"_btn"+i).className = "no_on";
	}
	document.getElementById(tabName+"_c0"+btnId).style.display = "block";
	document.getElementById(tabName+"_btn"+btnId).className = "is_on";
	
}

// act-guide
function vidiexp(id){
	for(i=0;i<5;i++){
		document.getElementById("vidi_"+i).className = "";
	};
	document.getElementById("vidi_"+id).className = "big";
};

// act-guide2
function vidiexpp(id){
	for(i=0;i<5;i++){
		document.getElementById("vidii_"+i).className = "";
	};
	document.getElementById("vidii_"+id).className = "big";
};

//index_marquee
function Marquee()
{
	this.ID = document.getElementById(arguments[0]);
	if(!this.ID)
	{
		this.ID = -1;
		return;
	}
	this.Direction = this.Width = this.Height = this.DelayTime = this.WaitTime = this.Correct = this.CTL = this.StartID = this.Stop = this.MouseOver = 0;
	this.Step = 1;
	this.Timer = 30;
	this.DirectionArray = {"top":0 , "bottom":1 , "left":2 , "right":3};
	if(typeof arguments[1] == "number" || typeof arguments[1] == "string")this.Direction = arguments[1];
	if(typeof arguments[2] == "number")this.Step = arguments[2];
	if(typeof arguments[3] == "number")this.Width = arguments[3];
	if(typeof arguments[4] == "number")this.Height = arguments[4];
	if(typeof arguments[5] == "number")this.Timer = arguments[5];
	if(typeof arguments[6] == "number")this.DelayTime = arguments[6];
	if(typeof arguments[7] == "number")this.WaitTime = arguments[7];
	if(typeof arguments[8] == "number")this.ScrollStep = arguments[8]
	this.ID.style.overflow = this.ID.style.overflowX = this.ID.style.overflowY = "hidden";
	this.ID.noWrap = true;
	this.IsNotOpera = (navigator.userAgent.toLowerCase().indexOf("opera") == -1);
	if(arguments.length >= 7)this.Start();
}


Marquee.prototype.Start = function()
{
	if(this.ID == -1)return;
	if(this.WaitTime < 800)this.WaitTime = 800;
	if(this.Timer < 20)this.Timer = 20;
	if(this.Width == 0)this.Width = parseInt(this.ID.style.width);
	if(this.Height == 0)this.Height = parseInt(this.ID.style.height);
	if(typeof this.Direction == "string")this.Direction = this.DirectionArray[this.Direction.toString().toLowerCase()];
	this.HalfWidth = Math.round(this.Width / 2);
	this.HalfHeight = Math.round(this.Height / 2);
	this.BakStep = this.Step;
	this.ID.style.width = this.Width + "px";
	this.ID.style.height = this.Height + "px";
	if(typeof this.ScrollStep != "number")this.ScrollStep = this.Direction > 1 ? this.Width : this.Height;
	var msobj = this;
	var timer = this.Timer;
	var delaytime = this.DelayTime;
	var waittime = this.WaitTime;
	msobj.StartID = function(){msobj.Scroll()}
	msobj.Continue = function()
				{
					if(msobj.MouseOver == 1)
					{
						setTimeout(msobj.Continue,delaytime);
					}
					else
					{	clearInterval(msobj.TimerID);
						msobj.CTL = msobj.Stop = 0;
						msobj.TimerID = setInterval(msobj.StartID,timer);
					}
				}

	msobj.Pause = function()
			{
				msobj.Stop = 1;
				clearInterval(msobj.TimerID);
				setTimeout(msobj.Continue,delaytime);
			}

	msobj.Begin = function()
		{
			msobj.ClientScroll = msobj.Direction > 1 ? msobj.ID.scrollWidth : msobj.ID.scrollHeight;
			if((msobj.Direction <= 1 && msobj.ClientScroll <= msobj.Height + msobj.Step) || (msobj.Direction > 1 && msobj.ClientScroll <= msobj.Width + msobj.Step))return;
			msobj.ID.innerHTML += msobj.ID.innerHTML;
			msobj.TimerID = setInterval(msobj.StartID,timer);
			if(msobj.ScrollStep < 0)return;
			msobj.ID.onmousemove = function(event)
						{
							if(msobj.ScrollStep == 0 && msobj.Direction > 1)
							{
								var event = event || window.event;
								if(window.event)
								{
									if(msobj.IsNotOpera)
									{
										msobj.EventLeft = event.srcElement.id == msobj.ID.id ? event.offsetX - msobj.ID.scrollLeft : event.srcElement.offsetLeft - msobj.ID.scrollLeft + event.offsetX;
									}
									else
									{
										msobj.ScrollStep = null;
										return;
									}
								}
								else
								{
									msobj.EventLeft = event.layerX - msobj.ID.scrollLeft;
								}
								msobj.Direction = msobj.EventLeft > msobj.HalfWidth ? 3 : 2;
								msobj.AbsCenter = Math.abs(msobj.HalfWidth - msobj.EventLeft);
								msobj.Step = Math.round(msobj.AbsCenter * (msobj.BakStep*2) / msobj.HalfWidth);
							}
						}
			msobj.ID.onmouseover = function()
						{
							if(msobj.ScrollStep == 0)return;
							msobj.MouseOver = 1;
							clearInterval(msobj.TimerID);
						}
			msobj.ID.onmouseout = function()
						{
							if(msobj.ScrollStep == 0)

							{
								if(msobj.Step == 0)msobj.Step = 1;
								return;
							}
							msobj.MouseOver = 0;
							if(msobj.Stop == 0)
							{
								clearInterval(msobj.TimerID);
								msobj.TimerID = setInterval(msobj.StartID,timer);
							}
						}
		}
	setTimeout(msobj.Begin,waittime);
}

Marquee.prototype.Scroll = function()
{
	switch(this.Direction)
	{
		case 0:
			this.CTL += this.Step;
			if(this.CTL >= this.ScrollStep && this.DelayTime > 0)
			{
				this.ID.scrollTop += this.ScrollStep + this.Step - this.CTL;
				this.Pause();
				return;
			}
			else
			{
				if(this.ID.scrollTop >= this.ClientScroll)
				{
					this.ID.scrollTop -= this.ClientScroll;
				}
				this.ID.scrollTop += this.Step;
			}
		break;

		case 1:
			this.CTL += this.Step;
			if(this.CTL >= this.ScrollStep && this.DelayTime > 0)
			{
				this.ID.scrollTop -= this.ScrollStep + this.Step - this.CTL;
				this.Pause();
				return;
			}
			else
			{
				if(this.ID.scrollTop <= 0)
				{
					this.ID.scrollTop += this.ClientScroll;
				}
				this.ID.scrollTop -= this.Step;
			}
		break;

		case 2:
			this.CTL += this.Step;
			if(this.CTL >= this.ScrollStep && this.DelayTime > 0)
			{
				this.ID.scrollLeft += this.ScrollStep + this.Step - this.CTL;
				this.Pause();
				return;
			}
			else
			{
				if(this.ID.scrollLeft >= this.ClientScroll)
				{
					this.ID.scrollLeft -= this.ClientScroll;
				}
				this.ID.scrollLeft += this.Step;
			}
		break;

		case 3:
			this.CTL += this.Step;
			if(this.CTL >= this.ScrollStep && this.DelayTime > 0)
			{
				this.ID.scrollLeft -= this.ScrollStep + this.Step - this.CTL;
				this.Pause();
				return;
			}
			else
			{
				if(this.ID.scrollLeft <= 0)
				{
					this.ID.scrollLeft += this.ClientScroll;
				}
				this.ID.scrollLeft -= this.Step;
			}
		break;
	}
}

//index_marquee_end

/*
var f;
function openwin(f) 
	{
var flag = "http://webapps.abang.com/email/mail.php?site=" + f;
window.open(flag, "newmial", "height=365, width=495, top=200, left=300,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
}
*/

/***************************************
@function: ding
@time:20081113
***************************************/
var firstnum = 0;
function ding(articleID)
{
	if (firstnum == 0)
	{
		var siteName = getSiteName();
		var url = "http://" + siteName + ".abang.com/webapps/uparticle/ding.php";
		var strParam = "articleID=" + articleID;
		strParam += "&siteName=" + siteName;
		strParam += "&commentID=11776";
		//alert(strParam);

		requestAjax(url,strParam,'post',dingCallback);
		firstnum++;
	}
}

function dingCallback(request)
{
	//alert(ajax.responseText);
	var obj_ding_num = document.getElementById('ding_num');
	obj_ding_num.innerHTML = ajax.responseText;
}

function getSiteName()
{
	var url = location.href;
	//var begin = url.indexOf('http://');
	var end = url.indexOf('.abang');
	var siteName = url.substring(7,end);
	return siteName;
}

var ajax='';
function requestAjax(url,parameter,method,callfunc)
{
	if (window.ActiveXObject)
	{
        ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest)
	{
        ajax = new XMLHttpRequest();
    }
	else
	{
		return false;
	}

	if (method == 'GET' || method == 'get')
	{
		url = url + "?" + parameter;
	    ajax.open("GET", url, true);
	    ajax.send(null);
		ajax.onreadystatechange = function () {
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					callfunc();
				}
			}	
		};
	}
	else if (method == 'POST' || method == 'post')
	{
	    ajax.open("POST", url, true);
		ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		ajax.setRequestHeader("If-Modified-Since","10");
	    ajax.send(parameter);
		ajax.onreadystatechange = function () {
			if(ajax.readyState == 4)
			{
				if(ajax.status == 200)
				{
					callfunc();
				}
			}	
		};
	}
}
/***********************end 文章顶一下*****************************/

/*****************start flash焦点图的js库**************************/
// Copyright 2005-2007 Adobe Systems Incorporated.  All rights reserved.
var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;

function ControlVersion()
{
	var version;
	var axo;
	var e;

	// NOTE : new ActiveXObject(strFoo) throws an exception if strFoo isn't in the registry

	try {
		// version will be set for 7.X or greater players
		axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		version = axo.GetVariable("$version");
	} catch (e) {
	}

	if (!version)
	{
		try {
			// version will be set for 6.X players only
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
			
			// installed player is some revision of 6.0
			// GetVariable("$version") crashes for versions 6.0.22 through 6.0.29,
			// so we have to be careful. 
			
			// default to the first public version
			version = "WIN 6,0,21,0";

			// throws if AllowScripAccess does not exist (introduced in 6.0r47)		
			axo.AllowScriptAccess = "always";

			// safe to call for 6.0r47 or greater
			version = axo.GetVariable("$version");

		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 4.X or 5.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 3.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = "WIN 3,0,18,0";
		} catch (e) {
		}
	}

	if (!version)
	{
		try {
			// version will be set for 2.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
			version = "WIN 2,0,0,11";
		} catch (e) {
			version = -1;
		}
	}
	
	return version;
}

// JavaScript helper required to detect Flash Player PlugIn version information
function GetSwfVer(){
	// NS/Opera version >= 3 check for Flash plugin in plugin array
	var flashVer = -1;
	
	if (navigator.plugins != null && navigator.plugins.length > 0) {
		if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
			var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
			var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
			var descArray = flashDescription.split(" ");
			var tempArrayMajor = descArray[2].split(".");			
			var versionMajor = tempArrayMajor[0];
			var versionMinor = tempArrayMajor[1];
			var versionRevision = descArray[3];
			if (versionRevision == "") {
				versionRevision = descArray[4];
			}
			if (versionRevision[0] == "d") {
				versionRevision = versionRevision.substring(1);
			} else if (versionRevision[0] == "r") {
				versionRevision = versionRevision.substring(1);
				if (versionRevision.indexOf("d") > 0) {
					versionRevision = versionRevision.substring(0, versionRevision.indexOf("d"));
				}
			}
			var flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
		}
	}
	// MSN/WebTV 2.6 supports Flash 4
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
	// WebTV 2.5 supports Flash 3
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
	// older WebTV supports Flash 2
	else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
	else if ( isIE && isWin && !isOpera ) {
		flashVer = ControlVersion();
	}	
	return flashVer;
}

// When called with reqMajorVer, reqMinorVer, reqRevision returns true if that version or greater is available
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision)
{
	versionStr = GetSwfVer();
	if (versionStr == -1 ) {
		return false;
	} else if (versionStr != 0) {
		if(isIE && isWin && !isOpera) {
			// Given "WIN 2,0,0,11"
			tempArray         = versionStr.split(" "); 	// ["WIN", "2,0,0,11"]
			tempString        = tempArray[1];			// "2,0,0,11"
			versionArray      = tempString.split(",");	// ['2', '0', '0', '11']
		} else {
			versionArray      = versionStr.split(".");
		}
		var versionMajor      = versionArray[0];
		var versionMinor      = versionArray[1];
		var versionRevision   = versionArray[2];

        	// is the major.revision >= requested major.revision AND the minor version >= requested minor
		if (versionMajor > parseFloat(reqMajorVer)) {
			return true;
		} else if (versionMajor == parseFloat(reqMajorVer)) {
			if (versionMinor > parseFloat(reqMinorVer))
				return true;
			else if (versionMinor == parseFloat(reqMinorVer)) {
				if (versionRevision >= parseFloat(reqRevision))
					return true;
			}
		}
		return false;
	}
}

function AC_AddExtension(src, ext)
{
  if (src.indexOf('?') != -1)
    return src.replace(/\?/, ext+'?'); 
  else
    return src + ext;
}

function AC_Generateobj(objAttrs, params, embedAttrs) 
{ 
  var str = '';
  if (isIE && isWin && !isOpera)
  {
    str += '<object ';
    for (var i in objAttrs)
    {
      str += i + '="' + objAttrs[i] + '" ';
    }
    str += '>';
    for (var i in params)
    {
      str += '<param name="' + i + '" value="' + params[i] + '" /> ';
    }
    str += '</object>';
  }
  else
  {
    str += '<embed ';
    for (var i in embedAttrs)
    {
      str += i + '="' + embedAttrs[i] + '" ';
    }
    str += '> </embed>';
  }

  document.write(str);
}

function AC_FL_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_SW_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , null
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_GetArgs(args, ext, srcParamName, classid, mimeType){
  var ret = new Object();
  ret.embedAttrs = new Object();
  ret.params = new Object();
  ret.objAttrs = new Object();
  for (var i=0; i < args.length; i=i+2){
    var currArg = args[i].toLowerCase();    

    switch (currArg){	
      case "classid":
        break;
      case "pluginspage":
        ret.embedAttrs[args[i]] = args[i+1];
        break;
      case "src":
      case "movie":	
        args[i+1] = AC_AddExtension(args[i+1], ext);
        ret.embedAttrs["src"] = args[i+1];
        ret.params[srcParamName] = args[i+1];
        break;
      case "onafterupdate":
      case "onbeforeupdate":
      case "onblur":
      case "oncellchange":
      case "onclick":
      case "ondblClick":
      case "ondrag":
      case "ondragend":
      case "ondragenter":
      case "ondragleave":
      case "ondragover":
      case "ondrop":
      case "onfinish":
      case "onfocus":
      case "onhelp":
      case "onmousedown":
      case "onmouseup":
      case "onmouseover":
      case "onmousemove":
      case "onmouseout":
      case "onkeypress":
      case "onkeydown":
      case "onkeyup":
      case "onload":
      case "onlosecapture":
      case "onpropertychange":
      case "onreadystatechange":
      case "onrowsdelete":
      case "onrowenter":
      case "onrowexit":
      case "onrowsinserted":
      case "onstart":
      case "onscroll":
      case "onbeforeeditfocus":
      case "onactivate":
      case "onbeforedeactivate":
      case "ondeactivate":
      case "type":
      case "codebase":
      case "id":
        ret.objAttrs[args[i]] = args[i+1];
        break;
      case "width":
      case "height":
      case "align":
      case "vspace": 
      case "hspace":
      case "class":
      case "title":
      case "accesskey":
      case "name":
      case "tabindex":
        ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i+1];
        break;
      default:
        ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i+1];
    }
  }
  ret.objAttrs["classid"] = classid;
  if (mimeType) ret.embedAttrs["type"] = mimeType;
  return ret;
}

/*******************end flash焦点图的js库**************************/

/*******************start 根据url获得频道名************************/
function getChannel()
{
	var url = window.location.href;
	var arr1 = url.split("//");
	b = arr1[1];
	arr2 = b.split("/");
	channel = arr2[1];

	return channel;
}
/*******************end 根据url获得频道名**************************/