package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_209:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2115:Boolean = false;
      
      private var var_2114:int = 0;
      
      private var var_2116:int = 0;
      
      private var var_2113:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_209,param5,param6);
         var_2113 = param1;
         var_2116 = param2;
         var_2114 = param3;
         var_2115 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2114;
      }
      
      public function get periodsLeft() : int
      {
         return var_2116;
      }
      
      public function get daysLeft() : int
      {
         return var_2113;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2115;
      }
   }
}
