package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1300:int;
      
      private var var_2150:int = -1;
      
      private var var_360:int;
      
      private var var_1873:int;
      
      private var var_2024:int;
      
      private var _offerId:int;
      
      private var var_1299:int;
      
      private var var_2025:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_2025 = param2;
         var_2024 = param3;
         var_1300 = param4;
         var_360 = param5;
         var_2150 = param6;
         var_1873 = param7;
         var_1299 = param8;
      }
      
      public function get status() : int
      {
         return var_360;
      }
      
      public function get price() : int
      {
         return var_1300;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2150;
      }
      
      public function get offerCount() : int
      {
         return var_1299;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_2024;
      }
      
      public function get averagePrice() : int
      {
         return var_1873;
      }
      
      public function get furniId() : int
      {
         return var_2025;
      }
   }
}
