package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_808:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1235:Boolean = true;
      
      private var var_1181:int = 0;
      
      private var var_751:int = 0;
      
      private var var_1106:int = 0;
      
      private var var_750:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1179:int = 15;
      
      private var var_175:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1182:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1106 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1235)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_751,var_750);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1181;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_751 == 0 && var_750 == 0;
      }
      
      private function resetLog() : void
      {
         var_751 = 0;
         var_750 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1235)
         {
            return;
         }
         if(getTimer() - var_1106 > var_1182 * 1000 && var_1181 < var_1179)
         {
            var_1106 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_175 = param1;
         var_1182 = int(var_175.getKey("lagwarninglog.interval","60"));
         var_1179 = int(var_175.getKey("lagwarninglog.reportlimit","15"));
         var_1235 = Boolean(int(var_175.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_750 += 1;
            case const_808:
               var_751 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
