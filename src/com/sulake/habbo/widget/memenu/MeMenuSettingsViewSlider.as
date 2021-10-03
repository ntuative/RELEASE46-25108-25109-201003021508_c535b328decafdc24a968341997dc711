package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSettingsViewSlider
   {
       
      
      private var var_822:MeMenuSettingsView;
      
      private var var_2359:int;
      
      private var var_569:BitmapData;
      
      private var var_992:Number = 1;
      
      private var var_1476:int;
      
      private var var_677:Number = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_568:BitmapData;
      
      public function MeMenuSettingsViewSlider(param1:MeMenuSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0, param5:Number = 1)
      {
         super();
         var_822 = param1;
         _sliderContainer = param2;
         var_677 = param4;
         var_992 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_465)
         {
            return;
         }
         var_822.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_568 != null)
         {
            _loc2_.bitmap = new BitmapData(var_568.width,var_568.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_568,var_568.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_569 != null)
            {
               _loc2_.bitmap = new BitmapData(var_569.width,var_569.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_569,var_569.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1476 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_568 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_569 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_992 = param1;
         setValue(var_822.volume);
      }
      
      public function dispose() : void
      {
         var_822 = null;
         _sliderContainer = null;
         var_568 = null;
         var_569 = null;
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1476 * (Number(param1 - var_677) / (var_992 - var_677)));
      }
      
      public function set min(param1:Number) : void
      {
         var_677 = param1;
         setValue(var_822.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1476 * (var_992 - var_677) + var_677;
      }
   }
}
