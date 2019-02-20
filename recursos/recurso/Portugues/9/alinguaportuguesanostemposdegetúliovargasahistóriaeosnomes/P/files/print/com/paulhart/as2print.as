/*******************************************************************************************************	
 Typical basic usage
 ===============
import com.paulhart.as2print;

//Print button handler
btn_print.onRelease = function() {
	var pj:as2print = new as2print();
	pj.setAsHTML();
	pj.setPrintText(createPrintJob());
	pj.printPageNumbers();
	pj.setPageNumberFormat(0, "- "," -");
	pj.printToPages();
	pj.destroy();
}

//String to print
function createPrintJob() {
	var pp:String = new String();
	pp += "<b>Heres your text</b>";
	pp += "<br />"
	pp += txt_hello.text;
	return pp;
}
by Paul Hart 2007
********************************************************************************************************/

dynamic class com.paulhart.as2print extends MovieClip {
	
	var textToPrint:String;
	
	var pWidth:Number; // width of page
	var pHeight:Number; // height of page
	
	// Create TextFormat items for each box
	var hFormat:TextFormat; // header
	var mFormat:TextFormat; // main content
	var fFormat:TextFormat; // footer
	
	// Colours of bounding box
	var borderColour:String;
	var fillColour:String
	
	// Values for page number surrounding text
	var pnLeadText:String;
	var pnFollowText:String;
	// ------------------------------------------------
	
	// Flags
	var printPageNumbersFlag:Boolean;

	// --- CONSTRUCTOR ---
	// mpPRinter( width , height , border colour , fill colour)
	function as2print(w:Number,h:Number,bc:String,fc:String) {		
		// Default values
		textToPrint = "";
		
		var defaultWidth:Number = 560;
		var defaultHeight:Number = 780;
		
		var defaultFillColour = "ffffff";
		var defaultBorderColour = "ffffff";
		
		pWidth = w;
		pHeight = h;
		borderColour = bc;
		fillColour = fc;
		
		if (!(pWidth > 0)) pWidth = defaultWidth;
		if (!(pHeight > 0)) pHeight = defaultHeight;
		if (borderColour == undefined | borderColour == "" | borderColour.length != 6) borderColour = defaultBorderColour;
		if (fillColour == undefined | fillColour == "" | fillColour.length != 6) fillColour = defaultFillColour;
		buildObject();
	}
	
	function buildObject() {
		createPageMovieClip();
		buildPageBoundingBox();
		createTextBoxes();
		setDefaults();
	}
	
	function createPageMovieClip() {
		_root.createEmptyMovieClip("printPage", 50);
		printPage._x = 5000;
		printPage._y = 5000;
	}
	
	function buildPageBoundingBox() {
		// Draw bounding box
		printPage.lineStyle(0.5, Number("0x" + borderColour));
		printPage.moveTo(0,0);
		printPage.beginFill(Number("0x" + fillColour));
		printPage.lineTo(0,0);
		printPage.lineTo(pWidth,0);
		printPage.lineTo(pWidth,pHeight);
		printPage.lineTo(0,pHeight);
		printPage.endFill();
	}
	
	function createTextBoxes() {
		// Create header
		// createTextField(instanceName, depth, x, y, width, height)
		var boxSpacing:Number = 2; // spacing between text boxes
		
		printPage.createTextField("ppHeader", 10, 5, 0, (pWidth-10), 20);
		printPage.createTextField("ppFooter", 20, 5, (pHeight-22), (pWidth-10), 20);
		printPage.createTextField("ppMain", 30, 30, (printPage.ppHeader._height+boxSpacing), (pWidth-26), (pHeight - ((printPage.ppHeader._height+boxSpacing) + (printPage.ppFooter._height+boxSpacing)))-2 );
		// -------------------------------------------------------
		
		
		// Remove all borders and colourings from text boxes
		printPage.ppHeader.autoSize = false;
		printPage.ppHeader.selectable = false;
		printPage.ppHeader.border = false;
		printPage.ppHeader.background = false;
		printPage.ppHeader.type = "dynamic";
		printPage.ppHeader.multiline = false;
		printPage.ppHeader.wordWrap = false;
		
		printPage.ppMain.autoSize = false;
		printPage.ppMain.selectable = false;
		printPage.ppMain.border = false;
		printPage.ppMain.background = false;
		printPage.ppMain.type = "dynamic";
		printPage.ppMain.multiline = true;
		printPage.ppMain.wordWrap = true;
		
		printPage.ppFooter.autoSize = false;
		printPage.ppFooter.selectable = false;
		printPage.ppFooter.border = false;
		printPage.ppFooter.background = false;
		printPage.ppFooter.type = "dynamic";
		printPage.ppFooter.multiline = false;
		printPage.ppFooter.wordWrap = false;
		// ------------------------------------------------
		
		// Instantiate TextFormat items for each box
		hFormat = new TextFormat(); // header
		mFormat = new TextFormat(); // main content
		fFormat = new TextFormat(); // footer
		
		// Default values
		var defaultFont = "Arial";
		
		setGlobalTextFont(defaultFont);
		
		setHeaderTextAlign("center");
		setHeaderTextSize(10);
		
		setMainTextAlign("left");
		setMainTextSize(12);
		
		setFooterTextAlign("center");
		setFooterTextSize(10);		
		
		updateTextFormatting();
		// 		
	}
	
	function setDefaults() {
		this.ppClear(); // clear print text
		this.hideFooter();
		this.hideHeader();
	}
	
	function destroy() {
		printPage.removeMovieClip();
	}
	
	
	// --- PRINT FUNCTIONS ---
	
	// Set text to be printed
	function setPrintText(s:String) {
		textToPrint = s;
		
		/*
		if (this.isPlain()) printPage.ppMain.text = s;
		else printPage.ppMain.htmlText = s;
		
		// Update formatting
		this.updateTextFormatting();*/
	}
	
	// Get text to be printed
	function getPrintText() {
		return textToPrint;
		//return printPage.ppMain.htmlText;
	}
	
	// Set text to HTML
	function setAsHTML() {
		printPage.ppMain.html = true;
	}
	
	// Set text to plain text
	function setAsPlain() {
		printPage.ppMain.html = false;
	}
	
	// Return evaluation of whether text to be printed is HTML
	function isHTML() {
		return (printPage.ppMain.html);
	}
	
	// Return evaluation of whether text to be printed is plain text
	function isPlain() {
		return (!printPage.ppMain.html);
	}
	
	// Clear all print text
	function ppClear() {
		textToPrint = "";
		//printPage.ppMain.text = "";
	}
	
	// Add String to print text
	function ppAdd(s:String) {
		//this.text_txt.text += s;
		textToPrint += s;
		// trace("length = " + textToPrint.length);
		/*
		if (isHTML()) printPage.ppMain.htmlText += s;
		else printPage.ppMain.text += s;*/
		
		// Update formatting
		//updateTextFormatting();
	}
	
	// --------------------------------------------------------------------------------
	// Text-formatting code
	
	// SIZE
	function setMainTextSize(n:Number) {
		mFormat.size = n;
		//updateTextFormatting();
	}
	
	function setFooterTextSize(n:Number) {
		fFormat.size = n;
		//updateTextFormatting();
	}
	
	function setHeaderTextSize(n:Number) {
		hFormat.size = n;
		//updateTextFormatting();
	}
	
	function setGlobalTextSize(n:Number) {
		setMainTextSize(n);
		setFooterTextSize(n);
		setHeaderTextSize(n);
		//updateTextFormatting();
	}
	
	function getMainTextSize() {
		return mFormat.size;
	}
	
	function getFooterTextSize() {
		return fFormat.size;
	}
	
	function getHeaderTextSize() {
		return hFormat.size;
	}
	
	
	// FONT
	function setMainTextFont(s:String) {
		mFormat.font = s;
		//updateTextFormatting();
	}
	
	function setFooterTextFont(s:String) {
		fFormat.font = s;
		//updateTextFormatting();
	}
	
	function setHeaderTextFont(s:String) {
		hFormat.font = s;
		//updateTextFormatting();
	}
	
	function setGlobalTextFont(s:String) {
		setMainTextFont(s);
		setFooterTextFont(s);
		setHeaderTextFont(s);
		//updateTextFormatting();
	}
	
	function getMainTextFont() {
		return mFormat.font;
	}
	
	function getFooterTextFont() {
		return fFormat.font;
	}
	
	function getHeaderTextFont() {
		return hFormat.font;
	}
	
	
	// ALIGN
	function setMainTextAlign(s:String) {
		mFormat.align = s;
		//updateTextFormatting();
	}
	
	function setFooterTextAlign(s:String) {
		fFormat.align = s;
		//updateTextFormatting();
	}
	
	function setHeaderTextAlign(s:String) {
		hFormat.align = s;
		//updateTextFormatting();
	}
	
	function setGlobalTextAlign(s:String) {
		setMainTextAlign(s);
		setFooterTextAlign(s);
		setHeaderTextAlign(s);
		//updateTextFormatting();
	}
	
	function getMainTextAlign() {
		return mFormat.align;
	}
	
	function getFooterTextAlign() {
		return fFormat.align;
	}
	
	function getHeaderTextAlign() {
		return hFormat.align;
	}
	
	
	// COLOUR
	function setMainTextColour(s:String) {
		mFormat.color = Number("0x" + s);
		//updateTextFormatting();
	}
	
	function setFooterTextColour(s:String) {
		fFormat.color = Number("0x" + s);
		//updateTextFormatting();
	}
	
	function setHeaderTextColour(s:String) {
		hFormat.color = Number("0x" + s);
		//updateTextFormatting();
	}
	
	function setGlobalTextColour(s:String) {
		setMainTextColour(s);
		setFooterTextColour(s);
		setHeaderTextColour(s);
		//updateTextFormatting();
	}
	
	function getMainTextColour() {
		return mFormat.color;
	}
	
	function getFooterTextColour() {
		return fFormat.color;
	}
	
	function getHeaderTextColour() {
		return hFormat.color;
	}
	
	
	// BORDER COLOURS
	function setMainTextBorder(s:String) {
		printPage.ppMain.borderColor = Number("0x" + s);
		showMainTextBorder();
	}
	
	function setFooterTextBorder(s:String) {
		printPage.ppFooter.borderColor = Number("0x" + s);
		showFooterTextBorder();
	}
	
	function setHeaderTextBorder(s:String) {
		printPage.ppHeader.borderColor = Number("0x" + s);
		showHeaderTextBorder();
	}
	
	function setGlobalBorder(s:String) {
		setMainTextBorder(s);
		setFooterTextBorder(s);
		setHeaderTextBorder(s);
		showGlobalBorder();
	}
	
	// BORDERS
	function showMainTextBorder() {
		printPage.ppMain.border = true;
	}
	
	function showFooterTextBorder() {
		printPage.ppFooter.border = true;
	}
	
	function showHeaderTextBorder() {
		printPage.ppHeader.border = true;
	}
	
	function showGlobalBorder() {
		showMainTextBorder();
		showFooterTextBorder();
		showHeaderTextBorder();
	}
	
	function hideMainTextBorder() {
		printPage.ppMain.border = false;
	}
	
	function hideFooterTextBorder() {
		printPage.ppFooter.border = false;
	}
	
	function hideHeaderTextBorder() {
		printPage.ppHeader.border = false;
	}
	
	function hideGlobalBorder() {
		hideMainTextBorder();
		hideFooterTextBorder();
		hideHeaderTextBorder();
	}
	
	
	// FILL COLOURS
	function setMainTextFill(s:String) {
		printPage.ppMain.backgroundColor = Number("0x" + s);
		showMainTextFill();
	}
	
	function setFooterTextFill(s:String) {
		printPage.ppFooter.backgroundColor = Number("0x" + s);
		showFooterTextFill();
	}
	
	function setHeaderTextFill(s:String) {
		printPage.ppHeader.backgroundColor = Number("0x" + s);
		showHeaderTextFill();
	}
	
	function setGlobalFill(s:String) {
		setMainTextFill(s);
		setFooterTextFill(s);
		setHeaderTextFill(s);
		showGlobalFill();
	}
	
	// SHOW / HIDE FILL COLOURS
	function showMainTextFill() {
		printPage.ppMain.background = true;
	}
	
	function showFooterTextFill() {
		printPage.ppFooter.background = true;
	}
	
	function showHeaderTextFill() {
		printPage.ppHeader.background = true;
	}
	
	function showGlobalFill() {
		showMainTextFill();
		showFooterTextFill();
		showHeaderTextFill();
	}
	
	function hideMainTextFill() {
		printPage.ppMain.background = false;
	}
	
	function hideFooterTextFill() {
		printPage.ppFooter.background = false;
	}
	
	function hideHeaderTextFill() {
		printPage.ppHeader.background = false;
	}
	
	function hideGlobalFill() {
		hideMainTextFill();
		hideFooterTextFill();
		hideHeaderTextFill();
	}
	
	
	// UPDATE
	function updateTextFormatting() {
		printPage.ppHeader.setTextFormat(hFormat);
		//printPage.ppMain.setTextFormat(mFormat);
		printPage.ppFooter.setTextFormat(fFormat);
	}	
	
	// --------------------------------------------------------------------------------
	
	//
	// Header and footer code
	function printPageNumbers(b:Boolean) {
		// If value 'false' is passed in, set flag to false. Otherwise set flag to true.
		printPageNumbersFlag = (b != false);
		if (printPageNumbersFlag) setPageNumberFormat();
		else hideFooter();
	}
	
	// Set the format in which page numbers are displayed
	function setPageNumberFormat(n:Number, lead:String, follow:String) {
		if (n == undefined) n = 1;
		
		// 1 : 'n'
		if (n == 1) {
			pnLeadText = "";
			pnFollowText = "";
		}
		
		// 2 : 'Page n'
		if (n == 2) {
			pnLeadText = "Page ";
			pnFollowText = "";
		}
		
		// 0 : Custom
		if (n == 0) {
			if (lead == undefined) pnLeadText = "";
			if (follow == undefined) pnFollowText = "";
			pnLeadText = lead;
			pnFollowText = follow;
		}
	}
	
	function showFooter() {
		printPage.ppFooter._visible = true;
	}
	
	function hideFooter() {
		printPage.ppFooter._visible = false;
	}
	
	function setFooter(s:String) {
		showFooter();
		printPage.ppFooter.text = s;
		updateTextFormatting();
	}
	
	function footerIsVisible() {
		return printPage.ppFooter._visible;
	}
	
	
	function showHeader() {
		printPage.ppHeader._visible = true;
	}
	
	function hideHeader() {
		printPage.ppHeader._visible = false;
	}
	
	function setHeader(s:String) {
		showHeader();
		printPage.ppHeader.text = s;
		updateTextFormatting();
	}
	
	function headerIsVisible() {
		return printPage.ppHeader._visible;
	}
	
	// -----------------------------------------------------
	
	// Border and fill code
	function setBorderColour(s:String) {
		if (s != undefined & s != "" & s.length == 6) borderColour = s;
		updateBoxColours();
	}
	
	function setFillColour(s:String) {
		if (s != undefined & s != "" & s.length == 6) fillColour = s;
		updateBoxColours();
	}
	
	function getBorderColour(s:String) {
		return borderColour;
	}
	
	function getFillColour(s:String) {
		return fillColour;
	}
	
	function updateBoxColours() {
		buildPageBoundingBox();
	}
	
	// -----------------------------------------------------
	
	// Print text to pages
	function printToPages() {
		// Create new PrintJob object
		var pj:PrintJob = new PrintJob();
		pj.start();
		
		var strText:String =  "";
		var iIndex1:Number;
		var iIndex2:Number;
		if (isHTML()) printPage.ppMain.htmlText = textToPrint;
		else printPage.ppMain.text = textToPrint;
		updateTextFormatting();
		
		// Set initial scroll position to 'top'.
		printPage.ppMain.scroll = 0;
		
		if (printPageNumbersFlag) {
			var pageCounter:Number = 1;
			setFooter(String(pnLeadText + pageCounter + pnFollowText));
			showFooter();
		}
		
		// Print first page
		pj.addPage(printPage);
		
		//get number of lines per printable page:
		var iPageSize:Number = printPage.ppMain.bottomScroll - (printPage.ppMain.scroll - 1);
		var lastPage:Boolean = false;
	
		for (var pageLoop=0; (printPage.ppMain.scroll < printPage.ppMain.maxscroll) & !lastPage; pageLoop++) {
			// trace("Adding page " + (pageLoop+2));
			iPreviousBottomScroll = printPage.ppMain.bottomScroll;
			// trace("pageLoop = " + pageLoop);
			printPage.ppMain.scroll = printPage.ppMain.bottomScroll + 1;
			
			// IF bottom scroll of current view is equal to maximum scroll (i.e. on last page)
			if (printPage.ppMain.scroll == printPage.ppMain.maxscroll) {
				// If textbox is HTML enabled, use break tags for spacing. Otherwise use 'newline'.
				var spacer;
				if (this.isHTML()) spacer = "<br>";
				else if (this.isPlain()) spacer = newline;

				 var iRemainingLines:Number = printPage.ppMain.bottomScroll - iPreviousBottomScroll;
				 var iTotalLines:Number = iRemainingLines + ((pageLoop+1)*iPageSize);
				 if (iTotalLines % iPageSize != 0) {
					iLinesToAdd = iPageSize - iRemainingLines;
					var spacerAdd:String = spacer;

					for (var j=0; j<(iLinesToAdd*2); j++) {
						spacerAdd += spacer;
					}
					if (isHTML()) printPage.ppMain.htmlText += spacerAdd;
					else printPage.ppMain.text += spacerAdd;
					
					updateTextFormatting();
				 }
				 printPage.ppMain.scroll = iPreviousBottomScroll + 1;
				 lastPage = true;
			}
			if (printPageNumbersFlag) {
				pageCounter++;
				setFooter(String(pnLeadText + pageCounter + pnFollowText));
			}
			pj.addPage(printPage);
		}
	
		pj.send();
		delete pj;
	}
}