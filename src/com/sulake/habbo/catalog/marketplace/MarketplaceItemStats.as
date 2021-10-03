package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1474:Array;
      
      private var var_1873:int;
      
      private var var_1872:int;
      
      private var var_1869:int;
      
      private var var_1871:int;
      
      private var _dayOffsets:Array;
      
      private var var_1870:int;
      
      private var var_1475:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1474 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1872;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1475 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1873 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1869;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1871;
      }
      
      public function get offerCount() : int
      {
         return var_1870;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1870 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1475;
      }
      
      public function get averagePrice() : int
      {
         return var_1873;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1871 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1869 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1872 = param1;
      }
   }
}
