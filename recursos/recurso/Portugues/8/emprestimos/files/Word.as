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
	

	
	/**
	 * Classe Word
	 *
	 * @author Bruno Milare
	 * @date 05/11/2009
	 */
	public class Word {
		
		
		
		
		private var _index:int;
		private var _col:int;
		private var _row:int;
		private var _question:String;
		private var _answer:String;
		private var _clue:String;
		private var _feedbackRight:String;
		private var _feedbackWrong:String;
		private var _orientation:String;
		private var _tiles:Array;
		private var _givenAnswer:String;

		
		public function Word(index:int, col:int, row:int, question:String, answer:String, clue:String, fbRight:String, fbWrong:String, orient:String ){
			this._index = index;
			this._col = col;
			this._row = row;
			this._question = question;
			this._answer = answer;
			this._clue = clue;
			this._feedbackRight = fbRight;
			this._feedbackWrong = fbWrong;
			this._orientation = orient;
			this._tiles = new Array(answer.length);
		}
		
		public function dumpWord(){
			trace(this._index + " - " + this._question);
		}
					
		public function getAnswer():String { return this._answer; }
		public function getQuestion():String { return this._question; }
		public function getClue():String { return this._clue; }
		public function getOrientation():String { return this._orientation; }
		public function getCol():int { return this._col; }
		public function getRow():int { return this._row; }
		public function getIndex():int { return this._index; }
		public function setTiles(a:Array){ this._tiles = a; }
		public function getTiles():Array { return this._tiles; }
		public function getFirstTile():Tile { return this._tiles[0]; }
		public function getLastTile():Tile { return this._tiles[getAnswer().length -1]; }
		public function setGivenAnswer(s:String){ this._givenAnswer = s; }
		public function getGivenAnswer():String{ return this._givenAnswer; }
		
	}
}