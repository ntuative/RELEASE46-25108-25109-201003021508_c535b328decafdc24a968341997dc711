package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import flash.events.IEventDispatcher;
   
   public class CatalogWidget
   {
       
      
      private var var_704:ICatalogPage;
      
      protected var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      public function CatalogWidget(param1:IWindowContainer)
      {
         super();
         _window = param1;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_704 = param1;
      }
      
      public function init() : void
      {
      }
      
      public function get page() : ICatalogPage
      {
         return var_704;
      }
      
      public function set events(param1:IEventDispatcher) : void
      {
         _events = param1;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function get events() : IEventDispatcher
      {
         return _events;
      }
      
      public function dispose() : void
      {
         _events = null;
      }
   }
}
