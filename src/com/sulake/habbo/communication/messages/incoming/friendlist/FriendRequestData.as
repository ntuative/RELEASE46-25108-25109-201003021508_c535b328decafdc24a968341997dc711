package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1875:int;
      
      private var var_1876:String;
      
      private var var_1032:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1032 = param1.readInteger();
         this.var_1876 = param1.readString();
         this.var_1875 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1032;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1875;
      }
      
      public function get method_5() : String
      {
         return this.var_1876;
      }
   }
}
