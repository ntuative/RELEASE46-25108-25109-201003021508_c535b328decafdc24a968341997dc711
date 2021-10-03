package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1062:int;
      
      private var var_1689:int;
      
      private var var_1396:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1396 = param1.readInteger();
         var_1689 = param1.readInteger();
         var_1062 = param1.readInteger();
         var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1396);
      }
      
      public function get reportedUserId() : int
      {
         return var_1062;
      }
      
      public function get callerUserId() : int
      {
         return var_1689;
      }
      
      public function get callId() : int
      {
         return var_1396;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_113;
      }
   }
}
