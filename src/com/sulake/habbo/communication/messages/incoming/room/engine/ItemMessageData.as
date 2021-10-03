package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_86:Number = 0;
      
      private var _data:String = "";
      
      private var var_1425:int = 0;
      
      private var var_32:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2183:Boolean = false;
      
      private var var_2353:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_218:String = "";
      
      private var var_2184:int = 0;
      
      private var var_2185:int = 0;
      
      private var var_1633:int = 0;
      
      private var var_1626:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2183 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2183;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_218;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_205)
         {
            var_1633 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_205)
         {
            var_2184 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_205)
         {
            var_2185 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_205)
         {
            var_218 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_205)
         {
            var_1626 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            var_32 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1633;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2184;
      }
      
      public function get wallY() : Number
      {
         return var_2185;
      }
      
      public function get localY() : Number
      {
         return var_1626;
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
   }
}
