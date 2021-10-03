package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1884:int;
      
      private var var_1144:int;
      
      private var var_710:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1144 = param1.readInteger();
         var_1884 = param1.readInteger();
         var_710 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_710.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1884;
      }
      
      public function get prizes() : Array
      {
         return var_710;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1144;
      }
   }
}
