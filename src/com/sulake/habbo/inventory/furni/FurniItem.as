package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1734:int;
      
      private var var_1860:Boolean;
      
      private var var_2069:int;
      
      private var var_1362:String;
      
      private var var_2175:Boolean = false;
      
      private var var_1691:int;
      
      private var var_435:int;
      
      private var var_1049:String;
      
      private var var_1649:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1207:int;
      
      private var var_1858:Boolean;
      
      private var var_2176:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1734 = param1;
         var_1049 = param2;
         _objId = param3;
         var_1207 = param4;
         var_1362 = param5;
         var_1860 = param6;
         var_1858 = param7;
         var_1691 = param8;
         var_1649 = param9;
         var_2069 = param10;
         var_435 = -1;
      }
      
      public function get songId() : int
      {
         return var_2069;
      }
      
      public function get iconCallbackId() : int
      {
         return var_435;
      }
      
      public function get expiryTime() : int
      {
         return var_1691;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2176 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2175 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_435 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1858;
      }
      
      public function get slotId() : String
      {
         return var_1649;
      }
      
      public function get classId() : int
      {
         return var_1207;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1860;
      }
      
      public function get stuffData() : String
      {
         return var_1362;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1734;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2175;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2176;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1049;
      }
   }
}
