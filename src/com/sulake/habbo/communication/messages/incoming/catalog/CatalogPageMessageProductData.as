package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_193:String = "e";
      
      public static const const_73:String = "i";
      
      public static const const_78:String = "s";
       
      
      private var var_1086:String;
      
      private var var_1354:String;
      
      private var var_1352:int;
      
      private var var_2223:int;
      
      private var var_1085:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1354 = param1.readString();
         var_2223 = param1.readInteger();
         var_1086 = param1.readString();
         var_1085 = param1.readInteger();
         var_1352 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1085;
      }
      
      public function get productType() : String
      {
         return var_1354;
      }
      
      public function get expiration() : int
      {
         return var_1352;
      }
      
      public function get furniClassId() : int
      {
         return var_2223;
      }
      
      public function get extraParam() : String
      {
         return var_1086;
      }
   }
}
