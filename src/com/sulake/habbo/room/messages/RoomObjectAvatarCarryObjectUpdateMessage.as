package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1049:int;
      
      private var var_1287:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1049 = param1;
         var_1287 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1049;
      }
      
      public function get method_10() : String
      {
         return var_1287;
      }
   }
}
