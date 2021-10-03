package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_107:URLStream;
      
      protected var var_925:String;
      
      protected var _type:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_925 = param2 == null ? "" : param2.url;
         _type = param1;
         var_107 = new URLStream();
         var_107.addEventListener(Event.COMPLETE,loadEventHandler);
         var_107.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_107.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_107.addEventListener(Event.OPEN,loadEventHandler);
         var_107.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_107.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_107.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_107.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_107.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_107.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_107.removeEventListener(Event.OPEN,loadEventHandler);
            var_107.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_107.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_107.close();
            var_107 = null;
            _type = null;
            var_925 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_925 = param1.url;
         var_107.load(param1);
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
         return var_107.bytesAvailable;
      }
      
      public function get content() : Object
      {
         return var_107;
      }
   }
}
