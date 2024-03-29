package com.sulake.habbo.communication.messages.outgoing.room.chat
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class ShoutMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var var_199:String;
      
      private var _roomCategory:int = 0;
      
      public function ShoutMessageComposer(param1:String, param2:int = 0, param3:int = 0)
      {
         super();
         var_199 = param1;
         _roomId = param2;
         _roomCategory = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_199];
      }
   }
}
