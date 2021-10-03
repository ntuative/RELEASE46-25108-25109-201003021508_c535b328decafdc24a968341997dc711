package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1036:int = 100;
      
      private static const const_1037:int = 200;
      
      private static const const_1035:int = 180;
      
      public static const const_856:int = 1;
      
      public static const const_358:int = 2;
      
      private static const const_1034:int = 250;
      
      private static const const_745:int = 5;
       
      
      private var var_536:BitmapData;
      
      private var var_288:Timer;
      
      private var var_6:IWindowContainer;
      
      private var var_627:BitmapData;
      
      private var var_289:Timer;
      
      private var var_69:IWindowContainer;
      
      private var var_1385:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_289 = new Timer(const_1034,1);
         var_288 = new Timer(const_1036,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_69 = param1;
         var_69.visible = false;
         _assets = param2;
         var_289.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_288.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_627 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_536 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_69.visible = false;
         var_288.reset();
         var_289.reset();
         if(var_6 != null)
         {
            var_6.removeChild(var_69);
         }
      }
      
      public function hideDelayed() : void
      {
         var_288.reset();
         var_289.reset();
         var_288.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_289 != null)
         {
            var_289.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_289.stop();
            var_289 = null;
         }
         if(var_288 != null)
         {
            var_288.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_288.stop();
            var_288 = null;
         }
         _assets = null;
         var_69 = null;
         var_6 = null;
         var_536 = null;
         var_627 = null;
      }
      
      public function showDelayed() : void
      {
         var_288.reset();
         var_289.reset();
         var_289.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_69 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_6 != null)
         {
            var_6.removeChild(var_69);
         }
         var_6 = param1;
         var_1385 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_69.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_69.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1035,param3.width),Math.min(const_1037,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_69.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_69 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_69.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_856:
               _loc2_.bitmap = var_627.clone();
               _loc2_.width = var_627.width;
               _loc2_.height = var_627.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_358:
               _loc2_.bitmap = var_536.clone();
               _loc2_.width = var_536.width;
               _loc2_.height = var_536.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_288.reset();
         var_289.reset();
         if(var_6 == null)
         {
            return;
         }
         var_69.visible = true;
         var_6.addChild(var_69);
         refreshArrow(var_1385);
         switch(var_1385)
         {
            case const_856:
               var_69.x = 0 - const_745;
               break;
            case const_358:
               var_69.x = var_6.width + const_745;
         }
         var_69.y = (0 - 0) / 2;
      }
   }
}
