package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_14:Sound;
      
      protected var var_925:String;
      
      protected var _type:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_925 = param2 == null ? "" : param2.url;
         _type = param1;
         var_14 = new Sound(null,null);
         var_14.addEventListener(Event.ID3,loadEventHandler);
         var_14.addEventListener(Event.OPEN,loadEventHandler);
         var_14.addEventListener(Event.COMPLETE,loadEventHandler);
         var_14.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_14.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_14.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_14.removeEventListener(Event.ID3,loadEventHandler);
            var_14.removeEventListener(Event.OPEN,loadEventHandler);
            var_14.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_14.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_14.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_14 = null;
            _type = null;
            var_925 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_925 = param1.url;
         var_14.load(param1,null);
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
         return var_14;
      }
   }
}
