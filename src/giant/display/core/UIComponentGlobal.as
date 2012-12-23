package giant.display.core
{
	import giant.display.core.inter.ILayoutManager;

	/**
	 * UIComponentGlobal静态类 
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 *
	 */
	public class UIComponentGlobal
	{
		/**
		 * layoutManger是一个单例对象 它负责维护整个显示列表的提交--测量--布局 三阶段的失效--生效的验证模式 
		 */
		public static function get layoutManager():ILayoutManager{
			return LayoutManager.getInstance()
		}
	}
}