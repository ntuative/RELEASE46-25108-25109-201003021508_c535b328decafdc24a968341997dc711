package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_984:String = "inventory_badges";
      
      public static const const_1194:String = "inventory_clothes";
      
      public static const const_1273:String = "inventory_furniture";
      
      public static const const_582:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_950:String = "inventory_effects";
       
      
      private var var_1976:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_582);
         var_1976 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1976;
      }
   }
}
