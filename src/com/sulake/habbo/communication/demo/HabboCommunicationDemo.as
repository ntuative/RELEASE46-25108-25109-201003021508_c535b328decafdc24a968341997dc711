package com.sulake.habbo.communication.demo
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.encryption.CryptoTools;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.handshake.DiffieHellman;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDLogger;
   import com.sulake.core.runtime.ILogger;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.encryption.PseudoRandom;
   import com.sulake.habbo.communication.encryption.RC4_R27;
   import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.messages.incoming.error.ErrorReportEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.DisconnectReasonEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.HelloMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.InitCryptoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.PingMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.SecretKeyEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.SessionParamsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UniqueMachineIDEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.handshake.GenerateSecretKeyMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.GetSessionParametersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.InfoRetrieveMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.InitCryptoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.PongMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.SSOTicketMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.TryLoginMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.UniqueIDMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.VersionCheckMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ScrGetUserInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.error.ErrorReportMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.GenericErrorParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import iid.IIDHabboWindowManager;
   
   public class HabboCommunicationDemo extends Component
   {
       
      
      private var var_166:HabboHotelView;
      
      private var var_1736:Boolean;
      
      private var _view:HabboLoginDemoView;
      
      private var var_956:Boolean;
      
      private var var_19:IRoomSessionManager;
      
      private var var_1737:PseudoRandom;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_97:IHabboConfigurationManager;
      
      private var var_1422:ILogger;
      
      private var var_1145:String;
      
      private var var_1735:String;
      
      private const const_1398:String = "fuselogin";
      
      private var var_312:ICoreCommunicationManager;
      
      private var var_452:IKeyExchange;
      
      private var var_958:String = "";
      
      private var var_957:String;
      
      private var var_652:String;
      
      private var var_71:IHabboCommunicationManager;
      
      public function HabboCommunicationDemo(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunication);
         queueInterface(new IIDLogger(),receiveLoggerInterface);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private static function xor(param1:String, param2:String) : String
      {
         var _loc6_:* = 0;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = uint(param1.charCodeAt(_loc5_));
            _loc3_ += String.fromCharCode(_loc6_ ^ param2.charCodeAt(_loc4_));
            _loc4_++;
            if(_loc4_ == param2.length)
            {
               _loc4_ = 0;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private static function decode(param1:ByteArray, param2:uint, param3:uint, param4:Point, param5:Point) : String
      {
         var _loc12_:int = 0;
         var _loc13_:* = 0;
         var _loc14_:int = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc6_:String = "";
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param3 == 4)
         {
            _loc10_ = 1;
         }
         var _loc11_:int = param4.y;
         while(_loc11_ < param4.y + param5.y)
         {
            _loc12_ = param4.x;
            while(_loc12_ < param4.x + param5.x)
            {
               _loc13_ = uint(((_loc11_ + _loc9_) * param2 + _loc12_) * param3);
               _loc14_ = _loc10_;
               while(_loc14_ < param3)
               {
                  param1.position = _loc13_ + _loc14_;
                  _loc15_ = uint(param1.readUnsignedByte());
                  _loc16_ = uint(_loc15_ & 1);
                  _loc8_ |= _loc16_ << 7 - _loc7_;
                  if(_loc7_ == 7)
                  {
                     _loc6_ += String.fromCharCode(_loc8_);
                     _loc8_ = 0;
                     _loc7_ = 0;
                  }
                  else
                  {
                     _loc7_++;
                  }
                  _loc14_++;
               }
               if(_loc12_ % 2 == 0)
               {
                  _loc9_++;
               }
               _loc12_++;
            }
            _loc9_ = 0;
            _loc11_++;
         }
         return _loc6_;
      }
      
      public function get habboConfiguration() : IHabboConfigurationManager
      {
         return var_97;
      }
      
      private function onDisconnectReason(param1:IMessageEvent) : void
      {
         var _loc2_:String = (param1 as DisconnectReasonEvent).reason;
         var _loc3_:String = "";
         if(var_956)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_151);
         }
         switch(_loc2_)
         {
            case DisconnectReasonEvent.const_324:
               _loc3_ = var_97.getKey("logout.banned.url");
               break;
            case DisconnectReasonEvent.const_798:
               _loc3_ = var_97.getKey("logout.concurrent.url");
               break;
            case DisconnectReasonEvent.const_860:
               _loc3_ = var_97.getKey("logout.url");
               break;
            case DisconnectReasonEvent.const_917:
               _loc3_ = var_97.getKey("logout.timeout.url");
               break;
            default:
               _loc3_ = var_97.getKey("logout.disconnect.url");
         }
         if(_loc3_.length == 0)
         {
            _loc3_ = var_97.getKey("logout.disconnect.url");
         }
         var_1736 = true;
         if(_loc3_.length > 0)
         {
            _loc3_ = setOriginProperty(_loc3_);
            HabboWebTools.openWebPage(_loc3_,"_self");
         }
      }
      
      private function onConnectionDisconnected(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_956)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_151);
         }
         if(param1.type == Event.CLOSE && !var_1736)
         {
            _loc2_ = var_97.getKey("logout.disconnect.url");
            if(var_97.keyExists("facebook.user"))
            {
               _loc3_ = _loc2_.indexOf("?") == -1 ? "?" : "&";
               _loc2_ = _loc2_ + _loc3_ + "facebookuser=1";
            }
            _loc2_ = setOriginProperty(_loc2_);
            HabboWebTools.openWebPage(_loc2_,"_self");
         }
      }
      
      private function onSessionParamsEvent(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var_956 = false;
         var _loc2_:IConnection = param1.connection;
         var _loc3_:SessionParamsMessageEvent = param1 as SessionParamsMessageEvent;
         if(var_652 != null)
         {
            _loc4_ = new SSOTicketMessageComposer(var_652);
            _loc2_.send(_loc4_);
            dispatchLoginStepEvent(HabboCommunicationEvent.const_156);
         }
         else if(_view != null)
         {
            _loc5_ = "null";
            _loc6_ = "null";
            if(_loc5_.length > 0 && _loc6_.length > 0)
            {
               _loc7_ = new TryLoginMessageComposer(_loc5_,_loc6_);
               _loc2_.send(_loc7_);
               dispatchLoginStepEvent(HabboCommunicationEvent.const_156);
            }
         }
         else
         {
            Logger.log("[HabboCommunicationDemo] Error, no login window nor ticket");
         }
      }
      
      private function sendConnectionParameters(param1:IConnection) : void
      {
         var_956 = true;
         dispatchLoginStepEvent(HabboCommunicationEvent.const_220);
         param1.send(new VersionCheckMessageComposer(401,var_1145,var_1735));
         var _loc2_:String = "";
         var _loc3_:SharedObject = SharedObject.getLocal(const_1398,"/");
         if(_loc3_.data.machineid != null)
         {
            _loc2_ = _loc3_.data.machineid;
         }
         param1.send(new UniqueIDMessageComposer(_loc2_));
         param1.send(new GetSessionParametersMessageComposer());
      }
      
      public function set shockwaveClientUrl(param1:String) : void
      {
         var_1145 = param1;
      }
      
      private function onErrorReport(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var parser:ErrorReportMessageParser = (event as ErrorReportEvent).getParser();
         var errorCode:int = parser.errorCode;
         var messageId:int = parser.messageId;
         var time:String = parser.timestamp;
         out("ERRORREPORT: Error code " + errorCode + " / Message id " + messageId);
         Logger.log("SERVER ERROR! Error code:" + errorCode + "Message id:" + messageId);
         _windowManager.registerLocalizationParameter("connection.server.error.desc","errorCode",String(errorCode));
         _windowManager.alert("${connection.server.error.title}","${connection.server.error.desc}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function onSecretKeyEvent(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:SecretKeyEvent = param1 as SecretKeyEvent;
         var _loc4_:String = _loc3_.serverPublicKey;
         var_452.generateSharedKey(_loc4_,10);
         var _loc5_:String = var_452.getSharedKey(16).toUpperCase();
         var _loc6_:RC4_R27 = new RC4_R27(null,null);
         var _loc7_:IEncryption = new RC4_R27(_loc6_,var_1737);
         var _loc8_:ByteArray = CryptoTools.hexStringToByteArray(_loc5_);
         _loc8_.position = 0;
         _loc6_.init(_loc8_);
         _loc8_.position = 0;
         _loc7_.initFromState(_loc6_);
         _loc2_.setEncryption(_loc7_);
         sendConnectionParameters(_loc2_);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      private function onUniqueMachineId(param1:UniqueMachineIDEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:SharedObject = SharedObject.getLocal(const_1398,"/");
         _loc2_.data.machineid = param1.machineID;
         _loc2_.flush();
      }
      
      private function setOriginProperty(param1:String) : String
      {
         if(param1.indexOf("%origin%") != -1)
         {
            return param1.replace("%origin%",var_97.getKey("flash.client.origin","popup"));
         }
         return param1;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         var_652 = var_97.getKey("sso.ticket",null);
         var_1145 = var_97.getKey("flash.client.url","");
         var_1735 = var_97.getKey("external.variables.txt","");
         if(var_166 == null)
         {
            var_166 = new HabboHotelView(_windowManager,assets,Component(context).events);
         }
         if(var_652 != null)
         {
            var_71.mode = HabboConnectionType.const_425;
            var_71.initConnection(HabboConnectionType.const_240);
         }
      }
      
      private function receiveLoggerInterface(param1:IID, param2:IUnknown) : void
      {
         var_1422 = param2 as ILogger;
      }
      
      override public function dispose() : void
      {
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_166 != null)
         {
            var_166.dispose();
            var_166 = null;
         }
      }
      
      private function onRoomEntryInfoEvent(param1:RoomEntryInfoMessageEvent) : void
      {
         if(var_166)
         {
            if(true)
            {
               var_166.hide();
            }
         }
      }
      
      private function showHotelView() : void
      {
         if(var_166)
         {
            if(true)
            {
               var_166.show();
            }
         }
      }
      
      private function onHelloEvent(param1:IMessageEvent) : void
      {
      }
      
      private function onHabboCommunication(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         if(param2 != null)
         {
            var_71 = param2 as IHabboCommunicationManager;
            _loc3_ = var_71.getHabboMainConnection(null);
            if(_loc3_ != null)
            {
               _loc3_.addEventListener(Event.CONNECT,onConnectionEstablished);
               _loc3_.addEventListener(Event.CLOSE,onConnectionDisconnected);
            }
            var_71.addHabboConnectionMessageEvent(new HelloMessageEvent(onHelloEvent));
            var_71.addHabboConnectionMessageEvent(new InitCryptoMessageEvent(onInitCrypto));
            var_71.addHabboConnectionMessageEvent(new SecretKeyEvent(onSecretKeyEvent));
            var_71.addHabboConnectionMessageEvent(new SessionParamsMessageEvent(onSessionParamsEvent));
            var_71.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthenticationOK));
            var_71.addHabboConnectionMessageEvent(new PingMessageEvent(onPing));
            var_71.addHabboConnectionMessageEvent(new ErrorReportEvent(onErrorReport));
            var_71.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
            var_71.addHabboConnectionMessageEvent(new GenericErrorEvent(onGenericError));
            var_71.addHabboConnectionMessageEvent(new DisconnectReasonEvent(onDisconnectReason));
            var_71.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(onRoomEntryInfoEvent));
            var_71.addHabboConnectionMessageEvent(new UniqueMachineIDEvent(onUniqueMachineId));
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         param1.connection.send(new ScrGetUserInfoMessageComposer("habbo_club"));
      }
      
      private function onConnectionEstablished(param1:Event = null) : void
      {
         var _loc3_:* = null;
         var _loc2_:IConnection = var_71.getHabboMainConnection(null);
         if(_loc2_ != null)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_522);
            _loc3_ = new InitCryptoMessageComposer(var_71.mode);
            _loc2_.send(_loc3_);
         }
      }
      
      private function onInitCrypto(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:IConnection = param1.connection;
         var _loc3_:InitCryptoMessageEvent = param1 as InitCryptoMessageEvent;
         var _loc4_:String = _loc3_.token;
         var _loc5_:Boolean = _loc3_.isServerEncrypted;
         var_1737 = new PseudoRandom(parseInt(_loc4_.substring(_loc4_.length - 4),16),65536);
         switch(var_71.mode)
         {
            case HabboConnectionType.const_425:
               _loc6_ = "";
               _loc6_ = var_97.getKey("url.prefix",_loc6_);
               _loc6_ = _loc6_.replace("http://","");
               _loc6_ = _loc6_.replace("https://","");
               _loc7_ = var_97.getKey("hotelview.banner.url","http:/\nsitename$/gamedata/banner");
               _loc7_ = _loc7_.replace("$sitename$",_loc6_);
               var_958 = _loc4_;
               var_166.loadBannerImage(_loc7_ + "?token=" + var_958,onHotelViewBannerLoaded);
               break;
            case HabboConnectionType.const_1293:
               sendConnectionParameters(_loc2_);
               break;
            case HabboConnectionType.const_1168:
               var_957 = generateRandomHexString(30);
               var_452 = new DiffieHellman(new BigInteger(var_97.getKey("connection.development.prime"),16),new BigInteger(var_97.getKey("connection.development.generator"),16));
               var_452.init(var_957);
               _loc8_ = var_452.getPublicKey(10);
               _loc2_.send(new GenerateSecretKeyMessageComposer(_loc8_.toUpperCase()));
               break;
            default:
               Logger.log("[HabboCommunicationDemo] Unknown Connection Mode: undefined");
         }
      }
      
      private function onConfigurationLoaded(param1:Event = null) : void
      {
         var_166 = new HabboHotelView(_windowManager,assets,Component(context).events);
         var _loc2_:String = var_97.getKey("client.hotel_view.image");
         var _loc3_:String = var_97.getKey("image.library.url");
         if(_loc2_ != null && _loc3_ != null)
         {
            var_166.loadHotelViewImage(_loc3_ + _loc2_);
         }
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      private function onHotelViewBannerLoaded(param1:BitmapData) : void
      {
         var _loc2_:ByteArray = param1.getPixels(param1.rect);
         var _loc3_:String = decode(_loc2_,param1.width,4,new Point(4,39),new Point(80,30));
         var _loc4_:String = xor(_loc3_,var_958);
         var _loc5_:uint = _loc4_.charCodeAt(0);
         var _loc6_:uint = _loc4_.charCodeAt(_loc5_ + 1);
         var _loc7_:String = _loc4_.substr(1,_loc5_);
         var _loc8_:String = _loc4_.substr(_loc5_ + 2,_loc6_);
         var _loc9_:IConnection = var_71.getHabboMainConnection(null);
         var _loc10_:BigInteger = new BigInteger();
         var _loc11_:BigInteger = new BigInteger();
         var _loc12_:String = "";
         _loc10_.fromRadix(_loc7_,10);
         _loc11_.fromRadix(_loc8_,10);
         var_452 = new DiffieHellman(_loc10_,_loc11_);
         var _loc13_:int = 100;
         while(_loc12_.length < 64)
         {
            var_957 = generateRandomHexString(30);
            var_452.init(var_957);
            _loc12_ = var_452.getPublicKey(10);
            _loc13_--;
            if(_loc13_ == 0)
            {
            }
         }
         _loc9_.send(new GenerateSecretKeyMessageComposer(_loc12_.toUpperCase()));
         var_958 = "";
      }
      
      private function onInitConnection(param1:Event = null) : void
      {
         dispatchLoginStepEvent(HabboCommunicationEvent.INIT);
         if(var_652 != null)
         {
            var_71.mode = HabboConnectionType.const_425;
         }
         else
         {
            var_71.mode = HabboConnectionType.const_425;
         }
         var_71.initConnection(HabboConnectionType.const_240);
      }
      
      public function out(param1:String) : void
      {
         if(var_1422 != null)
         {
            var_1422.out(param1);
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:AuthenticationOKMessageEvent = param1 as AuthenticationOKMessageEvent;
         out("Authentication success!");
         var _loc4_:InfoRetrieveMessageComposer = new InfoRetrieveMessageComposer();
         _loc2_.send(_loc4_);
         if(_view != null)
         {
            _view.closeLoginWindow();
         }
         dispatchLoginStepEvent(HabboCommunicationEvent.const_186);
      }
      
      private function generateRandomHexString(param1:uint = 16) : String
      {
         var _loc4_:* = 0;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc4_ = uint(uint(Math.random() * 255));
            _loc2_ += _loc4_.toString(16);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function dispatchLoginStepEvent(param1:String) : void
      {
         if(Component(context) == null || Component(context).events == null)
         {
            return;
         }
         Component(context).events.dispatchEvent(new Event(param1));
      }
      
      public function get habboCommunication() : IHabboCommunicationManager
      {
         return var_71;
      }
      
      private function onRoomSessionEnded(param1:RoomSessionEvent) : void
      {
         if(true)
         {
            showHotelView();
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            var_97 = param2 as IHabboConfigurationManager;
            Component(var_97).events.addEventListener(HabboConfigurationEvent.const_163,onConfigurationLoaded);
         }
      }
      
      private function onGenericError(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var parser:GenericErrorParser = (event as GenericErrorEvent).getParser();
         switch(parser.errorCode)
         {
            case -3:
               _windowManager.alert("${connection.error.id.title}","${connection.login.error.-3.desc}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               break;
            case -400:
               _windowManager.alert("${connection.error.id.title}","${connection.login.error.-400.desc}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
      }
      
      private function onPing(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:PingMessageEvent = param1 as PingMessageEvent;
         var _loc4_:PongMessageComposer = new PongMessageComposer();
         _loc2_.send(_loc4_);
      }
      
      private function onRoomSessionManagerReady(param1:IID, param2:IUnknown) : void
      {
         var_19 = param2 as IRoomSessionManager;
         var_19.events.addEventListener(RoomSessionEvent.const_101,onRoomSessionEnded);
      }
      
      public function set ssoTicket(param1:String) : void
      {
         var_652 = param1;
      }
      
      public function get communicationManager() : ICoreCommunicationManager
      {
         return var_312;
      }
   }
}
