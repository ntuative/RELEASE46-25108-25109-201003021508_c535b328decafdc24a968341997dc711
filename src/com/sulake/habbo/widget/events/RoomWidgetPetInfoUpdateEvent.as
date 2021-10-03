package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_136:String = "RWPIUE_PET_INFO";
       
      
      private var var_1618:int;
      
      private var var_1615:int;
      
      private var var_1616:int;
      
      private var _nutrition:int;
      
      private var var_1614:int;
      
      private var var_1624:int;
      
      private var _energy:int;
      
      private var var_940:int;
      
      private var var_1622:int;
      
      private var var_1617:int;
      
      private var var_1619:int;
      
      private var _id:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_1960:int;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1623:Boolean;
      
      private var _name:String;
      
      private var var_456:int;
      
      private var var_1620:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.const_136,param10,param11);
         var_940 = param1;
         var_1960 = param2;
         _name = param3;
         _id = param4;
         _image = param5;
         var_1623 = param6;
         var_1620 = param7;
         _ownerName = param8;
         var_1617 = param9;
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1623;
      }
      
      public function get level() : int
      {
         return var_1618;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1624 = param1;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set level(param1:int) : void
      {
         var_1618 = param1;
      }
      
      public function get petRace() : int
      {
         return var_1960;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_456 = param1;
      }
      
      public function get experienceMax() : int
      {
         return var_1614;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get nutritionMax() : int
      {
         return var_1616;
      }
      
      public function get ownerId() : int
      {
         return var_1620;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1614 = param1;
      }
      
      public function get roomIndex() : int
      {
         return var_1617;
      }
      
      public function get energyMax() : int
      {
         return var_1622;
      }
      
      public function get levelMax() : int
      {
         return var_1624;
      }
      
      public function get method_4() : int
      {
         return _petRespect;
      }
      
      public function get petRespectLeft() : int
      {
         return var_456;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         _canOwnerBeKicked = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1616 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set method_4(param1:int) : void
      {
         _petRespect = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1615 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1615;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1622 = param1;
      }
      
      public function get method_9() : int
      {
         return var_940;
      }
      
      public function set age(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function get age() : int
      {
         return var_1619;
      }
   }
}
