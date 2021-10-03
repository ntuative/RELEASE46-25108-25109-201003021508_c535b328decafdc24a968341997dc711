package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_2151:int;
      
      private var var_1300:int;
      
      private var var_1873:int;
      
      private var var_2150:int = -1;
      
      private var var_360:int;
      
      private var var_2024:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1299:int;
      
      private var var_2025:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_2025 = param2;
         var_2024 = param3;
         var_1300 = param4;
         var_360 = param5;
         var_1873 = param6;
         var_1299 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_2151 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_2151;
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
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_2150 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1300 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1299 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_360;
      }
      
      public function get averagePrice() : int
      {
         return var_1873;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_2025;
      }
   }
}
