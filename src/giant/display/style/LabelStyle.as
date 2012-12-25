package giant.display.style
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import giant.display.controls.Label;
	import giant.display.manager.StyleManager;

	/**
	 * 设置Label的样式
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-24
	 *
	 */
	public class LabelStyle extends StyleManager
	{
		
		private var _textField:TextField;
		private var _hosts:Array = [];
		private var _color:uint=0x0B333C;
		private var _textFormat:TextFormat;
		private var _fontFamily:String="Verdana";
		private var _fontSize:Number=20;
		private var _textAlign:String="left";
		private var _fontStyle:String=null ;
		private var _fontWeight:String=null;
		private var _textDecoration:String=null;
		
		private function applyStyle():void{
			for(var i:int=0;i<hostComponents.length;i++){
				Label(hostComponents[i])._textField.defaultTextFormat = _textFormat;
				Label(hostComponents[i])._textField.text = Label(hostComponents[i])._textField.text;
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
		 * 文本在禁用交互时候的颜色 默认颜色值0xAAB3B3
		 */
		public var disabledColor:uint=0xAAB3B3;
//		fontAntiAliasType="advanced|normal"
		
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
		
//		public var fontGridFitType:String="pixel|none|subpixel"
//		public var fontSharpness:String="0"
		
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
		
		public var fontThickness:Number=0;
		
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
		 *标签的左侧与文本的左侧之间的像素数目。 默认值为 0.
		 */
		public var paddingLeft:Number=0;
		/**
		 *标签的右侧与文本的右侧之间的像素数目。 默认值为 0.
		 */
		public var paddingRight:Number=0;
		/**
		 * 标签顶部与文本顶部之间的像素数目。 默认值为 0.
		 */
		public var paddingTop:Number=0;
		/**
		 * 标签底部与文本底部之间的像素数目。 默认值为 0.
		 */
		public var paddingBottom:Number=0;
		
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
		 *文本第一行偏离容器左侧的距离（以像素为单位）。 默认值为 0.
		 */
		private var _textIndent:Number=0;
		
		public function get textIndent():Number
		{
			return _textIndent;
		}
		
		public function set textIndent(value:Number):void{
			if(_textIndent!=value){
				_textIndent = value;
				_textFormat.indent = _textIndent;
				applyStyle();
			}
		}

		override public function initStyle():void
		{
			var label:Label = hostComponents.lastElement() as Label;
			_textField = label._textField;
			_textField.defaultTextFormat = _textFormat;
		}
		
		public function LabelStyle()
		{
			if(!_textFormat){
				_textFormat = new TextFormat(fontFamily,fontSize,color,fontWeight,fontStyle,textDecoration,null,null,textAlign);
			}
		}
	}
}
