package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_951:String = "RORUM_ROOM_AD_ACTIVATE";
       
      
      private var var_843:String;
      
      private var var_1556:String;
      
      private var _type:String;
      
      public function RoomObjectRoomAdUpdateMessage(param1:String, param2:String, param3:String)
      {
         super(null,null);
         _type = param1;
         var_843 = param2;
         var_1556 = param3;
      }
      
      public function get asset() : String
      {
         return var_843;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get clickUrl() : String
      {
         return var_1556;
      }
   }
}
