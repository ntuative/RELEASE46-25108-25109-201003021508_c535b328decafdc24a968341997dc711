package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_999:Boolean;
      
      private var var_1130:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_999 = param1.readInteger() > 0;
         var_1130 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_999;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1130;
      }
      
      public function flush() : Boolean
      {
         var_999 = false;
         var_1130 = false;
         return true;
      }
   }
}
