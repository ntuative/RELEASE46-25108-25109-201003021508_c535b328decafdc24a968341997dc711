package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_529:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1642:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_529);
         var_1642 = param1;
      }
      
      public function get tag() : String
      {
         return var_1642;
      }
   }
}
