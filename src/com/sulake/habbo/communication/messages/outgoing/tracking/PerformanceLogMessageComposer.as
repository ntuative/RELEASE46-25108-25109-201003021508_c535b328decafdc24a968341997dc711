package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_977:int = 0;
      
      private var var_1227:int = 0;
      
      private var var_1826:String = "";
      
      private var var_978:int = 0;
      
      private var var_1999:String = "";
      
      private var var_1996:int = 0;
      
      private var var_1451:String = "";
      
      private var var_1997:int = 0;
      
      private var var_1995:int = 0;
      
      private var var_1824:String = "";
      
      private var var_1998:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1997 = param1;
         var_1824 = param2;
         var_1451 = param3;
         var_1826 = param4;
         var_1999 = param5;
         if(param6)
         {
            var_1227 = 1;
         }
         else
         {
            var_1227 = 0;
         }
         var_1996 = param7;
         var_1995 = param8;
         var_978 = param9;
         var_1998 = param10;
         var_977 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1997,var_1824,var_1451,var_1826,var_1999,var_1227,var_1996,var_1995,var_978,var_1998,var_977];
      }
      
      public function dispose() : void
      {
      }
   }
}
