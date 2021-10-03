package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_1687:int;
      
      private var var_1685:int;
      
      private var var_1688:Boolean;
      
      private var var_1683:Boolean;
      
      private var var_1686:Array;
      
      private var var_1684:Boolean;
      
      private var var_1161:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_613:Array;
      
      private var var_1264:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1685;
      }
      
      public function get description() : String
      {
         return var_1264;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1683;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1687;
      }
      
      public function set description(param1:String) : void
      {
         var_1264 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1684 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1161;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1686;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1684;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1688 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_613 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1686 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1161 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1688;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1683 = param1;
      }
   }
}
