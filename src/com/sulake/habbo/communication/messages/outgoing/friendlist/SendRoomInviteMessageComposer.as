package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_1468:String;
      
      private var var_897:Array;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         var_897 = new Array();
         super();
         this.var_1468 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_897.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_897.length)
         {
            _loc1_.push(this.var_897[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1468);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_897 = null;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_897.push(param1);
      }
   }
}
