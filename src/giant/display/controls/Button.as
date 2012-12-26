package giant.display.controls
{
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	
	import giant.display.core.UIComponent;
	import giant.display.style.ButtonStyle;

	/**
	 * Button 控件是常用的矩形按钮。Button 控件看起来似乎可以按压。控件表面可以包含文本标签和（或）图标。
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-25
	 *
	 */
	public class Button extends UIComponent
	{
		private var _label:String;
		private var _icon:Image;
		private var _textLabel:Label;
		private var _iconPlacement:String = "left";
		private var _phase:String;
		private var tempSkin:UIComponent;
		/**
		 * 构造方法
		 */
		public function Button()
		{
			super();
			
			mouseChildren = false;
			buttonMode = true;
			addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			addEventListener(MouseEvent.CLICK,clickHandler);
			addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
			addEventListener(MouseEvent.MOUSE_UP,upHandler);
			phase = ButtonPhase.UP;
			_textLabel = new Label();
			_textLabel.textField.autoSize = TextFieldAutoSize.CENTER;
			addChild(_textLabel);
		}
		
		public function get textLabel():Label{
			return _textLabel;
		}
		
		private function upHandler(event:MouseEvent):void
		{
			phase = ButtonPhase.OVER;
		}
		
		private function downHandler(event:MouseEvent):void
		{
			phase = ButtonPhase.DOWN;
		}
		
		private function clickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		private function rollOutHandler(event:MouseEvent):void
		{
			phase = ButtonPhase.UP;
		}
		
		private function rollOverHandler(event:MouseEvent):void{
			if(phase == ButtonPhase.UP){
				/**
				 * 如果鼠标已经按下了 就不在继续执行 
				 */
				if(event.buttonDown){
					return;
				}
				phase = ButtonPhase.OVER;
				trace("rollover");
			}
		}
		
		override protected function commitProperties():void
		{
			changeState();
		}
		
		override protected function updateDisplayList():void
		{
			if(icon){
				textLabel.width = explicitOrMeasureWidth - icon.width;
			}else{
				textLabel.width = explicitOrMeasureWidth;
			}
			buttonStyle.textAlign = "center";
			textLabel.y = explicitOrMeasureHeight-textLabel.textField.textHeight >> 1;
		}
		
		
		/**
		 * @private
		 */
		private function changeState():void
		{
			if(tempSkin&&contains(tempSkin)){
				removeChild(tempSkin);
			}
			if(phase==ButtonPhase.UP){
				tempSkin = buttonStyle.upSkin;
			}else if(phase==ButtonPhase.OVER){
				tempSkin = buttonStyle.overSkin;
			}else if(phase==ButtonPhase.DOWN){
				tempSkin = buttonStyle.downSkin;
			}
			if(tempSkin){
				tempSkin.width = explicitWidth;
				tempSkin.height = explicitHeight;
				addChildAt(tempSkin,0); 
			}
			
		}
		
		
//---------------setter/getter methods------------------------------
		
		private function get buttonStyle():ButtonStyle
		{
			ButtonStyle(style);
			return ButtonStyle(style);
		}
		
		/**
		 * 当前鼠标的状态 [ButtonPhase.UP ButtonPhase.DOWN ButtonPhase.OVER]
		 */
		public function get phase():String
		{
			return _phase;
		}
		
		public function set phase(value:String):void
		{
			if(_phase!=value){
				_phase = value;
				invalidateSize();
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		
		/**
		 * 按钮上显示的图标
		 */
		public function set icon(value:Object):void
		{
			if(!_icon){
				icon = new Image(value); 
			}else{
				_icon.source = value;
			}
		}
		
		public function get icon():Object
		{
			return _icon;
		}
		
		/**
		 * button上显示的提示文字
		 */
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			if(_label!=value){
				_label = value;
				_textLabel.text = value;
				trace(_textLabel.textHeight,_textLabel.height);
			}
			
		}
		
	}
}