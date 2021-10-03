package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1452:GarbageMonitor = null;
      
      private var var_1106:int = 0;
      
      private var var_1227:Boolean = false;
      
      private var var_1826:String = "";
      
      private var var_1451:String = "";
      
      private var var_331:Number = 0;
      
      private var var_1179:int = 10;
      
      private var var_2293:Array;
      
      private var var_620:int = 0;
      
      private var var_1182:int = 60;
      
      private var var_977:int = 0;
      
      private var var_978:int = 0;
      
      private var var_1999:String = "";
      
      private var var_1823:Number = 0;
      
      private var var_1180:int = 1000;
      
      private var var_1825:Boolean = true;
      
      private var var_1822:Number = 0.15;
      
      private var var_175:IHabboConfigurationManager = null;
      
      private var var_1824:String = "";
      
      private var var_1181:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2293 = [];
         super();
         var_1451 = Capabilities.version;
         var_1826 = Capabilities.os;
         var_1227 = Capabilities.isDebugger;
         var_1824 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1452 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1106 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1452.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1452.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_331;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1182 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1451;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_978;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1180)
         {
            ++var_977;
            _loc3_ = true;
         }
         else
         {
            ++var_620;
            if(var_620 <= 1)
            {
               var_331 = param1;
            }
            else
            {
               _loc4_ = Number(var_620);
               var_331 = var_331 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1106 > var_1182 * 1000 && var_1181 < var_1179)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_331);
            _loc5_ = true;
            if(var_1825 && var_1181 > 0)
            {
               _loc6_ = differenceInPercents(var_1823,var_331);
               if(_loc6_ < var_1822)
               {
                  _loc5_ = false;
               }
            }
            var_1106 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1823 = var_331;
               if(sendReport())
               {
                  ++var_1181;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1179 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1180 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1824,var_1451,var_1826,var_1999,var_1227,_loc4_,_loc3_,var_978,var_331,var_977);
            _connection.send(_loc1_);
            var_978 = 0;
            var_331 = 0;
            var_620 = 0;
            var_977 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_175 = param1;
         var_1182 = int(var_175.getKey("performancetest.interval","60"));
         var_1180 = int(var_175.getKey("performancetest.slowupdatelimit","1000"));
         var_1179 = int(var_175.getKey("performancetest.reportlimit","10"));
         var_1822 = Number(var_175.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1825 = Boolean(int(var_175.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
