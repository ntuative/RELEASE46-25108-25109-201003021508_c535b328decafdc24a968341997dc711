package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1362:String;
      
      private var var_1049:String;
      
      private var var_1857:Boolean;
      
      private var var_1425:int;
      
      private var var_1734:int;
      
      private var var_1859:Boolean;
      
      private var var_1649:String = "";
      
      private var var_1860:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1207:int;
      
      private var var_1858:Boolean;
      
      private var var_2069:int = -1;
      
      private var var_1691:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1734 = param1;
         var_1049 = param2;
         _objId = param3;
         var_1207 = param4;
         _category = param5;
         var_1362 = param6;
         var_1857 = param7;
         var_1860 = param8;
         var_1858 = param9;
         var_1859 = param10;
         var_1691 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1649;
      }
      
      public function get extra() : int
      {
         return var_1425;
      }
      
      public function get classId() : int
      {
         return var_1207;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get method_7() : Boolean
      {
         return var_1859;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1857;
      }
      
      public function get stripId() : int
      {
         return var_1734;
      }
      
      public function get stuffData() : String
      {
         return var_1362;
      }
      
      public function get songId() : int
      {
         return var_2069;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1649 = param1;
         var_1425 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1049;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1691;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1858;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1860;
      }
   }
}
