package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var var_1312:Boolean;
      
      private var _openHour:int;
      
      private var var_1308:int;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _openHour = param1.readInteger();
         var_1308 = param1.readInteger();
         var_1312 = param1.readInteger() > 0;
         return true;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return var_1312;
      }
      
      public function flush() : Boolean
      {
         _openHour = 0;
         var_1308 = 0;
         var_1312 = false;
         return true;
      }
      
      public function get openHour() : int
      {
         return _openHour;
      }
      
      public function get openMinute() : int
      {
         return var_1308;
      }
   }
}
