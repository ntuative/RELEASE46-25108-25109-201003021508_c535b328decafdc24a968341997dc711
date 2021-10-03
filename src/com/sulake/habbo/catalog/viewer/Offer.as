package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_854:String = "price_type_none";
      
      public static const const_468:String = "pricing_model_multi";
      
      public static const const_413:String = "price_type_credits";
      
      public static const const_471:String = "price_type_credits_and_pixels";
      
      public static const const_357:String = "pricing_model_bundle";
      
      public static const const_400:String = "pricing_model_single";
      
      public static const const_568:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1381:String = "pricing_model_unknown";
      
      public static const const_376:String = "price_type_pixels";
       
      
      private var var_827:int;
      
      private var _offerId:int;
      
      private var var_826:int;
      
      private var var_395:String;
      
      private var var_579:String;
      
      private var var_1969:int;
      
      private var var_704:ICatalogPage;
      
      private var var_1223:String;
      
      private var var_396:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1223 = param1.localizationId;
         var_827 = param1.priceInCredits;
         var_826 = param1.priceInPixels;
         var_704 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_395;
      }
      
      public function get page() : ICatalogPage
      {
         return var_704;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1969 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_396;
      }
      
      public function get localizationId() : String
      {
         return var_1223;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_826;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1223 = "";
         var_827 = 0;
         var_826 = 0;
         var_704 = null;
         if(var_396 != null)
         {
            var_396.dispose();
            var_396 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_579;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1969;
      }
      
      public function get priceInCredits() : int
      {
         return var_827;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_395 = const_400;
            }
            else
            {
               var_395 = const_468;
            }
         }
         else if(param1.length > 1)
         {
            var_395 = const_357;
         }
         else
         {
            var_395 = const_1381;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_395)
         {
            case const_400:
               var_396 = new SingleProductContainer(this,param1);
               break;
            case const_468:
               var_396 = new MultiProductContainer(this,param1);
               break;
            case const_357:
               var_396 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_395);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_827 > 0 && var_826 > 0)
         {
            var_579 = const_471;
         }
         else if(var_827 > 0)
         {
            var_579 = const_413;
         }
         else if(var_826 > 0)
         {
            var_579 = const_376;
         }
         else
         {
            var_579 = const_854;
         }
      }
   }
}
