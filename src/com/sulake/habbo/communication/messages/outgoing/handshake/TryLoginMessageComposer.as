package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class TryLoginMessageComposer implements IMessageComposer
   {
       
      
      private var var_2196:String;
      
      private var _password:String;
      
      public function TryLoginMessageComposer(param1:String, param2:String)
      {
         super();
         var_2196 = param1;
         _password = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2196,_password];
      }
      
      public function dispose() : void
      {
      }
   }
}
