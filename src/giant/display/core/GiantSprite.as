package giant.display.core
{
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * 继承自flash.display.Sprite 
	 * 封装了关于矩阵转换的步骤
	 * 通过平移来动态设置所谓的"注册点" 来进行缩放 旋转的操作
	 * 平移过程的逻辑是先将注册点转换成为全局的坐标 然后通过矩阵的translate方法将注册点平移到(0,0) 
	 * 然后进行旋转和缩放的操作 操作完成之后 重新平移到"注册点"实际的位置
	 * 
	 * <p>矩阵在使用前先clone一份matrix的副本 设置完matrix之后 要将matrix重新赋值给显示对象的transform.matrix属性<p>
	 * 
	 * @author AIRIA email:chaibingcheng0305@163.com
	 * @date 2012-12-23
	 *
	 */
	public class GiantSprite extends Sprite
	{
		private var _matrix:Matrix;
		private var _pivotX:Number=0;
		private var _pivotY:Number=0;
		private var _rotation:Number = 0;
		private var _scaleX:Number = 1;
		private var _scaleY:Number = 1;

		/**
		 * 获得显示对象左上角的全局坐标
		 */
		public function globalPoint():Point
		{
			var point:Point=new Point(pivotX, pivotY);
			if (parent)
			{
				point=localToGlobal(point);
			}
			point = new Point(Math.round(point.x),Math.round(point.y));
			return point;
		}

		override public function set scaleX(value:Number):void{
			_scaleX = value;
			applyMatrix();
		}
		
		override public function set scaleY(value:Number):void{
			_scaleY = value;
			applyMatrix();
		}
		
		/**
		 * 覆盖父类的rotation方法 对rotation前后进行aop操作
		 */
		override public function set rotation(value:Number):void
		{
			_rotation = value;
			applyMatrix()
		}
		
		private function applyMatrix():void{
			var regPoint:Point = globalPoint();
			var m:Matrix = matrix.clone();
			m.translate(-regPoint.x, -regPoint.y);
			m.scale(_scaleX,_scaleY);
			m.rotate(_rotation/180 * Math.PI);
			m.translate(regPoint.x, regPoint.y);
			transform.matrix=m;
		}
		
		public function GiantSprite()
		{
			super();
		}

		public function get pivotY():Number
		{
			return _pivotY;
		}

		/**
		 * 显示对象旋转缩放中心坐标y值
		 */
		public function set pivotY(value:Number):void
		{
			if (_pivotY != value)
			{
				_pivotY=value;
			}
		}

		public function get pivotX():Number
		{
			return _pivotX;
		}

		/**
		 * 显示对象旋转缩放中心坐标x值
		 */
		public function set pivotX(value:Number):void
		{
			if (_pivotX != value)
			{
				_pivotX=value;
			}
		}

		/**
		 * transform.matrix的副本
		 */
		public function get matrix():Matrix
		{
			if (!_matrix)
			{
				_matrix=transform.matrix.clone();
			}
			return _matrix;
		}

	}
}
