package giant.display.core.inter
{
	
	/**
	 * 定义了基本的显示组件所需要实现的方法 和具备的属性
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 *
	 */
	public interface IUIComponent
	{
		/**
		 * 明确设置的组件的宽度
		 * <p>因为在组件没有任何显示组件的时候 尝试设置组件的width属性 不会有任何的效果 即使设置了width width的值也是0</p>
		 * <p>explicitWidth 可以保存明确设置的width属性值 </p>
		 */
		function set explicitWidth(value:Number):void;
		function get explicitWidth():Number;
		/**
		 * 明确设置的组件的高度
		 * <p>因为在组件没有任何显示组件的时候 尝试设置组件的height属性 不会有任何的效果 即使设置了height height的值也是0</p>
		 * <p>explicitHeight 可以保存明确设置的height属性值 </p>
		 */
		function set explicitHeight(value:Number):void;
		function get explicitHeight():Number;
		/**
		 * 显示对象的外接矩形显示区域的宽度
		 */
		function set measureWidth(value:Number):void;
		function get measureWidth():Number;
		
		/**
		 * 显示对象的外接矩形显示区域的高度
		 */
		function set measureHeight(value:Number):void;
		function get measureHeight():Number;
		
		/**
		 * 快速获取显示对象的宽度 优先获取explicitWidth 如果没有明确设置宽度则返回measureWidth的值
		 */
		function get explicitOrMeasureWidth():Number;
		/**
		 * 快速获取显示对象的高度 优先返回explcitHeight的值 如果没有明确设置宽度则返回measureHeight的值
		 */
		function get explicitOrMeasureHeight():Number;
		/**
		 * 组件所在的父级组件 
		 */
		function get owner():IUIComponent;
		
	}
}