package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_397:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_312:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_823:int;
      
      private var var_262:Boolean;
      
      private var var_1643:Boolean;
      
      private var var_1483:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_823 = param2;
         var_1643 = param3;
         var_262 = param4;
         var_1483 = param5;
      }
      
      public function get position() : int
      {
         return var_823;
      }
      
      public function get isActive() : Boolean
      {
         return var_262;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1483;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1643;
      }
   }
}
