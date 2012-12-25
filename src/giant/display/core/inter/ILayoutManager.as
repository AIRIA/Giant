package giant.display.core.inter
{
	/**
	 * 
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 * @see giant.display.core.LayoutManager
	 */
	public interface ILayoutManager
	{
		/**
		 * 此方法中将要调用validateProperties方法的对象添加到 方法队列中
		 */
		function invalidateProperties(ui:IUIComponent):void;
		/**
		 * 此方法中将要调用validateSize方法的ILayoutManagerClient类型对象添加到方法队列中
		 */
		function invalidateSize(ui:IUIComponent):void;
		/**
		 * 此方法将要调用validateDisplayList方法的ILayoutManagerClient类型对象添加到方法队列中
		 */
		function invalidateDisplayList(ui:IUIComponent):void;
		
		function attachListener():void;
	}
}