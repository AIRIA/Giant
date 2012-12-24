package giant.display.style
{
	import giant.display.manager.StyleManager;

	/**
	 * 设置Label的样式
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-24
	 *
	 */
	public class LabelStyle extends StyleManager
	{
		/**
		 * 文本颜色 默认值0x0B333C
		 */
		public var color:uint=0x0B333C;
		/**
		 * 文本在禁用交互时候的颜色 默认颜色值0xAAB3B3
		 */
		public var disabledColor:uint=0xAAB3B3;
//		fontAntiAliasType="advanced|normal"
		/**
		 * 字体类型 默认字体"Verdana"
		 */
		public var fontFamily:String="Verdana";
//		public var fontGridFitType:String="pixel|none|subpixel"
//		public var fontSharpness:String="0"
		/**
		 * 文本的高度，以像素为单位。默认值10
		 */
		public var fontSize:Number=10;
		/**
		 * 字体类型 默认值normal [normal italic]
		 */
		public var fontStyle:String="normal|italic";
		public var fontThickness:Number=0;
		/**
		 * 确定文本是否使用粗体。可识别的值为 normal 和 bold。 默认值normal
		 */
		public var fontWeight:String="normal|bold"
		/**
		 *标签的左侧与文本的左侧之间的像素数目。 默认值为 0.
		 */
		public var paddingLeft:Number=0;
		/**
		 *标签的右侧与文本的右侧之间的像素数目。 默认值为 0.
		 */
		public var paddingRight:Number=0;
		/**
		 * 标签顶部与文本顶部之间的像素数目。 默认值为 0.
		 */
		public var paddingTop:Number=0;
		/**
		 * 标签底部与文本底部之间的像素数目。 默认值为 0.
		 */
		public var paddingBottom:Number=0;
		/**
		 * 容器内文本的对齐情况。可能值有："left"、"right" 或 "center"。
		 * 大多数组件的默认值为 "left"。
		 */
		public var textAlign:String="left|right|center";
		/**
		 * 字体修饰格式 默认值none 可选择的[none underline]
		 */
		public var textDecoration:String="none|underline";
		/**
		 *文本第一行偏离容器左侧的距离（以像素为单位）。 默认值为 0.
		 */
		public var textIndent:Number=0;

		public function LabelStyle()
		{

		}
	}
}
