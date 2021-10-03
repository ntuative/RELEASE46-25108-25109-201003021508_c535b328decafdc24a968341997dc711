package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_151:Array;
      
      private var var_32:Boolean = false;
      
      private var var_1471:int = 0;
      
      private var var_1470:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_467:Map;
      
      private var var_1868:int = 0;
      
      private var var_1473:int = 0;
      
      private var var_175:IHabboConfigurationManager;
      
      private var var_1202:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1472:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_32)
         {
            return;
         }
         if(getTimer() - var_1471 > var_1470)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1471 = getTimer();
         var_467.add(var_1202,var_1471);
         _connection.send(new LatencyPingRequestMessageComposer(var_1202));
         ++var_1202;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_175 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1470 = int(var_175.getKey("latencytest.interval"));
         var_1472 = int(var_175.getKey("latencytest.report.index"));
         var_1868 = int(var_175.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1470 < 1)
         {
            return;
         }
         var_467 = new Map();
         var_151 = new Array();
         var_32 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_467 == null || var_151 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_467.getValue(_loc2_.requestId);
         var_467.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_151.push(_loc4_);
         if(var_151.length == var_1472 && var_1472 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_151.length)
            {
               _loc5_ += var_151[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_151.length)
            {
               if(var_151[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_151[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_151 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1473) > var_1868 || var_1473 == 0)
            {
               var_1473 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_151.length);
               _connection.send(_loc11_);
            }
            var_151 = [];
         }
      }
      
      public function dispose() : void
      {
         var_32 = false;
         var_175 = null;
         _communication = null;
         _connection = null;
         if(var_467 != null)
         {
            var_467.dispose();
            var_467 = null;
         }
         var_151 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_175 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
