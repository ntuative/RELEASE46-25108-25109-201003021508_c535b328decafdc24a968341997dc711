package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_626:int = 0;
      
      private var var_34:String = "";
      
      private var var_1336:Timer;
      
      private var var_280:Array;
      
      private var var_2217:Boolean = false;
      
      private var var_88:String = "";
      
      private var var_97:IHabboConfigurationManager;
      
      private var var_1060:IMessageConfiguration;
      
      private const const_1626:int = 5;
      
      private var var_353:int = -1;
      
      private var var_312:ICoreCommunicationManager;
      
      private var var_911:int = 1;
      
      private var var_2219:Boolean = false;
      
      private var var_2218:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1060 = new HabboMessages();
         var_280 = [];
         var_1336 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      public function get port() : int
      {
         if(var_353 < 0 || var_353 >= var_280.length)
         {
            return 0;
         }
         return var_280[var_353];
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_280[var_353]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_911 + " attempts");
      }
      
      private function include(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + var_97);
         if(var_97 == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_908);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_280 = [];
            var_34 = var_97.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = var_97.getKey("connection.info.port","25001");
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_280.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_34);
            Logger.log("Connection Host: " + var_34);
            Logger.log("Connection Ports: " + var_280);
            Logger.log("Habbo Connection Info:" + _connection);
            var_2219 = true;
            if(var_2218)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1260,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1136,param1 + " " + param2);
         if(false)
         {
            var_88 += ",R:" + param1;
         }
         else
         {
            var_88 = "R:" + param1;
         }
         if(false)
         {
            var_88 = var_88.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_88);
      }
      
      private function nextPort() : void
      {
         ++var_353;
         if(var_353 >= var_280.length)
         {
            ++var_911;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_911);
            if(var_911 > const_1626)
            {
               if(var_2217)
               {
                  return;
               }
               var_2217 = true;
               Core.error("Connection failed to host " + var_34 + " ports " + var_280,true,Core.const_560);
               return;
            }
            var_353 = 0;
         }
         _connection.timeout = var_911 * 5000;
         _connection.init(var_34,var_280[var_353]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1336.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_626;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_312)
         {
            var_312.release(new IIDCoreCommunicationManager());
            var_312 = null;
         }
         if(var_97)
         {
            var_97.release(new IIDHabboConfigurationManager());
            var_97 = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_240:
               if(var_97 == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_560);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_560);
                  return;
               }
               var_2218 = true;
               if(var_2219)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = var_97.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         return var_312.addConnectionMessageEvent(HabboConnectionType.const_240,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1383,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1213,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1303,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1382,param1 + " " + param2);
         if(false)
         {
            var_88 += ",S:" + param1;
         }
         else
         {
            var_88 = "S:" + param1;
         }
         if(false)
         {
            var_88 = var_88.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_88);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_280[var_353]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_626 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_312 = param2 as ICoreCommunicationManager;
            var_312.connectionStateListener = this;
            var_312.registerProtocolType(HabboProtocolType.const_960,WedgieProtocol);
            _connection = var_312.createConnection(HabboConnectionType.const_240,ConnectionType.const_891);
            _loc3_ = var_312.getProtocolInstanceOfType(HabboProtocolType.const_960);
            _connection.registerMessageClasses(var_1060);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1336.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1336.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            var_97 = param2 as IHabboConfigurationManager;
            (var_97 as Component).events.addEventListener(HabboConfigurationEvent.INIT,include);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_312 ? var_312.queueConnection(HabboConnectionType.const_240,param1) : null;
      }
   }
}
