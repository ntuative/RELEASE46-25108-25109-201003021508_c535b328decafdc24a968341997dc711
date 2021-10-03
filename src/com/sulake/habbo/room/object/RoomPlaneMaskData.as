package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2107:Number = 0;
      
      private var var_1946:Number = 0;
      
      private var var_1945:Number = 0;
      
      private var var_2106:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1946 = param1;
         var_1945 = param2;
         var_2107 = param3;
         var_2106 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1946;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2107;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1945;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2106;
      }
   }
}
