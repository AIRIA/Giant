package giant.display.manager
{
	import giant.display.core.UIComponent;

	/**
	 * UIComponent组件样式的管理器的基类
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-24
	 *
	 */
	public class StyleManager
	{
		/**
		 * 样式实例所修饰的主机组件 此组件保存了StyleManager以及子类的实例 所修饰的UIComponent实例的引用
		 */
		public var hostComponent:UIComponent;
		/**
		 * 构造方法
		 */
		public function StyleManager()
		{
		}
	}
}