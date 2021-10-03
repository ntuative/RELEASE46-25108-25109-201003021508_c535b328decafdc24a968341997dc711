package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1798:Number;
      
      private var var_556:Number = 0;
      
      private var var_1799:Number;
      
      private var var_555:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1798 = param1;
         var_1799 = param2;
      }
      
      public function update() : void
      {
         var_555 += var_1799;
         var_556 += var_555;
         if(var_556 > 0)
         {
            var_556 = 0;
            var_555 = var_1798 * -1 * var_555;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_555 = param1;
         var_556 = 0;
      }
      
      public function get location() : Number
      {
         return var_556;
      }
   }
}
