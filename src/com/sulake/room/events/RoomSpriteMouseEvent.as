package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1635:Boolean = false;
      
      private var var_1627:Boolean = false;
      
      private var var_1629:String = "";
      
      private var _type:String = "";
      
      private var var_1632:Boolean = false;
      
      private var var_1633:Number = 0;
      
      private var var_1628:Number = 0;
      
      private var var_1634:Number = 0;
      
      private var var_1630:String = "";
      
      private var var_1626:Number = 0;
      
      private var var_1631:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1630 = param2;
         var_1629 = param3;
         var_1628 = param4;
         var_1634 = param5;
         var_1633 = param6;
         var_1626 = param7;
         var_1631 = param8;
         var_1627 = param9;
         var_1632 = param10;
         var_1635 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1631;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1635;
      }
      
      public function get localX() : Number
      {
         return var_1633;
      }
      
      public function get localY() : Number
      {
         return var_1626;
      }
      
      public function get canvasId() : String
      {
         return var_1630;
      }
      
      public function get altKey() : Boolean
      {
         return var_1627;
      }
      
      public function get spriteTag() : String
      {
         return var_1629;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1628;
      }
      
      public function get screenY() : Number
      {
         return var_1634;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1632;
      }
   }
}
