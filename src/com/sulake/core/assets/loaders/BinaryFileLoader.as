package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_14:URLLoader;
      
      protected var var_925:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_925 = param2 == null ? "" : param2.url;
         _type = param1;
         var_14 = new URLLoader();
         var_14.addEventListener(Event.COMPLETE,loadEventHandler);
         var_14.addEventListener(Event.UNLOAD,loadEventHandler);
         var_14.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_14.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_14.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_14.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_14.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_925 = param1.url;
         var_14.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_14.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_14.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_14.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_14.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_14.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_14.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_14.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_14.close();
            var_14 = null;
            _type = null;
            var_925 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_925;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_14.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_14.data;
      }
   }
}
