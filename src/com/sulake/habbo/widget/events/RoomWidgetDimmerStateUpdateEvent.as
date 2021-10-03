package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const DIMMER_STATE:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1065:int;
      
      private var _color:uint;
      
      private var var_1066:int;
      
      private var var_2019:int;
      
      private var var_32:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(DIMMER_STATE,param6,param7);
         var_32 = param1;
         var_2019 = param2;
         var_1065 = param3;
         _color = param4;
         var_1066 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1066;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1065;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function get presetId() : int
      {
         return var_2019;
      }
   }
}
