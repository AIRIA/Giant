package giant.display.core.inter
{
	
	/**
	 * ILayoutManagerClient 被UIComponent实现 同时也实现了ILayoutManager
	 * ILayoutManager的实现类 LayoutManager类 会调用ILayoutManager方法中定义的Api
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 *
	 */
	public interface ILayoutManagerClient
	{
		/**
		 * 验证组件的属性
		 */
		function validateProperties():void;
		/**
		 * 验证组件的尺寸
		 */
		function validateSize():void;
		/**
		 * 验证组件的位置和布局
		 */
		function validateDisplayList():void;
	}
}