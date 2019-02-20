﻿package src
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.ProgressEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.MovieClip;

	public class CarregaImagem extends MovieClip
	{
		public var pictLdr:Loader;
		//private var barra:barraLoad;
		private var comecou:Boolean;
		private var mcLoad:MovieClip;

		public function CarregaImagem(caminho:String, mcPassado:MovieClip, xBarra:Number, yBarra:Number):void
		{
			comecou = false;

			//========================== Barra Loader ==========================
			// Cria uma instancia de barraLoad e a posiciona no palco
			/*
			barra = new barraLoad();
			barra.name = "barra";
			barra.x = xBarra;
			barra.y = yBarra;
			*/
			mcLoad = mcPassado;
			mcLoad.x = xBarra;
			mcLoad.y = yBarra;
			
			//trace (mcLoad.name);
			//=============================  Imagem  ===========================
			
			//Cria um loader e começa a carrega-lo
			pictLdr = new Loader();
			pictLdr.name = "pictLdr";
			configureListeners(pictLdr.contentLoaderInfo);

			pictLdr.load(new URLRequest(caminho));
		}
		function configureListeners(dispatcher:IEventDispatcher):void
		{
			//Configura os listeners do objeto Loader
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(Event.INIT, initHandler);
			//dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
		}
		function openHandler(event:Event):void
		{
			//adiciona a instancia de barraLoad no palco
			//addChild(this.barra);
			addChild(mcLoad);
			//trace (mcLoad.name);
		}
		function progressHandler(event:ProgressEvent):void
		{
			//Muda a escala x da barrinha dependendo de quanto ja foi carregado
			//this.barra.barrinha.scaleX = (event.bytesLoaded/event.bytesTotal);
			this.mcLoad.barrinha.scaleX = (event.bytesLoaded/event.bytesTotal);
		}
		function completeHandler(event:Event):void
		{
			//Quando completa muda a variável começou tira a barra do palco e adiciona o objeto carregado.
			comecou = true;
			//removeChild(getChildByName("barra"));
			removeChild(getChildByName("barra"));
			addChild(pictLdr);
		}
		function initHandler(event:Event):void
		{
			//trace("initHandler: " + event);			
		}
		public function cancelLoad()
		{
			//Tentativa de função para cancelar o load que está em vigor
			if (comecou == false)
			{
				trace("cancel");
				pictLdr.close();
			}
		}
	}
}