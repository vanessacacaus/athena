package {

	import flash.events.*;
	import flash.net.*;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.*;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.text.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;
	import flash.printing.PrintJob;
	import flash.printing.PrintJobOrientation;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;	
	

	
	/**
	 * Classe Puzzle
	 *
	 * @author Bruno Milare
	 * @date 05/11/2009
	 */
	public class Puzzle {
		
		
		// vars relacionadas a matriz do quebra-cabeca
		private var _nRows:int;
		private var _nCols:int;
		private var _rows:Array;
		private var _cols:Array;
		
		
		// palavras
		private var _nWords:int;
		private var _words:Array;
		
		
		// stage
		private var _mParent:*;
		private var _offsetX:int = 20;
		private var _offsetY:int = 100;
		
		
		//controle
		private var _currentWord:Word;
		private var _lastChar:Boolean = false;
		public var _tileSet:Array;
		private var _nIntersections:int = 0;
		private var _prevWordIndex:int = 0;
		private var _currentWordIndex = 0;
		private var _cursor = 0;
		private var _currentTile:Tile;
		public var _currentFocus:Array = new Array();
		private var _intersectionSet:Array;
		private var _relatorio:String;
		private var _questionImagesSet:Array = new Array();;
		private var _questionIndex:Array = new Array();;
		// visuals
		public var _clueBox;
		public var _acabou:Boolean=false;
		private var _focusHandler;
		
		var teste=0;

		public function Puzzle(lenX:int, lenY:int, nwords:int, par:*, clue_box:*){
			
			this._nRows = lenY;
			this._nCols = lenX;
			this._nWords = nwords;
			this._rows = new Array(this._nRows);
			this._cols = new Array(this._nCols);
			this._mParent = par;
			this._clueBox = clue_box;
		
		}

		public function hidePuzzle(){
			this._questionImagesSet.visible=false;
		}
		public function showPuzzle(){
			this._questionImagesSet.visible=true;
			
			
		}
		
		public function setClue(sz:String){
			this._clueBox.textoDica.text = sz;			
		}
		
		public function showClue(){
			this._clueBox.visible = true;	
		}
		
		public function getWord(pos:int):Word{
			return this._words[pos];			
		}
		
		public function getWords():Array{
			return this._words;			
		}
		
		public function atLastChar():Boolean{
			return this._lastChar;
		}
		
		
		public function verifyPrevIntersections(a:int, b:int):Boolean{
			
			for(var i=0; i<this._nIntersections; i++){
				if((_intersectionSet[i][0] == a) && (_intersectionSet[i][1] == b)){
					return true;
				}
			}
			
			return false;			
		}
		
		
		public function checkOverposition(t:Tile, cont:int):Tile{
			
			var len:int;
			var tile:Tile = t;
			
			for(var i=0; i < cont; i++){
				len = this._tileSet[i].length;
				trace(len + "--" + cont);
				
					for(var j=0; j < len; j++){
						
						
						if((t.x == this._tileSet[i][j].x) && (t.y == this._tileSet[i][j].y)){
							_intersectionSet[this._nIntersections][0] = this._tileSet[i][j].x;
							_intersectionSet[this._nIntersections][1] = this._tileSet[i][j].y;
							
							
							if(verifyPrevIntersections(_intersectionSet[this._nIntersections][0],
													   _intersectionSet[this._nIntersections][1]) == false){
								tile = this._tileSet[i][j];
							}
								
							this._nIntersections++;
	
						}
						
				}
				
			}
			
			return tile;			
			
		}
		
		public function drawTile(w:Word, posVec:int):Array{
			
			var len = w.getAnswer().length;
			var tiles:Array = new Array(len);
			var tmpTile:Tile = null;
			trace(len);
			
			this._currentWord = w;
			
			trace("ANS: "+ w.getAnswer() +"    LIN: "+w.getRow()+"    COL:"+w.getCol() );
			for(var i=0; i < len; i++){
				tiles[i] = new Tile();
				tiles[i].name = posVec;
				tiles[i].tabEnabled =false;
				tiles[i].title = w.getAnswer();
				
				if(i == len - 1){
					this._lastChar = true;
				}
				else{
					this._lastChar = false;
				}
				if(i == 0){
					tiles[i].topindex.text = w.getIndex();
				}
				else{
					tiles[i].topindex.text = '';
				}
				if(w.getOrientation() == 'H'){
					tiles[i].description = 'H';
					tiles[i].y = _offsetY + w.getRow()* tiles[i].width ;
					tiles[i].x = _offsetX +(i + w.getCol()) * tiles[i].width ;
					trace("Horizontal " + tiles[i].x + "," + tiles[i].y);
				}
				else if(w.getOrientation() == 'V'){
					tiles[i].description = 'V';
					tiles[i].y = _offsetY + (i + w.getRow()) * tiles[i].height;
					tiles[i].x = _offsetX + w.getCol()*tiles[i].height;
					trace("Vertical " + tiles[i].x + "," + tiles[i].y);
				}
				tiles[i].letter.text = '';
				
				tmpTile = checkOverposition(tiles[i], posVec);
				
				if(tmpTile == tiles[i]){
					this._mParent.addChild(tiles[i]);
				}
				else{
					
					tiles[i] = tmpTile;
					if(i == 0){
						tiles[i].topindex.text = w.getIndex();
						
					}
				}
			}
			
			return tiles; 
			
		}
		
		public function showQuestions():String{
			
			var horQuestions:String = "Horizontal:\n";
			var verQuestions:String = "Vertical:\n";;
			
			for(var i=0; i < this._nWords; i++){
				if(this._words[i].getOrientation() == 'H'){
					horQuestions +=  this._words[i].getIndex() + " - " + this._words[i].getQuestion() + "\n";
				}
				else if(this._words[i].getOrientation() == 'V'){
					verQuestions +=  this._words[i].getIndex() + " - " + this._words[i].getQuestion() + "\n";
				}
			}

			return horQuestions + "\n\n" + verQuestions;

		}
		
		
		public function drawQuestions(posx:int, posy:int, mParent:*){
			
			var firstH:Boolean = true;
			var firstV:Boolean = true;
			var labelFactor = 0;
			var cont = 0;
			var altura = 0;
			var item;
			var i;
			
			for( i=0; i < this._nWords; i++){
				item = new QuestionItem();
				item.useHandCursor = true;
				if(this._words[i].getOrientation() == 'H'){
					if(firstH == true){
						
						var hLabel = new HorV();
						hLabel.orient.text = "HORIZONTAL";
						hLabel.x =  posx;
						hLabel.y =  posy+10;
						altura+=hLabel.height+10;
						firstH = false;
						mParent.addChild(hLabel);
						_questionImagesSet[cont] = hLabel;
						trace("Desenha H",hLabel.x ,hLabel.y );
						cont++;
					}
					item.topindex.text = this._words[i].getIndex();
					item.question.text = this._words[i].getQuestion();
					item.x = posx;
					item.y = altura+5+posy;
					item.question.autoSize="left";
					item.box.height=item.question.height+6.5;
					altura+=item.height+5;
					item.name = i;
					//item.tabIndex = cont+7;
					
					mParent.addChild(item);
					labelFactor = 0;
					_questionImagesSet[cont] = item;
					_questionIndex[i] = cont;
					cont++;
				}
			}
			
			for( i=0; i < this._nWords; i++){
				item = new QuestionItem();
				item.useHandCursor = true;
				if(this._words[i].getOrientation() == 'V'){
					if(firstV == true){
						var vLabel = new HorV();
						vLabel.orient.text = "VERTICAL";
						vLabel.x =  posx;
						vLabel.y = altura+10+posy;
						altura+=vLabel.height+10;
						firstV = false;
						mParent.addChild(vLabel);
						_questionImagesSet[cont] = vLabel;
						trace("Desenha V",vLabel.x ,vLabel.y );
						
						cont++;
					}
					item.topindex.text = this._words[i].getIndex();
					item.question.text = this._words[i].getQuestion();
					item.x = posx;
					item.y = altura+5+posy;
					item.question.autoSize="left";
					item.box.height=item.question.height+6.5;
					altura+=item.height+5;
					item.name = i;
					//item.tabIndex = cont+7;
					mParent.addChild(item);
					_questionImagesSet[cont] = item;
					_questionIndex[i] = cont;
					cont++;
				}
			}
		}
		
		public function getQuestionsSet():*{
			
			return this._questionImagesSet;
			
		}
		public function getImageQuestion(i:int):*{
			
			return this._questionImagesSet[_questionIndex[i]];
			
		}
		
		public function removePuzzle(par:*){
			for(var i=0; i < this._nWords; i++){
				if(this._tileSet[i]!= null){
					for(var j=0; j < this._tileSet[i].length; j++){
						if(this._tileSet[i][j]!= null){
							try{
								par.removeChild(this._tileSet[i][j]);
								
							}catch(e:Error){
								
							}
						}
					}
				}
			}
		}
		
		
		public function removeQuestionsGraphics(par:*){
			
			for(var i=0; i < this._questionImagesSet.length; i++){
				if(this._questionImagesSet[i]!= null){
					try{
						par.removeChild(this._questionImagesSet[i]);
					}catch(e:Error){
						
					}
				}
			}
		}
		
		public function drawPuzzle(){
			
			this._intersectionSet = new Array(this._nWords);
			this._tileSet = new Array(this._nWords);
			for(var i=0; i < this._nWords; i++){
				this._intersectionSet[i] = new Array(2);
				this._tileSet[i] = drawTile(this._words[i], i);
				this._words[i].setTiles(this._tileSet[i]);
			}
		}
		
		public function genRel():String{
			var word:Word;
			this._relatorio = "Relatório:\n\n";
			
			this._relatorio += "Nome: "+ Maquina.nome+"\n";
			this._relatorio += "Turma: "+ Maquina.turma+"\n";
			this._relatorio += "Data: "+ Maquina.dataAtual+"\n\n";
			
			for(var i=0; i < this._nWords; i++){
				word = this._words[i];
				this._relatorio += (i+1)+". "+word.getQuestion()+" \n";
				this._relatorio += "Resposta dada: "+ getUserAnswer(word, i);
				
				trace("genRel"+ teste);
				teste++;
				if(_acabou==true){
					if(getUserAnswer(word, i) == word.getAnswer()){
						this._relatorio += " (CORRETA)\n\n";
					}else{
						this._relatorio += " (INCORRETA)\n\n";
					}
				}
				else this._relatorio += "\n\n";
			}
			
			return this._relatorio;
		}
		
		
		
		
		
		public function showSolution(){
			var word:Word;
			var ans:String = "";
			
			
			for(var i=0; i < this._nWords; i++){
				word = this._words[i];
							
				for(var j=0; j< word.getAnswer().length; j++){
					ans = word.getAnswer();
					this._tileSet[i][j].letter.text = ans.charAt(j);
				}
			}
		}
		
		public function CheckAnswers():Boolean{
		var word:Word;
		var ans:String = "";
		var right:Boolean=true;
		
		for(var i=0; i < this._nWords; i++){
			word = this._words[i];
						
			for(var j=0; j< word.getAnswer().length; j++){
				ans = word.getAnswer();
				if (this._tileSet[i][j].letter.text != ans.charAt(j)) right = false;
			}
		}
		return right;
	}

		
		public function getLastIndex():int{
			return this._prevWordIndex;			
		}
		public function setLastIndex(i:int){
			this._prevWordIndex = i;
		}
		
		public function setCursor(i:int){
			this._cursor = i;
		}
		
		public function getCursor():int{
			return this._cursor;			
		}
		
		public function getFocusHandler():*{
			return this._focusHandler;			
		}
		
		
		
		public function getCandidates(t:Tile):Array{
			
			var candidates:Array = new Array();
			var cont = 0;
			
			for(var i=0; i < this._nWords; i++){
				for(var j=0; j < this._tileSet[i].length; j++){
					if(t == this._tileSet[i][j]){
						candidates[cont] = this._tileSet[i][j];
						cont++;
					}
				}
			}
			
			return candidates;
			
		}
	
		public function getSingleTileSet(t:Tile):Array{
			
			var cont = 0;
			for(var i=0; i < this._nWords; i++){
				for(var j=0; j < this._tileSet[i].length; j++){
					if(t == this._tileSet[i][j]){
						return this._tileSet[i];
					}
				}
			}
			
			return null;
			
		}
	
		public function hasTile(t:Tile, tileSet:Array):Boolean{
			for(var i=0; i < tileSet.length; i++){
				if(tileSet[i] == t){
					return true;
				}
			}
			
			return false;
		}
	
		public function setCurrentTile(t:Tile){
			this._currentTile = t;
		}
		
		
		public function getCurrentTilePosInWord(pos, t):int{

			var usedTile:Boolean = false;
			var cur:Tile = null;
			

			if(hasBothOrientations(t) == true){
				for(var k=0; k<this._currentFocus.length; k++){
					if(this._currentFocus[k] == t){
						return k;
					}
				}
				
			}
			else if((this._currentTile != null)&&(this._tileSet[pos] != null)){
			for(var i=0; i<this._tileSet[pos].length; i++){
				if(this._currentTile == this._tileSet[pos][i]){
					return i;
				}
			}
			}
			return -1;
		}
		
		public function getCurrentFocus():Array{
			return this._currentFocus;
		}
		
		public function increaseCursor(max:int){
			try{
				if(max-2 > this._cursor){
					this._cursor++;
				}
			}catch(e:Error){
				this._cursor = 0;
			}
			
		}
		
		public function toggleFocus(t:Tile, curFocus:Array):Array{
			
			var candidates = getCandidates(t);
			
			
			if(hasBothOrientations(t) == true){
				trace("Analysing "+ candidates.length+" candidates...");
				for(var i=0; i < this._nWords; i++){
					for(var j=0; j < candidates.length; j++){
						if((hasTile(t,this._words[i].getTiles())==true)&&(candidates[j] != curFocus)&&(this._currentWordIndex != i)){
							trace("Toggling... " + i + ", curIndex:"+ this._currentWordIndex);
							focusWord(this._words[this._currentWordIndex ],this._currentWordIndex ,null,"off");
							//this._prevWordIndex = this._currentWordIndex;
							this._currentWordIndex = i;
							this._currentTile = t;
							focusWord(this._words[i],i,t,"on");
							this._prevWordIndex = i;
							curFocus = this._words[i].getTiles();
							_currentFocus = curFocus;
							_focusHandler = curFocus;
							return curFocus;
						}
					}
				}
			}
			else{
				_focusHandler = getSingleTileSet(t);
				_currentFocus = _focusHandler;
				if(_focusHandler != null){
					return _currentFocus;
				}
			}
			return null;
		}
		
		
		public function cleanFocus(w:Word, pos:int){
			var len = w.getAnswer().length;
			
			for(var i=0; i<len; i++){
				this._tileSet[pos][i].deactiveLetter(pos);
			}
			
		}
		
		public function cleanAll(){
			
			for(var i=0; i < this._nWords; i++){
				for(var j=0; j < this._tileSet[i].length; j++){
					this._tileSet[i][j].letterOff();
				}
			}
		}
		
				
		public function focusWord(w:Word, pos:int, t:Tile, action:String):Array{
			
			var len = w.getAnswer().length;
			
			if(action == "on"){
				for(var i=0; i<len; i++){
					this._tileSet[pos][i].setActive();
					
				}
				this._currentTile = t;
				this._currentFocus = this._tileSet[pos];
				this._focusHandler = this._tileSet[pos];
				
				trace("Set Cur Focus :" +  this._tileSet[pos]);
				return this._tileSet[pos];
			}else{
				for(var j=0; j<len; j++){
					this._tileSet[pos][j].setDeactive();
				}
				return this._tileSet[pos];
			}
		}
		
		public function hasBothOrientations(t:Tile):Boolean{
			
			var cont = 0;
			for(var i=0; i < this._nWords; i++){
				for(var j=0; j < this._tileSet[i].length; j++){
					if(this._tileSet[i][j] == t){
						cont++;
						if(cont == 2){
						trace("Tile with both orientations...");
						return true;
						}
					}
				}
			}
			
			return false;
			
		}
		
		
		public function getUserAnswer(w:Word, pos:int):String{
			
			var len = w.getAnswer().length;
			var answer = "";
			
			for(var i=0; i<len; i++){
				answer += this._tileSet[pos][i].letter.text;
			}
			
			return answer;
		}
		
		private function randRange(min:Number, max:Number){
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			
			return randomNum;
		}
		
		public function loadPuzzle(){
			
			Database.loadDb();
			var puzzleNumber:Number;
			
			puzzleNumber = randRange(0, 4);
			trace("puzzleNumber: " + puzzleNumber);
			var wordsXML:XML = Database.getWords(puzzleNumber);

			trace("###" + puzzleNumber);
			this._words = new Array(this._nWords);

			for(var i=0; i < this._nWords; i++){
				trace("Colocando palavra : " + i);
				this._words[i] = new Word(wordsXML.word[i].subindex,
										  wordsXML.word[i].col,
										  wordsXML.word[i].lin,
										  wordsXML.word[i].question,
										  wordsXML.word[i].answer,
										  wordsXML.word[i].clue,
										  wordsXML.word[i].feedback_right,
										  wordsXML.word[i].feedback_wrong,
										  wordsXML.word[i].orient);
			}
		}
		

					
	}

}
	