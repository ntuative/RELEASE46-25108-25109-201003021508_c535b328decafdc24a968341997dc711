package com.sulake.habbo.advertisement
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.advertisement.InterstitialMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.advertisement.RoomAdMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.advertisement.GetInterstitialMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.advertisement.GetRoomAdMessageComposer;
   import com.sulake.habbo.communication.messages.parser.advertisement.InterstitialMessageParser;
   import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.Security;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class AdManager extends Component implements IAdManager
   {
       
      
      private var var_227:Timer;
      
      private var var_1981:int = 0;
      
      private var var_1505:int = 0;
      
      private var var_1226:String;
      
      private var var_1225:String;
      
      private var var_830:BitmapData = null;
      
      private var var_312:IHabboCommunicationManager;
      
      private var var_695:int = 0;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_831:BitmapData = null;
      
      private var var_1506:String;
      
      private var var_1980:int = 0;
      
      private var var_1979:String;
      
      private var var_1507:int = 0;
      
      private var _connection:IConnection;
      
      public function AdManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),include);
      }
      
      private function roomAdImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(isValidAdImage(_loc3_))
         {
            _loc4_ = emulateBackgroundTransparency(_loc3_.bitmapData);
            events.dispatchEvent(new AdEvent(AdEvent.const_474,0,0,_loc4_,var_1506,var_831,var_830));
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var_1980 = int(_config.getKey("interstitial.interval","30000"));
         var_1981 = int(_config.getKey("interstitial.show.time","5000"));
         var_1505 = int(_config.getKey("interstitial.max.displays.flash","-1"));
         var _loc2_:String = _config.getKey("ads.domain");
         if(_loc2_ != "")
         {
            Security.loadPolicyFile("http://" + _loc2_ + "/crossdomain.xml");
         }
         var _loc3_:String = _config.getKey("billboard.adwarning.left.url");
         var _loc4_:String = _config.getKey("billboard.adwarning.right.url");
         var _loc5_:String = _config.getKey("image.library.url");
         if(_loc3_ != "" && _loc4_ != "")
         {
            _loc3_ = _loc5_ + _loc3_;
            _loc4_ = _loc5_ + _loc4_;
            _loc6_ = new URLRequest(_loc3_);
            _loc7_ = _assets.loadAssetFromFile("adWarningL",_loc6_,"image/png");
            _loc7_.addEventListener(AssetLoaderEvent.const_31,adWarningLeftReady);
            _loc6_ = new URLRequest(_loc4_);
            _loc7_ = _assets.loadAssetFromFile("adWarningRight",_loc6_,"image/png");
            _loc7_.addEventListener(AssetLoaderEvent.const_31,adWarningRightReady);
         }
      }
      
      private function include(param1:IID = null, param2:IUnknown = null) : void
      {
         _config = param2 as IHabboConfigurationManager;
         if(_config == null)
         {
            return;
         }
         (_config as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed || param1 == null)
         {
            return;
         }
         _connection = param1;
         _connection.addMessageEvent(new InterstitialMessageEvent(onInterstitial));
         _connection.addMessageEvent(new RoomAdMessageEvent(onRoomAd));
      }
      
      private function onRoomAd(param1:RoomAdMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:RoomAdMessageParser = param1.getParser();
         var_1226 = _loc2_.imageUrl;
         var_1506 = _loc2_.clickUrl;
         if(var_1226 != "" && var_1506 != "")
         {
            _loc3_ = var_1226;
            if(assets.hasAsset(_loc3_))
            {
               assets.removeAsset(_assets.getAssetByName(_loc3_));
            }
            _loc4_ = new URLRequest(var_1226);
            _loc5_ = _assets.loadAssetFromFile(_loc3_,_loc4_,"image/jpeg");
            _loc5_.addEventListener(AssetLoaderEvent.const_31,roomAdImageReady);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _connection = null;
         if(var_312 != null)
         {
            release(new IIDHabboCommunicationManager());
            var_312 = null;
         }
         if(_config != null)
         {
            release(new IIDHabboConfigurationManager());
            _config = null;
         }
         if(var_831)
         {
            var_831.dispose();
            var_831 = null;
         }
         if(var_830)
         {
            var_830.dispose();
            var_830 = null;
         }
      }
      
      private function onInterstitial(param1:InterstitialMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:InterstitialMessageParser = param1.getParser();
         var_1225 = _loc2_.imageUrl;
         var_1979 = _loc2_.clickUrl;
         var_695 = getTimer();
         if(var_1225 != "")
         {
            _loc3_ = var_1225;
            if(assets.hasAsset(_loc3_))
            {
               assets.removeAsset(_assets.getAssetByName(_loc3_));
            }
            if(var_227 == null)
            {
               var_227 = new Timer(var_1981,1);
               var_227.addEventListener(TimerEvent.TIMER_COMPLETE,interstitialTimerComplete);
            }
            if(false)
            {
               var_227.reset();
            }
            var_227.start();
            _loc4_ = new URLRequest(var_1225);
            _loc5_ = _assets.loadAssetFromFile(_loc3_,_loc4_,"image/jpeg");
            _loc5_.addEventListener(AssetLoaderEvent.const_31,interstitialLoaderEventHandler);
            _loc5_.addEventListener(AssetLoaderEvent.const_42,interstitialLoaderEventHandler);
         }
         else
         {
            stopInterstitial();
         }
      }
      
      private function isValidAdImage(param1:Bitmap) : Boolean
      {
         if(param1 != null && (param1.width > 1 || param1.height > 1))
         {
            return true;
         }
         return false;
      }
      
      private function startInterstitial(param1:Bitmap) : void
      {
         if(var_227 != null && true)
         {
            return;
         }
         if(isValidAdImage(param1))
         {
            events.dispatchEvent(new AdEvent(AdEvent.const_359,0,0,param1.bitmapData,var_1979));
            var_695 = getTimer();
         }
         else
         {
            stopInterstitial();
         }
      }
      
      public function showRoomAd() : void
      {
         _connection.send(new GetRoomAdMessageComposer());
      }
      
      private function adWarningRightReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(_loc3_ != null)
         {
            var_830 = emulateBackgroundTransparency(_loc3_.bitmapData);
         }
      }
      
      public function showInterstitial() : Boolean
      {
         if(var_227 != null && false)
         {
            var_227.reset();
            return false;
         }
         if(var_695 == 0)
         {
            var_695 = getTimer();
            return false;
         }
         if(var_1505 > 0 && var_1507 >= var_1505)
         {
            return false;
         }
         var _loc1_:int = getTimer() - var_695;
         if(_loc1_ > var_1980)
         {
            ++var_1507;
            _connection.send(new GetInterstitialMessageComposer());
            return true;
         }
         return false;
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_312 = param2 as IHabboCommunicationManager;
         if(var_312 == null)
         {
            return;
         }
         _connection = var_312.getHabboMainConnection(onConnectionReady);
         if(_connection != null)
         {
            onConnectionReady(_connection);
         }
      }
      
      private function stopInterstitial() : void
      {
         if(var_227 != null && false)
         {
            var_227.reset();
         }
         if(events != null)
         {
            events.dispatchEvent(new AdEvent(AdEvent.const_366));
         }
      }
      
      private function interstitialLoaderEventHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case AssetLoaderEvent.const_31:
               _loc2_ = param1.target as AssetLoaderStruct;
               if(_loc2_ != null)
               {
                  _loc3_ = _loc2_.assetLoader;
                  if(_loc3_ != null)
                  {
                     _loc4_ = _loc3_.content as Bitmap;
                     startInterstitial(_loc4_);
                     return;
                  }
               }
               stopInterstitial();
               break;
            case AssetLoaderEvent.const_42:
               stopInterstitial();
         }
      }
      
      private function interstitialTimerComplete(param1:TimerEvent) : void
      {
         stopInterstitial();
      }
      
      private function adWarningLeftReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:Bitmap = _loc2_.assetLoader.content as Bitmap;
         if(_loc3_ != null)
         {
            var_831 = emulateBackgroundTransparency(_loc3_.bitmapData);
         }
      }
      
      private function emulateBackgroundTransparency(param1:BitmapData) : BitmapData
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.height)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.width)
            {
               _loc5_ = uint(param1.getPixel32(_loc4_,_loc3_));
               if(_loc5_ != 4294967295)
               {
                  _loc2_.setPixel32(_loc4_,_loc3_,_loc5_);
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
