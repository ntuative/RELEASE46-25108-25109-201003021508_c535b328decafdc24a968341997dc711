package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_538:String = "";
      
      private var var_1596:String = "";
      
      private var var_1598:int = 0;
      
      private var var_1599:int = 0;
      
      private var _type:int = 0;
      
      private var var_1595:String = "";
      
      private var var_1141:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1597:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1598 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1595 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_538 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_1141 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1598;
      }
      
      public function set webID(param1:int) : void
      {
         var_1597 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1595;
      }
      
      public function set custom(param1:String) : void
      {
         var_1596 = param1;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
      
      public function get sex() : String
      {
         return var_1141;
      }
      
      public function get custom() : String
      {
         return var_1596;
      }
      
      public function get webID() : int
      {
         return var_1597;
      }
      
      public function set xp(param1:int) : void
      {
         var_1599 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1599;
      }
   }
}
