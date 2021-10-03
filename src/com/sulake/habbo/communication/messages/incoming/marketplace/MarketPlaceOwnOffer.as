package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1585:int = 2;
      
      public static const const_1465:int = 1;
      
      public static const const_1532:int = 0;
       
      
      private var var_1300:int;
      
      private var var_360:int;
      
      private var var_2360:int;
      
      private var _offerId:int;
      
      private var var_2024:int;
      
      private var var_2025:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_2025 = param2;
         var_2024 = param3;
         var_1300 = param4;
      }
      
      public function get furniId() : int
      {
         return var_2025;
      }
      
      public function get furniType() : int
      {
         return var_2024;
      }
      
      public function get price() : int
      {
         return var_1300;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
