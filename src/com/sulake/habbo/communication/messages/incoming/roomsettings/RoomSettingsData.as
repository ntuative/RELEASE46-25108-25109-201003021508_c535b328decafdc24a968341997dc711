package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_349:int = 0;
      
      public static const const_121:int = 2;
      
      public static const const_172:int = 1;
      
      public static const const_657:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1688:Boolean;
      
      private var var_1683:Boolean;
      
      private var var_1837:int;
      
      private var var_1686:Array;
      
      private var var_1836:int;
      
      private var var_1684:Boolean;
      
      private var var_1264:String;
      
      private var var_1687:int;
      
      private var var_1685:int;
      
      private var var_1161:int;
      
      private var _roomId:int;
      
      private var var_613:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1687;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1684;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1836 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1686 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_613 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1688;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1683;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1837;
      }
      
      public function get categoryId() : int
      {
         return var_1161;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1684 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1836;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1686;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1688 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1683 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1837 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1685;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1161 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1264 = param1;
      }
      
      public function get description() : String
      {
         return var_1264;
      }
   }
}
