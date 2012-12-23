package giant.display.core
{
	import flash.display.Stage;

	/**
	 * Giant类主要负责获取关于stage的信息
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-20
	 *
	 */
	public class Giant
	{
		public static var stage:Stage;
		public function Giant(stage:Stage)
		{
			Giant.stage = stage;
		}
	}
}