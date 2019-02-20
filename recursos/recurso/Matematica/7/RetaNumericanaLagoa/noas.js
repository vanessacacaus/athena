function toTop(e)
{
	$("html, body").animate({scrollTop: 0}, "normal");
}

function toggleListMode(button){
	var originalPanel = button.parentNode.parentNode.parentNode
	var panel = $(".list-app-item"); //$(button.parentNode.parentNode.parentNode);
	var animating = false;
	if ($(button).hasClass("gradeview") ){
		panel.fadeOut("normal", 
				function()	{
					if(animating == true) return;
					animating = true;
					panel.removeClass("list-mode");
					panel.addClass("grade-mode");
					panel.fadeIn("normal");
					setTimeout(	function(){$("html, body").animate({"scrollTop" : $(originalPanel).offset().top - 10}, "normal") }
					, 20);
				});	
	}
	else {
		panel.fadeOut("normal", 
				function()	{
					if(animating == true) return;
					animating = true;
					panel.removeClass("grade-mode");
					panel.addClass("list-mode");
					panel.fadeIn("normal"); 
					setTimeout( function(){$("html, body").animate({"scrollTop" : $(originalPanel).offset().top - 10}, "normal") }
							, 20);
				});	
	}
}


function articleIndexHide(index)
{
	(index.innerHTML == '[mostrar]') ? $("#indice li[class!=first]").show("normal") : $("#indice li[class!=first]").slideUp('normal');
	index.innerHTML = (index.innerHTML == '[mostrar]') ? '[esconder]' : '[mostrar]';
}



function articleIndex()
{
	var titles = $('.article h2:not(.comment-header), .article h3');
	
	var titlesCopy = new Array();
	titles.each(function (){
		if(!$(this.parentNode).hasClass("attachments-list"))
			titlesCopy.push(this);}
	);
	titles = titlesCopy;
	if(titles.length < 2) return;
	var classIndice = (titles[0].innerHTML.length > 2) ? 'indice-vertical' : 'indice-horizontal';
	
	var menu = '<ul id="indice" class="' + classIndice + '" >';
	if(classIndice == 'indice-vertical') menu += "<li class='first'>Índice <a style='cursor:pointer' onclick='articleIndexHide(this)'>[mostrar]</a></li>";
	var h2Count = 1;
	var h3Count = 1;
	
	
	for(var i=0; i<titles.length; i++)
	{
		var itemId = titles[i].id;
		var isH2 = titles[i].nodeName == "H2" ? true : false;
		if(isH2) h3Count = 1;
		var count = isH2 ? h2Count + ".": ((h2Count-1) + "." + h3Count + ".");
		titles[i].id =  makeLink(titles[i].innerHTML);
		if(titles[i].innerHTML.match(/^\s*\d+\)/)) count = "";
		count = count.replace(/^0./, "");
		menu += "<li " + (!isH2 ? "class='sub'" : "") +">" + count + " <a href='#" + titles[i].id + "'>" + titles[i].innerHTML + "</a></li>";
		if(!isH2) $(titles[i]).prepend('<a style="cursor:pointer" onclick="toTop()" class="toTop">topo</a>');
		isH2 ? h2Count++ : h3Count++;
	}
	$(titles[0].parentNode).prepend(menu);
	$("#indice li[class!=first]").hide();
}

function makeLink(str)
{
	return str.toLowerCase()
	.replace(/[àáâãª]/g, "a")
	.replace(/[éê]/g, "e")
	.replace(/[í]/g, "i")
	.replace(/[óôõº]/g, "o")
	.replace(/[ûúü]/g, "u")
	.replace(/[ç]/g, "c")
	.replace(/[^a-z0-9 -]/g, "")
	.replace(/[ -]+/g, "-");
}


function fontSizeAdjust(oldSize, newSize)
{
	if(!newSize.match(/big|small|normal/)) newSize = 'normal';
	$(".variable-font-container").removeClass("font-" + oldSize);
	$(".variable-font-container").addClass("font-" + newSize);
	$(".font-size-control ." + newSize).addClass("selected");
	Cnec.Cookies.write('fontsize', newSize, 24*60*60*30);
}

function fontSizeControlAdjust(e) {
	if($(e.target).hasClass(".font-size-control")) return;
	
	var selected  = $(".font-size-control .selected");
	
	if($(e.target).hasClass("selected")) return;
	
	if($(e.target).hasClass("plus"))
	{
		if (selected.hasClass("big")) return;
		selected.removeClass("selected");
		if (selected.hasClass("normal")){ 
			fontSizeAdjust("normal", "big");
			return;
		}
		
		if (selected.hasClass("small")){ 
			fontSizeAdjust("small", "normal");
			return;
		}
		
	}
	
	if($(e.target).hasClass("minus"))
	{
		if (selected.hasClass("small")) return;
		selected.removeClass("selected");
		if (selected.hasClass("normal")){
			fontSizeAdjust("normal", "small");
			return;
		}
		if (selected.hasClass("big")){
			fontSizeAdjust("big", "normal");
			return;
		}
	}
	selected.removeClass("selected");
	fontSizeAdjust(selected[0].className, e.target.className);
}

