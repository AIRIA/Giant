package giant.events
{
	import flash.events.Event;
	
	/**
	 *
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-27
	 *
	 */
	public class GiantEvent extends Event
	{
		/**
		 * 通过网络加载文件完毕后会触发
		 */
		public static const LOAD_COMPLETE:String = "load_complete";
		/**
		 * 事件传播过程中携带的数据
		 */
		public var data:Object;
		
		
		public function GiantEvent(type:String,data:Object=null,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			//TODO: implement function
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}