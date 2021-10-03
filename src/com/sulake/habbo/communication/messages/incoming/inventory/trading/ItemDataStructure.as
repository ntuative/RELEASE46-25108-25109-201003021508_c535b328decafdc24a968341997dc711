package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1049:String;
      
      private var var_1607:int;
      
      private var var_1750:int;
      
      private var var_1425:int;
      
      private var var_1746:int;
      
      private var _category:int;
      
      private var var_2355:int;
      
      private var var_1745:int;
      
      private var var_1749:int;
      
      private var var_1747:int;
      
      private var var_1748:int;
      
      private var var_1751:Boolean;
      
      private var var_1362:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1607 = param1;
         var_1049 = param2;
         var_1750 = param3;
         var_1747 = param4;
         _category = param5;
         var_1362 = param6;
         var_1425 = param7;
         var_1749 = param8;
         var_1745 = param9;
         var_1748 = param10;
         var_1746 = param11;
         var_1751 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1747;
      }
      
      public function get extra() : int
      {
         return var_1425;
      }
      
      public function get stuffData() : String
      {
         return var_1362;
      }
      
      public function get groupable() : Boolean
      {
         return var_1751;
      }
      
      public function get creationMonth() : int
      {
         return var_1748;
      }
      
      public function get roomItemID() : int
      {
         return var_1750;
      }
      
      public function get itemType() : String
      {
         return var_1049;
      }
      
      public function get itemID() : int
      {
         return var_1607;
      }
      
      public function get songID() : int
      {
         return var_1425;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1749;
      }
      
      public function get creationYear() : int
      {
         return var_1746;
      }
      
      public function get creationDay() : int
      {
         return var_1745;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
