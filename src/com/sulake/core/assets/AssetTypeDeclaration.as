package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2046:Class;
      
      private var var_2045:Class;
      
      private var var_2047:String;
      
      private var var_1251:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2047 = param1;
         var_2045 = param2;
         var_2046 = param3;
         if(rest == null)
         {
            var_1251 = new Array();
         }
         else
         {
            var_1251 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2046;
      }
      
      public function get assetClass() : Class
      {
         return var_2045;
      }
      
      public function get mimeType() : String
      {
         return var_2047;
      }
      
      public function get fileTypes() : Array
      {
         return var_1251;
      }
   }
}