function fixFlashMouseWheel()
{
	var flash = $(".applet embed");
	if(flash.length == 0) return;
	flash = flash[0];
	$(document).bind("mousewheel",  function (e)
	{
		if(e.target != flash) return;
		var e2 = e.originalEvent;
		var offset = $(flash).offset(); 
		var o = {x: e2.pageX - offset.left, y: e2.pageY - offset.top, 
             delta: e2.detail == 0 ? e2.wheelDelta / 40 : e2.detail,
             ctrlKey: e.ctrlKey, altKey: e.altKey, 
             shiftKey: e.shiftKey };
         flash.handleWheel(o);
         
         return false;
	});
	
	$(document).bind("DOMMouseScroll", function (e)
	{
		if(e.target != flash) return;
		var e2 = e.originalEvent;
		var offset = $(flash).offset(); 
		var o = {x: e2.pageX - offset.left, y: e2.pageY - offset.top, 
             delta: e2.detail,
             ctrlKey: e.ctrlKey, altKey: e.altKey, 
             shiftKey: e.shiftKey };
         flash.handleWheel(o);
         
         return false;
	});
}


$(document).ready(function() {
	articleIndex();
	fixFlashMouseWheel();
	var c = Cnec.Cookies['fontsize'];
	if(c)
	{
		$(".font-size-control .selected").removeClass('selected');
		fontSizeAdjust("normal", c );
	}
	$(".font-size-control").click(fontSizeControlAdjust);
}
);

//-------------------------Noas Rotator
NoasRotator = function(element, args)
{
	this.element  = element;
	this.delay = args.delay ? args.delay : 1500;
	this.descriptionItems = $(this.element).find(".item-info > div");
	this.shortcutItems = $(this.element).find(".shortcuts img");
	this.originalMarginLeft = $(this.shortcutItems[0]).css("marginLeft");
	$(this.element).find(".shortcuts").append(this.shortcutItems[0]);
	this.pictureItems = $(this.element).find(".picture img");
	this.pictureItems.click(Cnec.bindfn(this.go, this));
	this.current = 0;
	this.timeHandle = setTimeout(Cnec.bind(this.changePic, this), this.delay);
	this.shortcutItems.click(Cnec.bind(this.shortcutClick, this));
	$(this.element).find(".play-button").click(Cnec.bind(this.toggle, this));
	this.playing = true;
}

NoasRotator.prototype.go = function()
{
	location = $(this.descriptionItems[this.current]).find("a")[0].href;
}

NoasRotator.prototype.changePic = function()
{
	//this.change((this.current + 1) == this.descriptionItems.length ? 0 : this.current + 1);
	this.change(this.getNext());
}

NoasRotator.prototype.getNext = function()
{
	var item = $(this.element).find(".shortcuts")[0].firstChild;
	for(var i = 0; i < this.shortcutItems.length; i++)
	{
		if(this.shortcutItems[i] == item) return i;
	}
	return 1;
}

NoasRotator.prototype.change = function(to)
{
	if(this.animating)
	{
		if(this.playing) this.timeHandle = setTimeout(Cnec.bind(this.changePic, this), this.delay);
		return true;
	}
	var oldCurrent = this.current;
	this.current = to;
	
	$(this.descriptionItems[oldCurrent]).fadeOut("normal");
	$(this.descriptionItems[this.current]).fadeIn("normal");
	this.movePicture(oldCurrent, this.current);
	this.moveShortcut(oldCurrent, this.current);
	if(this.playing) this.timeHandle = setTimeout(Cnec.bind(this.changePic, this), this.delay);
}

NoasRotator.prototype.movePicture = function (oldPic, newPic)
{
	var a = $(this.pictureItems[newPic]);
	var amount = $(".picture").offset().left;
	a.css("display", "block");
	
	a.css("left", "-"  + (amount + a.width()) +  "px");
	var b = $(this.pictureItems[oldPic]);
	
	b.fadeOut("normal");
	this.animating = true;
	var me = this;
	a.animate({left:"0px"}, "normal", function(){me.animating = false});
}

NoasRotator.prototype.moveShortcut = function (oldPic, newPic)
{
	$(this.shortcutItems[newPic]).addClass("selected");
	$(this.shortcutItems[oldPic]).removeClass("selected");
	var movingShortcutItem = $(this.shortcutItems[newPic]);
	var me = this;
	movingShortcutItem.animate({opacity: 0, "marginLeft":  "-" + (movingShortcutItem.width() + parseInt(this.originalMarginLeft)) + "px" }, "normal",
		function ()
		{
			$(me.element).find(".shortcuts").append(movingShortcutItem[0]);
			movingShortcutItem.css("margin-left", me.originalMarginLeft);
			movingShortcutItem.css("opacity", 1);
		}
	);
}

NoasRotator.prototype.play = function()
{
	clearTimeout(this.timeHandle);
	this.changePic();
}

NoasRotator.prototype.stop = function()
{
	clearTimeout(this.timeHandle);
}

NoasRotator.prototype.toggle = function(e)
{
	if(this.playing)
	{
		this.playing = false;
		this.stop();
		$(e.target).removeClass("pause");
		$(e.target).addClass("play");
		return;
	}
	this.playing = true;
	$(e.target).removeClass("play");
	$(e.target).addClass("pause");
	this.play();
}

NoasRotator.prototype.shortcutClick = function(e)
{
	if(this.animating) return true;
	var i = 0; 
	for(; i < this.shortcutItems.length; i++)
	{
		if(this.shortcutItems[i]  == e.target) break;
	}
	this.stop();
	this.change(i);
}

function openAppIntel(url) {
	var newWindow;
	newWindow = window.open(url,'LOWin','height=488,width=760,left=10,top=10,toolbar=no,scrollbars=no');
	newWindow.focus();
}