package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1076:int = 0;
      
      private var _data:String = "";
      
      private var var_1425:int = -1;
      
      private var var_32:int = 0;
      
      private var _type:int = 0;
      
      private var var_1077:int = 0;
      
      private var var_2353:String = "";
      
      private var var_1691:int = 0;
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_1690:String = null;
      
      private var var_85:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function get extra() : int
      {
         return var_1425;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_218 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_85 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_205)
         {
            var_1425 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            var_32 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1691;
      }
      
      public function get staticClass() : String
      {
         return var_1690;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_205)
         {
            var_1691 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_205)
         {
            var_1690 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_205)
         {
            var_1076 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_205)
         {
            var_1077 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1076;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get sizeY() : int
      {
         return var_1077;
      }
   }
}
