package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_642:int = 6;
      
      public static const const_189:int = 5;
      
      public static const const_723:int = 2;
      
      public static const const_314:int = 9;
      
      public static const const_328:int = 4;
      
      public static const const_238:int = 2;
      
      public static const const_502:int = 4;
      
      public static const const_201:int = 8;
      
      public static const const_733:int = 7;
      
      public static const const_265:int = 3;
      
      public static const const_296:int = 1;
      
      public static const const_225:int = 5;
      
      public static const const_355:int = 12;
      
      public static const const_295:int = 1;
      
      public static const const_535:int = 11;
      
      public static const const_586:int = 3;
      
      public static const const_1476:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_392:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_392 = new Array();
         var_392.push(new Tab(_navigator,const_296,const_355,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_392.push(new Tab(_navigator,const_238,const_295,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_392.push(new Tab(_navigator,const_328,const_535,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_970));
         var_392.push(new Tab(_navigator,const_265,const_189,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_392.push(new Tab(_navigator,const_225,const_201,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_616));
         setSelectedTab(const_296);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_392)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_392)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_392)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_328;
      }
      
      public function get tabs() : Array
      {
         return var_392;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
