package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_670:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_670 = new ByteArray();
         var_670.writeShort(param1);
         var_670.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_670.position = 0;
         if(false)
         {
            _loc1_ = var_670.readShort();
            var_670.position = 0;
         }
         return _loc1_;
      }
   }
}
