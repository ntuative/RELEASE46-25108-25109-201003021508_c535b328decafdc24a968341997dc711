package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1371:String = "F";
      
      public static const const_943:String = "M";
       
      
      private var var_85:Number = 0;
      
      private var var_538:String = "";
      
      private var var_2229:int = 0;
      
      private var var_1596:String = "";
      
      private var var_1598:int = 0;
      
      private var var_1599:int = 0;
      
      private var var_1595:String = "";
      
      private var var_1141:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_2228:String = "";
      
      private var _name:String = "";
      
      private var var_1597:int = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_218 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2229;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_205)
         {
            var_1598 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2228;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_205)
         {
            var_1595 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_205)
         {
            var_2228 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_205)
         {
            var_1599 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_205)
         {
            var_538 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_205)
         {
            var_2229 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_205)
         {
            var_1141 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1598;
      }
      
      public function get groupID() : String
      {
         return var_1595;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_205)
         {
            var_1597 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_205)
         {
            var_1596 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get sex() : String
      {
         return var_1141;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
      
      public function get webID() : int
      {
         return var_1597;
      }
      
      public function get custom() : String
      {
         return var_1596;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_86 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_85 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1599;
      }
   }
}
