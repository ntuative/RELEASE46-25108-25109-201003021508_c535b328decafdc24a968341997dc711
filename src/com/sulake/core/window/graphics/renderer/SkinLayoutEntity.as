package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_228:uint = 1;
      
      public static const const_431:uint = 0;
      
      public static const const_828:uint = 8;
      
      public static const const_269:uint = 4;
      
      public static const const_477:uint = 2;
       
      
      private var var_410:uint;
      
      private var var_2148:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2149:uint;
      
      private var var_99:Rectangle;
      
      private var var_613:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_99 = param3;
         _color = param4;
         var_410 = param5;
         var_2148 = param6;
         var_2149 = param7;
         var_613 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2148;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_410;
      }
      
      public function get scaleV() : uint
      {
         return var_2149;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_99 = null;
         var_613 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_99;
      }
   }
}
