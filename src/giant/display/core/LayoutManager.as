package giant.display.core
{
	import flash.events.Event;
	
	import giant.display.core.inter.ILayoutManager;
	import giant.display.core.inter.ILayoutManagerClient;
	import giant.display.core.inter.IUIComponent;
	
	/**
	 * LayoutManager负责UIComponent的生效方法调用
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 *
	 */
	public class LayoutManager implements ILayoutManager
	{
		private static var instance:LayoutManager;
		/* 等待验证的组件的队列 */
		private var validatePropertiesQueue:Array = [];
		private var validateSizeQueue:Array = [];
		private var validateDisplayListQueue:Array = [];
		private var listenerAttached:Boolean = false;
		
//		private var invalidateProperteisFlag:Boolean = false;
//		private var invalidateSizeFlag:Boolean = false;
//		private var invalidateDisplayListFlag:Boolean = false;
		
		/**
		 * 构造方法
		 */
		public function LayoutManager()
		{
			
		}
		/**
		 * LayoutManager的实例
		 * 在程序的生命周期中只保留一份LayoutManager的实例
		 */
		public static function getInstance():LayoutManager{
			if(!instance){
				instance = new LayoutManager();
			}
			return instance;
		}
		
		public function invalidateProperties(ui:IUIComponent):void
		{
			validatePropertiesQueue.push(ui);
			if(!listenerAttached){
				attachListener();
				listenerAttached = true;
			}
		}
		
		public function invalidateSize(ui:IUIComponent):void
		{
			validateSizeQueue.push(ui);
			if(!listenerAttached){
				attachListener();
				listenerAttached = true;
			}
		}
		
		public function invalidateDisplayList(ui:IUIComponent):void
		{
			validateDisplayListQueue.push(ui);
			if(!listenerAttached){
				attachListener();
				listenerAttached = true;
			}
		}
		
		/**
		 * 开始执行渲染的操作
		 */
		public function attachListener():void
		{
			Giant.stage.addEventListener(Event.RENDER,renderHandler);
			Giant.stage.invalidate();
		}
		/**
		 * 渲染的逻辑
		 * <p>首先将提交阶段的全部方法执行完毕 然后开始执行 测量 最后执行布局的逻辑</p>
		 */
		public function renderHandler(event:Event):void
		{
			Giant.stage.removeEventListener(Event.RENDER,renderHandler);
			while(validatePropertiesQueue.length){
				ILayoutManagerClient(validatePropertiesQueue[0]).validateProperties();
				validatePropertiesQueue.shift();
			}
			while(validateSizeQueue.length){
				ILayoutManagerClient(validateSizeQueue[validateSizeQueue.length-1]).validateSize();
				validateSizeQueue.pop();
			}
			while(validateDisplayListQueue.length){
				ILayoutManagerClient(validateDisplayListQueue[0]).validateDisplayList();
				validateDisplayListQueue.shift();
			}
			listenerAttached = false;
		}
	}
}