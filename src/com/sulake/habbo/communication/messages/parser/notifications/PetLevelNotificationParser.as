package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_538:String;
      
      private var var_1618:int;
      
      private var var_1788:String;
      
      private var var_940:int;
      
      private var var_1246:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1246;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1246 = param1.readInteger();
         var_1788 = param1.readString();
         var_1618 = param1.readInteger();
         var_538 = param1.readString();
         var_940 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1788;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
      
      public function get method_9() : int
      {
         return var_940;
      }
      
      public function get level() : int
      {
         return var_1618;
      }
   }
}
