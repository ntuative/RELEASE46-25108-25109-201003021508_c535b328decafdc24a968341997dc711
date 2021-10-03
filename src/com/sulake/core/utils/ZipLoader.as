package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_430:FZip;
      
      private var var_1350:Array;
      
      private var var_2242:uint = 0;
      
      private var var_916:int = 0;
      
      private var var_2377:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1350 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1350;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_14.content);
         var_1350.push(var_14.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_916;
         if(var_1350.length == var_2242)
         {
            var_14.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_14.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_14.loadBytes(var_430.getFileAt(var_916).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_315 = param1;
         if(var_430)
         {
            var_430.close();
         }
         var_430 = new FZip();
         var_430.addEventListener(Event.COMPLETE,onComplete);
         var_430.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_430.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_430.load(var_315);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_916 = 0;
         var_2242 = var_430.getFileCount();
         removeEventListeners();
         var_14.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_14.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_14.loadBytes(var_430.getFileAt(var_916).content);
      }
   }
}
