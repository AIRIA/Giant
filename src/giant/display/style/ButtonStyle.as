package giant.display.style
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import giant.display.controls.Button;
	import giant.display.controls.Image;
	import giant.display.manager.StyleManager;
	
	/**
	 * Button的样式配置选项
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-26
	 *
	 */
	public class ButtonStyle extends StyleManager
	{
		private var _button:Button;
		private var _upSkin:Image;
		private var _overSkin:Image;
		private var _disabledSkin:Image;
		private var _downSkin:Image;
		private var _textFormat:TextFormat;
		private var _fontFamily:String="Verdana";
		private var _fontSize:Number=20;
		private var _textAlign:String="center";
		private var _fontStyle:String=null ;
		private var _fontWeight:String=null;
		private var _color:uint=0x0B333C;
		private var _textDecoration:String=null;
		
		/**
		 * 容器内文本的对齐情况。可能值有："left"、"right" 或 "center"。
		 * 大多数组件的默认值为 "left"。
		 */
		public function get textAlign():String
		{
			return _textAlign;
		}
		
		public function set textAlign(value:String):void{
			if(_textAlign!=value){
				_textAlign = value;
				_textFormat.align = _textAlign;
				applyStyle();
			}
		}
		
		private function applyStyle():void{
			for(var i:int=0;i<hostComponents.length;i++){
				var tf:TextField = Button(hostComponents[i]).textLabel.textField;
				tf.defaultTextFormat = _textFormat;
				tf.text = tf.text;
			}
		}
		/**
		 * 字体是否倾斜  默认值null [null italic]
		 */
		public function get fontStyle():String
		{
			return _fontStyle;
		}
		public function set fontStyle(value:String):void{
			if(_fontStyle!=value){
				_fontStyle = value;
				_textFormat.italic = _fontStyle;
				applyStyle();
			}
		}
		
		/**
		 * 确定文本是否使用粗体。可识别的值为 null 和 bold。 默认值normal
		 */
		public function get fontWeight():String{
			return _fontWeight;
		}
		
		public function set fontWeight(value:String):void
		{
			if(_fontWeight!=value){
				_fontWeight = value;
				_textFormat.bold = _fontWeight;
				applyStyle();
			}
		}
		
		/**
		 * 字体类型 默认字体"Verdana"
		 */
		public function get fontFamily():String
		{
			return _fontFamily;
		}
		
		public function set fontFamily(value:String):void
		{
			if(_fontFamily!=value){
				_fontFamily = value;
				_textFormat.font= _fontFamily;
				applyStyle();
			}
		}
		
		/**
		 * 文本的高度，以像素为单位。默认值10
		 */
		public function get fontSize():Number
		{
			return _fontSize;
		}
		
		public function set fontSize(value:Number):void{
			if(_fontSize!=value){
				_fontSize = value;
				_textFormat.size = _fontSize;
				applyStyle();
			}
		}
		/**
		 * 文本颜色 默认值0x0B333C
		 */
		public function set color(value:uint):void{
			_color = value;
			_textFormat.color = _color;
			applyStyle();
		}
		
		public function get color():uint{
			return _color;
		}
		/**
		 * 鼠标弹起的皮肤
		 */
		public function get upSkin():Image{
			return _upSkin;
		}
		
		public function set upSkin(value:Image):void{
			if(_upSkin!=value){
				_upSkin = value;
			}
		}
		/**
		 * 鼠标按下的状态
		 */
		public function get downSkin():Image{
			return _downSkin;
		}
		
		public function set downSkin(value:Image):void
		{
			if(_downSkin!=value){
				_downSkin = value;
			}
		}
		/**
		 * 鼠标经过时候的皮肤 
		 * @return 
		 * 
		 */		
		public function get overSkin():Image
		{
			return _overSkin;
		}
		
		public function set overSkin(value:Image):void{
			if(_overSkin!=value){
				_overSkin = value;
			}
		}
		
		public function get disabledSkin():Image
		{
			return _disabledSkin;
		}
		public function set disabledSkin(value:Image):void
		{
			if(_disabledSkin!=value){
				_disabledSkin = value;
			}
		}
		
		override public function initStyle():void
		{
			_button = hostComponents.lastElement() as Button;
			_button.textLabel.textField.defaultTextFormat = _textFormat;
		}
		/**
		 * 字体修饰格式 默认值null 可选择的[null underline]
		 */
		public function set textDecoration(value:String):void
		{
			if(_textDecoration!=value){
				_textDecoration = value;
				_textFormat.underline = _textDecoration;
				applyStyle();
			}
		}
		
		public function get textDecoration():String
		{
			return _textDecoration;
		}
		
		/**
		 * 构造方法
		 */
		public function ButtonStyle()
		{
			if(!_textFormat){
				_textFormat = new TextFormat(fontFamily,fontSize,color,fontWeight,fontStyle,textDecoration,null,null,textAlign);
			}
		}
	}
}