package giant.display.controls
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import giant.display.core.UIComponent;
	
	/**
	 * 显示图片的类
	 * <p>图片来源可以是远程的URL 也可以是bitmapdata</p>
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-23
	 *
	 */
	public class Image extends UIComponent
	{
		private var _source:Object;
		private var _loader:Loader;
		private var _urlReq:URLRequest;
		private var _autoLoad:Boolean = true;
		public var content:DisplayObject;
		/**
		 * 构造方法
		 */
		public function Image(source:Object,width:Number,height:Number)
		{
			super();
			this.source = source;
			this.width = width;
			this.height = height;
			
		}
		
		
		/**
		 * 图片的远程URL或者bitmapdata
		 */
		public function set source(value:Object):void{
			if(this._source!=value){
				this._source = value;
			}
		}
		public function get source():Object{
			return this._source;
		}
		
		/**
		 * 加载远程的图片
		 */
		public function load():void{
			if(!_loader){
				_loader = new Loader();
				_urlReq = new URLRequest();
			}
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadCompHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,trace);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,trace);
			_urlReq.url = String(source);
			_loader.load(_urlReq);
		}
		
		public function loadCompHandler(event:Event):void
		{
			trace("偶看");
			if(content&&contains(content)){
				removeChild(content);
			}
			content = _loader.content;
			measureWidth = content.width;
			measureHeight = content.height;
			content.width = explicitWidth;
			content.height = explicitHeight;
			addChild(content);
		}		
		
	}
}