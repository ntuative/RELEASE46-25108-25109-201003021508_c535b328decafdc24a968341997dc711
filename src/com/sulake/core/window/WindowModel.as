package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_362:Rectangle;
      
      protected var var_15:uint;
      
      protected var var_144:Rectangle;
      
      protected var _type:uint;
      
      protected var var_1098:Boolean = true;
      
      protected var var_143:Rectangle;
      
      protected var var_614:uint = 16777215;
      
      protected var var_32:uint;
      
      protected var var_81:uint;
      
      protected var var_335:Boolean = true;
      
      protected var var_319:String = "";
      
      protected var var_75:WindowRectLimits;
      
      protected var var_1363:uint;
      
      protected var var_742:Boolean = false;
      
      protected var var_410:Number = 1;
      
      protected var var_54:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_5:Rectangle;
      
      protected var _context:WindowContext;
      
      protected var var_613:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param3;
         var_15 = param5;
         var_32 = WindowState.const_84;
         var_81 = param4;
         var_613 = param8 == null ? new Array() : param8;
         _context = param6;
         var_5 = param7.clone();
         var_362 = param7.clone();
         var_54 = param7.clone();
         var_143 = new Rectangle();
         var_144 = null;
         var_75 = new WindowRectLimits(this as IWindow);
      }
      
      public function getMinHeight() : int
      {
         return var_75.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_75.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return var_15;
      }
      
      public function get state() : uint
      {
         return var_32;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_144.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_143.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_75;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_32 & param2 ^ param1) == 0;
         }
         return (var_32 & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_5 = null;
            var_32 = WindowState.const_469;
            _disposed = true;
            var_613 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_5.height;
      }
      
      public function get position() : Point
      {
         return var_5.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_742;
      }
      
      public function get context() : IWindowContext
      {
         return _context;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_144.height;
      }
      
      public function get style() : uint
      {
         return var_81;
      }
      
      public function getMaxWidth() : int
      {
         return var_75.maxWidth;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_81 & param2 ^ param1) == 0;
         }
         return (var_81 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_15 & param2 ^ param1) == 0;
         }
         return (var_15 & param1) == param1;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_1098;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_5.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_410;
      }
      
      public function getInitialHeight() : int
      {
         return var_362.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_143.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_362.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_54.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_614;
      }
      
      public function get caption() : String
      {
         return var_319;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxHeight = param1;
         return _loc2_;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_5;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_335;
      }
      
      public function getMaxHeight() : int
      {
         return var_75.maxHeight;
      }
      
      public function get x() : int
      {
         return var_5.x;
      }
      
      public function get y() : int
      {
         return var_5.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_54.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
   }
}
