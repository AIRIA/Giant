package giant.display.manager
{
	import giant.util.GiantArray;

	/**
	 * UIComponent组件样式的管理器的基类
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-24
	 *
	 */
	public class StyleManager
	{
		
		private var _hostComponents:GiantArray = new GiantArray();
		
		/**
		 * 样式实例所修饰的主机组件集合  
		 * 此组件保存了StyleManager以及子类的实例 所修饰的UIComponent实例的引用
		 */
		public function get hostComponents():GiantArray{
			return _hostComponents;
		}
		
		/**
		 * 将StyleManager子类实例的默认样式应用到主机组件
		 */
		public function initStyle():void{
			
		}
		
		/**
		 * 构造方法
		 */
		public function StyleManager()
		{
		}
	}
}