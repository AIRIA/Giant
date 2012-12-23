package giant.display.core
{
	import giant.display.core.inter.IUIComponent;

	/**
	 * 每个对象在首次添加到舞台 或者显式的去调用失效-验证环节的时候 方法首先被添加到 PriorityQueue队列中
	 * 提交阶段是从外到内执行  也就是从nestLevel由小到大来执行
	 * 测量阶段是由内到外执行  也就是nestLevel由大到小执行
	 * 布局阶段和提交阶段的执行顺序是一样的
	 * 
	 * @author AIRIA email:chaibingcheng0305#163.com
	 * @date 2012-12-23
	 *
	 */
	public class PriorityQueue
	{
		
		private var priorityArr:Array = [];
		/**
		 * 构造方法
		 */
		public function PriorityQueue()
		{
			
		}
		/**
		 * 队列的长度
		 */
		public function get length():Number{
			return priorityArr.length;
		}
		/** @private 对UIComponent的实例 根据nestLevel属性进行排序 **/
		private function sortFun(ui1:IUIComponent,ui2:IUIComponent):Number
		{
			if(ui1.nestLevel>ui2.nestLevel){	
				return 1;
			}else if(ui1.nestLevel==ui2.nestLevel){
				return 0;
			}else if(ui1.nestLevel<ui2.nestLevel){
				return -1;
			}
			return 0;
		}
		/**
		 * 队列中的元素进行从小到大的排序
		 */
		public function sortElement():void{
			priorityArr.sort(sortFun);
		}
		/**
		 * 将即将要进行验证的显示对象 添加到优先队列中
		 */
		public function addElement(ele:IUIComponent):void{
			priorityArr.push(ele);
		}
		/**
		 * 
		 */
		public function removeSmallest():UIComponent{
			return priorityArr.shift();
		}
		
		/**
		 * 
		 */
		public function removeLargest():UIComponent{
			return priorityArr.pop();
		}
	}
}