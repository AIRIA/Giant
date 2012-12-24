package giant.display.controls
{
	import flash.text.TextField;
	
	import giant.display.core.UIComponent;

	/**
	 * Label 控件显示一行不可编辑的文本。
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-24
	 *
	 */
	public class Label extends UIComponent
	{

		private var _textField:TextField;
		private var _text:String;
		private var _selectable:Boolean=false;
		private var _textWidth:Number = 0;
		private var _textHeight:Number = 0;

		/**
		 * 构造方法
		 */
		public function Label()
		{
			super();
		}

		override protected function createChildren():void
		{
			_textField=new TextField();
			addChild(_textField);
		}

		override protected function commitProperties():void
		{
			_textField.text = text;
			_textField.selectable = selectabel;
		}


//-----------------setter/getter methods-----------------------------------------------
		public function get text():String
		{
			return _text;
		}

		/**
		 * 指定由此控件显示的纯文本。
		 */
		public function set text(value:String):void
		{
			if (_text != value)
			{
				_text=value;
				invalidateProperties();
			}
		}

		public function get selectabel():Boolean
		{
			return _selectable;
		}

		/**
		 * 指定是否可以选择文本。允许选择文本将使您能够从控件中复制文本。 默认值为false
		 */
		public function set selectabel(value:Boolean):void
		{
			if (_selectable != value)
			{
				_selectable=true;
			}
		}
		
		/**
		 * 显示文本的宽度
		 */
		public function get textWidth():Number{
			if(_textField){
				_textWidth = _textField.textWidth;
			}
			return _textWidth;
		}
		
		/**
		 * 显示文本的高度
		 */
		public function get textHeight():Number
		{
			if(_textField){
				_textHeight = _textField.textHeight;
			}
			return _textHeight;
		}
	}
}
