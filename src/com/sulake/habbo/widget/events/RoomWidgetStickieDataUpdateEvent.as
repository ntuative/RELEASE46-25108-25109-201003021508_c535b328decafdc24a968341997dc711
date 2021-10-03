package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_719:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_199:String;
      
      private var var_645:String;
      
      private var var_1407:String;
      
      private var var_155:int = -1;
      
      private var var_11:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_155 = param2;
         var_1407 = param3;
         var_199 = param4;
         var_645 = param5;
         var_11 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1407;
      }
      
      public function get colorHex() : String
      {
         return var_645;
      }
      
      public function get text() : String
      {
         return var_199;
      }
      
      public function get objectId() : int
      {
         return var_155;
      }
      
      public function get controller() : Boolean
      {
         return var_11;
      }
   }
}
