package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1474:Array;
      
      private var var_1873:int;
      
      private var var_1872:int;
      
      private var var_1871:int;
      
      private var var_1869:int;
      
      private var _dayOffsets:Array;
      
      private var var_1870:int;
      
      private var var_1475:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1474;
      }
      
      public function get furniTypeId() : int
      {
         return var_1872;
      }
      
      public function get historyLength() : int
      {
         return var_1869;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1871;
      }
      
      public function get offerCount() : int
      {
         return var_1870;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1475;
      }
      
      public function get averagePrice() : int
      {
         return var_1873;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1873 = param1.readInteger();
         var_1870 = param1.readInteger();
         var_1869 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1474 = [];
         var_1475 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1474.push(param1.readInteger());
            var_1475.push(param1.readInteger());
            _loc3_++;
         }
         var_1871 = param1.readInteger();
         var_1872 = param1.readInteger();
         return true;
      }
   }
}
