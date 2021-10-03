package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   
   public class ClubGiftInfoParser implements IMessageParser
   {
       
      
      private var var_1071:int;
      
      private var var_1672:int;
      
      private var var_548:Array;
      
      public function ClubGiftInfoParser()
      {
         super();
      }
      
      public function get giftsAvailable() : int
      {
         return var_1071;
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_1672;
      }
      
      public function flush() : Boolean
      {
         var_548 = [];
         return true;
      }
      
      public function get offers() : Array
      {
         return var_548;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1672 = param1.readInteger();
         var_1071 = param1.readInteger();
         var_548 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_548.push(new CatalogPageMessageOfferData(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
