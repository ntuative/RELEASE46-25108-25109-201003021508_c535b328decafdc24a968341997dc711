package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1819:String;
      
      private var var_792:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1819 = param1;
         var_792 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1819;
      }
      
      public function get parameter() : String
      {
         return var_792;
      }
   }
}
