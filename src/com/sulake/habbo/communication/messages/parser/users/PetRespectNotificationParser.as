package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1956:int;
      
      private var var_1219:PetData;
      
      private var var_1957:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1956;
      }
      
      public function get petData() : PetData
      {
         return var_1219;
      }
      
      public function flush() : Boolean
      {
         var_1219 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1957;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1956 = param1.readInteger();
         var_1957 = param1.readInteger();
         var_1219 = new PetData(param1);
         return true;
      }
   }
}
