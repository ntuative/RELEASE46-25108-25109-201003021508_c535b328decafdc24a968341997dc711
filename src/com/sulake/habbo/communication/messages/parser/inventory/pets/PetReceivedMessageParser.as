package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_959:PetData;
      
      private var var_1423:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1423 = param1.readBoolean();
         var_959 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1423 + ", " + var_959.id + ", " + var_959.name + ", " + pet.figure + ", " + var_959.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1423;
      }
      
      public function get pet() : PetData
      {
         return var_959;
      }
   }
}
