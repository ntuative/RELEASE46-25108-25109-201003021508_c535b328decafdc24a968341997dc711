package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1558:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1427:String = "ROE_MOUSE_ENTER";
      
      public static const const_378:String = "ROE_MOUSE_MOVE";
      
      public static const const_1479:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_197:String = "ROE_MOUSE_CLICK";
      
      public static const const_388:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1632:Boolean;
      
      private var var_1635:Boolean;
      
      private var var_1627:Boolean;
      
      private var var_1631:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1627 = param4;
         var_1631 = param5;
         var_1632 = param6;
         var_1635 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1635;
      }
      
      public function get altKey() : Boolean
      {
         return var_1627;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1631;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1632;
      }
   }
}
