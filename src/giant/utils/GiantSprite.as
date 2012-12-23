package giant.utils
{
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
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
		private var _rotation:Number;

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

		/**
		 * 覆盖父类的rotation方法 对rotation前后进行aop操作
		 */
		override public function set rotation(value:Number):void
		{
			var regPoint:Point = globalPoint();
			var m:Matrix = matrix.clone();
			m.translate(-regPoint.x, -regPoint.y);
			super.rotation=value;
			m.rotate(rotation / 180 * Math.PI);
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
