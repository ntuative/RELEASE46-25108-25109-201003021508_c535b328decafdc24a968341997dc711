package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ClubGiftWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
       
      
      private var var_189:IWindowContainer;
      
      private var var_548:Map;
      
      private var _itemList:IItemListWindow;
      
      private var var_11:ClubGiftController;
      
      public function ClubGiftWidget(param1:IWindowContainer, param2:ClubGiftController)
      {
         super(param1);
         var_11 = param2;
         var_548 = new Map();
      }
      
      private function updateList() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!var_11 || !window || !page)
         {
            return;
         }
         for each(_loc1_ in var_548)
         {
            _loc1_.dispose();
         }
         var_548.reset();
         _loc2_ = var_11.getOffers();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IItemListWindow = window.findChildByName("gift_list") as IItemListWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.destroyListItems();
         var _loc4_:Boolean = false;
         for each(_loc6_ in _loc2_)
         {
            _loc1_ = new Offer(_loc6_,page);
            _loc5_ = createListItem(_loc1_,_loc4_);
            if(_loc5_)
            {
               _loc3_.addListItem(_loc5_);
               var_548.add(_loc1_.offerId,_loc1_);
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      private function showPreview(param1:Offer, param2:Rectangle) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param1.productContainer)
         {
            return;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return;
         }
         var _loc3_:IProduct = param1.productContainer.firstProduct;
         if(!_loc3_)
         {
            return;
         }
         switch(_loc3_.productType)
         {
            case "s":
               _loc4_ = page.viewer.roomEngine.getFurnitureImage(_loc3_.productClassId,new Vector3d(90),64,this,_loc3_.extraParam);
               break;
            case "i":
               _loc4_ = page.viewer.roomEngine.getWallItemImage(_loc3_.productClassId,new Vector3d(90),64,this,_loc3_.extraParam);
               break;
            default:
               return;
         }
         if(!_loc4_ || !_loc4_.data)
         {
            return;
         }
         if(!var_189)
         {
            var_189 = createWindow("club_gift_preview") as IWindowContainer;
         }
         if(!var_189)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = var_189.findChildByName("image") as IBitmapWrapperWindow;
         if(!_loc5_)
         {
            return;
         }
         _loc5_.width = _loc4_.data.width;
         _loc5_.height = _loc4_.data.height;
         if(_loc5_.bitmap)
         {
            _loc5_.bitmap.dispose();
         }
         _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height);
         _loc5_.bitmap.draw(_loc4_.data);
         var _loc6_:Point = Point.interpolate(param2.topLeft,param2.bottomRight,0.5);
         var_189.setGlobalPosition(_loc6_.subtract(new Point(0,0)));
         var_189.visible = true;
         var_189.activate();
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!var_11 || true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = var_11.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return var_11.windowManager.buildFromXML(_loc3_);
      }
      
      override public function init() : void
      {
         if(!window)
         {
            return;
         }
         super.init();
         var_11.widget = this;
         var _loc1_:IWindowContainer = window.findChildByName("widget_main_container") as IWindowContainer;
         if(!_loc1_)
         {
            _loc1_ = createWindow("clubGiftWidget") as IWindowContainer;
            if(!_loc1_)
            {
               return;
            }
            window.addChild(_loc1_);
            _itemList = _loc1_.findChildByName("gift_list") as IItemListWindow;
         }
         update();
      }
      
      private function updateInfo() : void
      {
         var _loc2_:* = null;
         if(!var_11 || !window)
         {
            return;
         }
         var _loc1_:ITextWindow = window.findChildByName("info_text") as ITextWindow;
         if(!_loc1_)
         {
            return;
         }
         if(false)
         {
            _loc2_ = "catalog.club_gift.available";
            var_11.localization.registerParameter(_loc2_,"amount",var_11.giftsAvailable.toString());
         }
         else if(false)
         {
            _loc2_ = "catalog.club_gift.days_until_next";
            var_11.localization.registerParameter(_loc2_,"days",var_11.daysUntilNextGift.toString());
         }
         else if(false)
         {
            _loc2_ = "catalog.club_gift.not_available";
         }
         else
         {
            _loc2_ = "catalog.club_gift.no_club";
         }
         _loc1_.text = var_11.localization.getKey(_loc2_);
      }
      
      public function update() : void
      {
         updateInfo();
         updateList();
      }
      
      private function clickHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !var_548 || !var_11)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(param2.name != "select_button")
         {
            return;
         }
         var _loc3_:Offer = var_548.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         var_11.selectGift(_loc3_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_11 = null;
         if(var_189)
         {
            var_189.dispose();
            var_189 = null;
         }
      }
      
      private function createListItem(param1:Offer, param2:Boolean) : IWindow
      {
         if(!param1 || !param1.productContainer || !param1.productContainer.firstProduct)
         {
            return null;
         }
         var _loc3_:IWindowContainer = createWindow("club_gift_list_item") as IWindowContainer;
         if(!_loc3_)
         {
            return null;
         }
         _loc3_.procedure = clickHandler;
         var _loc4_:IProduct = param1.productContainer.firstProduct;
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:IProductData = _loc4_.productData;
         if(!_loc5_)
         {
            return null;
         }
         var _loc6_:ITextWindow = _loc3_.findChildByName("gift_name") as ITextWindow;
         if(_loc6_)
         {
            _loc6_.text = _loc5_.name;
         }
         var _loc7_:ITextWindow = _loc3_.findChildByName("gift_desc") as ITextWindow;
         if(_loc7_)
         {
            _loc7_.text = _loc5_.description;
         }
         var _loc8_:IButtonWindow = _loc3_.findChildByName("select_button") as IButtonWindow;
         if(_loc8_)
         {
            if(param2)
            {
               _loc8_.enable();
            }
            else
            {
               _loc8_.disable();
            }
            _loc8_.id = param1.offerId;
         }
         var _loc9_:IProductContainer = param1.productContainer;
         if(!_loc9_)
         {
            return null;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return null;
         }
         var _loc10_:IWindowContainer = _loc3_.findChildByName("image_container") as IWindowContainer;
         if(_loc10_)
         {
            _loc9_.view = _loc10_;
            _loc9_.initProductIcon(page.viewer.roomEngine);
            _loc10_.procedure = mouseOverHandler;
            _loc10_.id = param1.offerId;
         }
         return _loc3_;
      }
      
      private function mouseOverHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param2 || !var_548)
         {
            return;
         }
         if(param2.name != "image_container")
         {
            return;
         }
         var _loc3_:Offer = var_548.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc4_ = new Rectangle();
            param2.getGlobalRectangle(_loc4_);
         }
         if(param1.type == WindowMouseEvent.const_27)
         {
            hidePreview();
         }
      }
      
      private function hidePreview() : void
      {
         if(var_189)
         {
            var_189.visible = false;
         }
      }
   }
}
