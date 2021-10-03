package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1529:int = 0;
      
      public static const const_1490:int = 1;
       
      
      private var var_2295:int;
      
      private var var_1215:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function get roomLimit() : int
      {
         return var_2295;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1215 = param1.readInteger();
         this.var_2295 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1215;
      }
   }
}
