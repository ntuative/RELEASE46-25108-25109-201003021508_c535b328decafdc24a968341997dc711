package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2099:XML;
      
      private var var_1536:ITextWindow;
      
      private var var_1537:ITextWindow;
      
      private var var_2098:XML;
      
      private var var_875:IWindowContainer;
      
      private var var_2309:ITextWindow;
      
      private var var_2100:String = "";
      
      private var var_2365:IButtonWindow;
      
      private var var_2096:XML;
      
      private var var_1535:ITextWindow;
      
      private var var_2097:XML;
      
      private var var_876:IButtonWindow;
      
      private var var_80:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_413:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2098) as IWindowContainer;
               break;
            case Offer.const_376:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2097) as IWindowContainer;
               break;
            case Offer.const_471:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2099) as IWindowContainer;
               break;
            case Offer.const_568:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2096) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_875 != null)
            {
               _window.removeChild(var_875);
               var_875.dispose();
            }
            var_875 = _loc2_;
            _window.addChild(_loc2_);
            var_875.x = 0;
            var_875.y = 0;
         }
         var_1535 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1537 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1536 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2309 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_876 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_876 != null)
         {
            var_876.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_876.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_80 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_80,page,var_2100);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2098 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2097 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2099 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2096 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_874,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2100 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_80 = param1.offer;
         attachStub(var_80.priceType);
         if(var_1535 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_80.priceInCredits));
            var_1535.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1537 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_80.priceInPixels));
            var_1537.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1536 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_80.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_80.priceInPixels));
            var_1536.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_876 != null)
         {
            var_876.enable();
         }
      }
   }
}
