package giant.display.controls
{
	import flash.display.Bitmap;
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
		/**
		 * 是不是在设置了source属性后 直接加载图片
		 * <p>只有在source属性代表远程图片URL的情况下 autoLoad属性才起作用 如果是bitmap的话 就涉及不到是不是要立即加载</p>
		 */
		public var autoLoad:Boolean = true;
		/**
		 * 
		 */
		public var content:Bitmap;
		/**
		 * 构造方法
		 */
		public function Image(source:Object,width:Number=NaN,height:Number=NaN)
		{
			super();
			this.source = source;
			if(!isNaN(width)){
				this.width = width;
			}
			if(!isNaN(height)){
				this.height = height;
			}
		}
		
		
		/**
		 * 图片的远程URL或者bitmapdata
		 */
		public function set source(value:Object):void{
			if(this._source!=value){
				this._source = value;
				if(value is Bitmap){
					
				}else if(value is String){
					if(autoLoad){
						load();
					}
				}
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
		/**
		 * 移除所有的侦听器
		 */
		public function dispose():void{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadCompHandler);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,trace);
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,trace);
		}
		
		public function loadCompHandler(event:Event):void
		{
			dispose();
			if(content&&contains(content)){
				removeChild(content);
			}
			content = Bitmap(_loader.content);
			measureWidth = content.width;
			measureHeight = content.height;
			content.width = explicitWidth;
			content.height = explicitHeight;
			addChild(content);
		}		
		
		override public function set width(value:Number):void
		{
			super.width = value;
			if(content){
				content.width = value;
			}
			
		}
		
		override public function set height(value:Number):void
		{
			super.height = value;
			if(content){
				content.height = value;
			}
			
		}
	}
}