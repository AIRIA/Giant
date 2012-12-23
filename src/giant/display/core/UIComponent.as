package giant.display.core
{
	import flash.display.DisplayObject;
	
	import giant.display.core.inter.ILayoutManagerClient;
	import giant.display.core.inter.IUIComponent;
	import giant.utils.GiantSprite;
	
	/**
	 * Giant库中一切显示对象的基础组件 继承了Sprit 并扩展了Sprite 
	 * 添加了 属性校验  度量 布局 三阶段的 invalidate-validate的验证模式
	 * 避免了重复计算的弊端 有效提高计算效率
	 * 
	 * <p>
	 * 在子类的组件中并没有直接覆盖 validateProperties validateSize validateDisplayList方法
	 * validateProperties 调用了commiteProperties,validateSize调用了measureSize方法,
	 * validateDisplayList调用了updateDisplayList方法.
	 * 子类组件需要覆盖的是 commitProperties measureSize updateDisplayList方法 
	 * </p>
	 * 
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-20
	 *
	 */
	public class UIComponent extends GiantSprite implements IUIComponent,ILayoutManagerClient
	{
		/* 以下定义的属性用来配合setter/getter方法 */
		private var _explicitWidth:Number;
		private var _explicitHeight:Number;
		private var _measureWidth:Number;
		private var _measureHeight:Number;
		private var _owner:IUIComponent;
		private var _width:Number = 0;
		private var _height:Number = 0;
		
		/* 以下定义的变量用来供逻辑方法使用  */
		private var invalidatePropertiesFlag:Boolean = false;
		private var invalidateSizeFlag:Boolean = false;
		private var invalidateDisplayListFlag:Boolean = false;
		private var initialized:Boolean = false;
		private var _nestLevel:Number = 0;
		
		public function UIComponent()
		{
			super();
		}
//--------------override methods------------------------------------------------------
		
		override public function addChild(child:DisplayObject):DisplayObject{
			super.addChild(child);
			addedChild(child);
			return child;
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject{
			super.addChildAt(child,index);
			addedChild(child);
			return child;
		}
		
//--------------logic methods---------------------------------------------------------
		/**
		 * 显示对象被添加到显示列表后开始调用显示对象的 初始化方法 整个生命周期中只调用一次 
		 */
		private function addedChild(child:DisplayObject):void{
			if(child is IUIComponent){
				var uiComp:UIComponent = UIComponent(child);
				uiComp._owner = this;
				if(!uiComp.initialized){
					uiComp.initialize();
					uiComp.initialized = true;
				}
				uiComp.nestLevel = nestLevel + 1;
			}
		}
		/**
		 * 组件被添加到父级显示列表之后调用此方法
		 */
		private function initialize():void{
			createChildren();
			invalidateProperties();
			invalidateSize();
			invalidateDisplayList();
		}
 		/**
		 * 子类可以覆盖此方法来创建自己需要添加显示对象到显示列表中
		 */
		protected function createChildren():void{
			
		}
		/**
		 * 使属性失效 在LayoutManager中重新生效
		 */
		protected function invalidateProperties():void{
			if(!this.invalidatePropertiesFlag){
				/* 标记属性已经失效 等待生效 将标识位设置为true 避免重复的计算操作  一下的invalidateXXX方法作用相同*/
				this.invalidatePropertiesFlag = true;
				UIComponentGlobal.layoutManager.invalidateProperties(this);
			}
		}
		/**
		 * 使尺寸失效 在LayoutManager中重新生效
		 */
		protected function invalidateSize():void{
			if(!this.invalidateSizeFlag){
				this.invalidateSizeFlag = true;
				UIComponentGlobal.layoutManager.invalidateSize(this);
			}
		}
		/**
		 * 使显示列表失效 在LayoutManager中重新生效
		 */
		protected function invalidateDisplayList():void{
			if(!this.invalidateDisplayListFlag){
				this.invalidateDisplayListFlag = true;
				UIComponentGlobal.layoutManager.invalidateDisplayList(this);
			}
		}
		
		public function validateProperties():void{
			trace(this.name,"validateProperties");
			commitProperties();
		}
		/**
		 * 子类中重写此方法 来实现属性的提交  之所以不直接重写validateProperties 可以在实现的更高级别来有效的扩展其他的功能
		 */
		protected function commitProperties():void{
			
		}
		
		public function validateSize():void{
			trace(this.name,"validateSize");
			measureSize();
		}
		/**
		 * 子类来重写此方法来 实现度量的逻辑
		 */
		protected function measureSize():void{
			
		}
		
		public function validateDisplayList():void{
			trace(this.name,"validateDisplayList");
			updateDisplayList();
		}
		/**
		 * 重写此方法来实现显示列表的重新定位和布局操作
		 */
		protected function updateDisplayList():void{
			
		}
//-------------getter/setter methods--------------------------------------------------	
		public function set nestLevel(value:Number):void
		{
			if(_nestLevel!=value){
				_nestLevel = value;
				value++;
				/**
				 * 可以达到级联设置子级显示列表nestLevel的效果
				 */
				for(var i:int=0;i<numChildren;i++){
					var ui:IUIComponent = IUIComponent(getChildAt(i));
					if(ui){
						ui.nestLevel = value;
					}
				}
			}
		}
		
		override public function set width(value:Number):void
		{
			if(_width!=value){
				_width = value;
				_explicitWidth = value;
			}
		}
		
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set height(value:Number):void
		{
			if(_height!=value){
				_height = value;
				_explicitHeight = value;
			}
		}
		
		override public function get height():Number
		{
			return _height;
		}
		
		public function get nestLevel():Number
		{
			return _nestLevel;
		}
		
		public function set explicitHeight(value:Number):void
		{
			if(this._explicitHeight!=value){
				this._explicitHeight = value;
			}
		}
		
		public function get explicitHeight():Number
		{
			return this._explicitHeight;
		}
		
		public function get explicitOrMeasureHeight():Number
		{
			return isNaN(this._explicitHeight)?this._measureHeight:this._explicitHeight;
		}
		
		public function get explicitOrMeasureWidth():Number
		{
			return isNaN(this._explicitWidth)?this._measureWidth:this._explicitWidth;
		}
		
		public function set explicitWidth(value:Number):void
		{
			if(this._explicitWidth!=value){
				this._explicitWidth = value;
			}
		}
		
		public function get explicitWidth():Number
		{
			return this._explicitWidth;
		}
		
		public function set measureHeight(value:Number):void
		{
			if(this._measureHeight!=value){
				this._measureHeight = value;
			}
		}
		
		public function get measureHeight():Number
		{
			return this._measureHeight;
		}
		
		public function set measureWidth(value:Number):void
		{
			if(this._measureWidth!=value){
				this._measureWidth = value;
			}
		}
		
		public function get measureWidth():Number
		{
			return this._measureWidth;
		}
		
		public function get owner():IUIComponent
		{
			return this._owner;
		}
		
	}
}