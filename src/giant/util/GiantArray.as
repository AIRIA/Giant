package giant.util
{
	/**
	 * 继承了Array扩充了常用的筛选和过滤方法
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-25
	 *
	 */
	dynamic public class GiantArray extends Array
	{
		/**
		 * 允许创建指定元素数量的数组。
		 * 如果不指定任何参数，则创建包含 0 个元素的数组。如果指定多个元素，则创建包含 numElements 个元素的数组
		 */
		public function GiantArray()
		{
			super();
		}
		/**
		 * 向元素队列中添加不重复的元素 
		 * 如果已经存在了即将添加的元素的话 则忽略此操作
		 */
		public function addUniqueElement(element:Object):void
		{
			if(indexOf(element)==-1){
				push(element);
			}
		}
		/**
		 * 删除指定的操作 如果没有
		 */
		public function removeElement(element:Object):void{
			var index:Number = indexOf(element);
			if(index!=-1){
				splice(index,1);
			}
		}
		/**
		 * 获取最后一个元素
		 */
		public function lastElement():Object{
			return this[length-1];
		}
		
		/**
		 * 清空元素
		 */
		public function removeAll():void{
			length = 0;
		}
		
	}
}