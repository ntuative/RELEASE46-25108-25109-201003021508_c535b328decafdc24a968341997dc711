package
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class HabboMain extends Sprite
   {
      
      private static const const_6:Number = 0.29;
      
      private static const const_22:Number = 0.71;
       
      
      private var var_1104:Boolean = false;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_31:ICore;
      
      public function HabboMain(param1:DisplayObjectContainer)
      {
         super();
         var_1 = param1;
         var_1.addEventListener(Event.COMPLETE,onCompleteEvent);
         var_1.addEventListener(ProgressEvent.PROGRESS,onProgressEvent);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         Logger.log("Core version: undefined");
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc7_:Sprite = param1.getChildByName(Habbo.const_3) as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName(Habbo.BAR_SPRITE) as Sprite;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         var _loc9_:int = 16;
         var _loc10_:int = 196 * param2;
         _loc8_.graphics.beginFill(12241619);
         _loc8_.graphics.drawRect(0,0,_loc10_,_loc9_ / 2);
         _loc8_.graphics.endFill();
         _loc8_.graphics.beginFill(9216429);
         _loc8_.graphics.drawRect(0,_loc9_ / 2,_loc10_,_loc9_ / 2 + 1);
         _loc8_.graphics.endFill();
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_31,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_42,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_31)
         {
            _loc3_ = var_31.assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            var_31.readConfigDocument(_loc4_,var_1);
         }
         else
         {
            var_31.error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,Core.const_908);
            var_31.events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      private function prepareCore() : void
      {
         trackLoginStep(Habbo.const_24);
         var_31 = Core.instantiate(stage,0);
         var_31.prepareComponent(CoreCommunicationFrameworkLib);
         var_31.prepareComponent(HabboRoomObjectLogicLib);
         var_31.prepareComponent(HabboRoomObjectVisualizationLib);
         var_31.prepareComponent(RoomManagerLib);
         var_31.prepareComponent(RoomSpriteRendererLib);
         var_31.prepareComponent(HabboRoomSessionManagerLib);
         var_31.prepareComponent(HabboAvatarRenderLib);
         var_31.prepareComponent(HabboRoomWidgetLib);
         var_31.prepareComponent(HabboSessionDataManagerLib);
         var_31.prepareComponent(HabboTrackingLib);
         var_31.prepareComponent(HabboConfigurationCom);
         var_31.prepareComponent(HabboLocalizationCom);
         var_31.prepareComponent(HabboWindowManagerCom);
         var_31.prepareComponent(HabboCommunicationCom);
         var_31.prepareComponent(HabboCommunicationDemoCom);
         var_31.prepareComponent(HabboNavigatorCom);
         var_31.prepareComponent(HabboFriendListCom);
         var_31.prepareComponent(HabboMessengerCom);
         var_31.prepareComponent(HabboInventoryCom);
         var_31.prepareComponent(HabboToolbarCom);
         var_31.prepareComponent(HabboCatalogCom);
         var_31.prepareComponent(HabboRoomEngineCom);
         var_31.prepareComponent(HabboRoomUICom);
         var_31.prepareComponent(HabboAvatarEditorCom);
         var_31.prepareComponent(HabboNotificationsCom);
         var_31.prepareComponent(HabboHelpCom);
         var_31.prepareComponent(HabboAdManagerCom);
         var_31.prepareComponent(HabboModerationCom);
         Logger.log("Sound manager embed...");
         Logger.log("Trying to embed Flash 9 version");
         var_31.prepareComponent(HabboSoundManagerCom);
         var_31.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onCoreError);
         var _loc1_:AssetLoaderStruct = var_31.assets.loadAssetFromFile("config.xml",new URLRequest("config_habbo.xml"));
         _loc1_.addEventListener(AssetLoaderEvent.const_31,configLoadedHandler);
         _loc1_.addEventListener(AssetLoaderEvent.const_42,configLoadedHandler);
      }
      
      public function onCoreError(param1:Event) : void
      {
         trackLoginStep(Habbo.const_23);
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(var_1)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            _loc3_ = 1 - const_22 + _loc2_ * const_22;
            updateLoadingBar(var_1,_loc3_);
            _loc4_ = var_1.getChildByName("background") as Sprite;
            if(_loc4_)
            {
               _loc4_.alpha = Math.min(1 - _loc3_,_loc4_.alpha);
            }
         }
      }
      
      private function initializeCore() : void
      {
         try
         {
            var_31.initialize();
         }
         catch(error:Error)
         {
            trackLoginStep(Habbo.const_23);
            Core.crash("Failed to initialize the core: " + error.message,Core.const_833,error);
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         var event:Event = param1;
         try
         {
            prepareCore();
         }
         catch(error:Error)
         {
            trackLoginStep(Habbo.const_23);
            Habbo.reportCrash("Failed to prepare the core: " + error.message,Core.const_833,error);
            Core.dispose();
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         if(var_1)
         {
            _loc2_ = var_1.getChildByName("background") as Sprite;
            if(_loc2_)
            {
               _loc2_.alpha -= 0.01;
               if(_loc2_.alpha <= 0)
               {
               }
            }
            if(var_1104)
            {
               if(true)
               {
                  dispose();
                  var_1104 = false;
               }
               else
               {
                  var_1.alpha = -0.1;
               }
            }
         }
      }
      
      private function trackLoginStep(param1:String) : void
      {
         if(loaderInfo)
         {
            if(loaderInfo.parameters["processlog.enabled"] == "1")
            {
               Logger.log("* HabboMain Login Step: " + param1);
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
               }
               else
               {
                  Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
               }
            }
         }
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         updateLoadingBar(var_1,1);
         initializeCore();
         var_1104 = true;
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         if(var_1)
         {
            var_1.removeEventListener(Event.COMPLETE,onCompleteEvent);
            var_1.removeEventListener(ProgressEvent.PROGRESS,onProgressEvent);
            var_1 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
