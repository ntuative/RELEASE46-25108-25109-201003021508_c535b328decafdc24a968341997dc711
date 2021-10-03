package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      private var var_218:int = 0;
      
      private var var_1707:int = 0;
      
      private var var_2166:Number = 0;
      
      private var var_2167:Number = 0;
      
      private var var_2164:Number = 0;
      
      private var var_2165:Number = 0;
      
      private var var_2168:Boolean = false;
      
      private var var_85:Number = 0;
      
      private var _id:int = 0;
      
      private var var_184:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_184 = [];
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_86 = param4;
         var_2165 = param5;
         var_218 = param6;
         var_1707 = param7;
         var_2166 = param8;
         var_2167 = param9;
         var_2164 = param10;
         var_2168 = param11;
         var_184 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function get localZ() : Number
      {
         return var_2165;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2168;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1707;
      }
      
      public function get targetX() : Number
      {
         return var_2166;
      }
      
      public function get targetY() : Number
      {
         return var_2167;
      }
      
      public function get targetZ() : Number
      {
         return var_2164;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get actions() : Array
      {
         return var_184.slice();
      }
   }
}
