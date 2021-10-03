package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1621:String;
      
      private var var_538:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_538 = param1;
         var_1621 = param2;
      }
      
      public function get race() : String
      {
         return var_1621;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
   }
}
