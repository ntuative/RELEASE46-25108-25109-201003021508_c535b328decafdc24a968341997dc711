package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_700:String;
      
      private var var_1637:int;
      
      private var var_1408:Boolean;
      
      private var _roomId:int;
      
      private var var_1636:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1408 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_700 = param1.readString();
         var_1636 = param1.readInteger();
         var_1637 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1408;
      }
      
      public function get roomName() : String
      {
         return var_700;
      }
      
      public function get enterMinute() : int
      {
         return var_1637;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1636;
      }
   }
}
