package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2240:int;
      
      private var var_1304:String;
      
      private var var_2237:int;
      
      private var var_2239:int;
      
      private var var_2238:int;
      
      private var var_2241:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1304;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2241;
      }
      
      public function get responseType() : int
      {
         return var_2239;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2237;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1304 = param1.readString();
         var_2237 = param1.readInteger();
         var_2240 = param1.readInteger();
         var_2238 = param1.readInteger();
         var_2239 = param1.readInteger();
         var_2241 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2240;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2238;
      }
   }
}
