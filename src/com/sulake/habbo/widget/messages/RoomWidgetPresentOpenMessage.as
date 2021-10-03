package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_667:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_155:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         var_155 = param2;
      }
      
      public function get objectId() : int
      {
         return var_155;
      }
   }
}
