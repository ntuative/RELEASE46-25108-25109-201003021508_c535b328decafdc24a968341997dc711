package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1874:Number = 1;
      
      private var var_185:Number = 1;
      
      private var var_1608:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1608 = param1;
         var_185 = param2;
         var_1874 = param3;
      }
      
      public function get scale() : Number
      {
         return var_185;
      }
      
      public function get heightScale() : Number
      {
         return var_1874;
      }
   }
}
