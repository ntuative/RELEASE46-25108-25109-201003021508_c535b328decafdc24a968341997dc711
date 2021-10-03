package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_2191:int;
      
      private var var_2190:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_2190 = param1;
         var_2191 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_2190),_roomId,var_2191];
      }
      
      public function dispose() : void
      {
      }
   }
}
