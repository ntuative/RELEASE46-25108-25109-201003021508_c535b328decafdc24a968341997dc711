package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1619:int;
      
      private var var_538:String;
      
      private var var_1618:int;
      
      private var var_1956:int;
      
      private var var_1615:int;
      
      private var var_2038:int;
      
      private var _nutrition:int;
      
      private var var_1246:int;
      
      private var var_2039:int;
      
      private var var_2041:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1620:int;
      
      private var var_2040:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1618;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2038;
      }
      
      public function flush() : Boolean
      {
         var_1246 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2039;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2041;
      }
      
      public function get maxNutrition() : int
      {
         return var_2040;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1956;
      }
      
      public function get petId() : int
      {
         return var_1246;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1246 = param1.readInteger();
         _name = param1.readString();
         var_1618 = param1.readInteger();
         var_2039 = param1.readInteger();
         var_1615 = param1.readInteger();
         var_2041 = param1.readInteger();
         _energy = param1.readInteger();
         var_2038 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2040 = param1.readInteger();
         var_538 = param1.readString();
         var_1956 = param1.readInteger();
         var_1620 = param1.readInteger();
         var_1619 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1615;
      }
      
      public function get ownerId() : int
      {
         return var_1620;
      }
      
      public function get age() : int
      {
         return var_1619;
      }
   }
}
