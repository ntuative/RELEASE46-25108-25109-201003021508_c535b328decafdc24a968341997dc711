package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_823:String = "AssetLoaderEventUnload";
      
      public static const const_42:String = "AssetLoaderEventError";
      
      public static const const_948:String = "AssetLoaderEventOpen";
      
      public static const const_873:String = "AssetLoaderEventProgress";
      
      public static const const_820:String = "AssetLoaderEventStatus";
      
      public static const const_31:String = "AssetLoaderEventComplete";
       
      
      private var var_360:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_360 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_360;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_360);
      }
   }
}
