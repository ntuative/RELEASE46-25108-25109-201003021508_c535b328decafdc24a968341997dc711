package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_410:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_401:int = 0;
      
      public static const const_991:int = 2;
      
      public static const const_903:int = 1;
      
      public static const const_671:Boolean = false;
      
      public static const const_556:String = "";
      
      public static const const_402:int = 0;
      
      public static const const_478:int = 0;
      
      public static const const_470:int = 0;
       
      
      private var var_1955:int = 0;
      
      private var var_1642:String = "";
      
      private var var_1491:int = 0;
      
      private var var_1951:int = 0;
      
      private var var_1954:Number = 0;
      
      private var var_1953:int = 255;
      
      private var var_1952:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1955;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1491 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1954;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1951 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function get tag() : String
      {
         return var_1642;
      }
      
      public function get alpha() : int
      {
         return var_1953;
      }
      
      public function get ink() : int
      {
         return var_1491;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1954 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1951;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1952 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1952;
      }
      
      public function set tag(param1:String) : void
      {
         var_1642 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1953 = param1;
      }
   }
}
