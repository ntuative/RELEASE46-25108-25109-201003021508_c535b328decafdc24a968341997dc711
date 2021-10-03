package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_713:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_644:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_256:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1386:Point;
      
      private var var_1387:Rectangle;
      
      private var var_185:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1387 = param2;
         var_1386 = param3;
         var_185 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1387 != null)
         {
            return var_1387.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_185;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1386 != null)
         {
            return var_1386.clone();
         }
         return null;
      }
   }
}
