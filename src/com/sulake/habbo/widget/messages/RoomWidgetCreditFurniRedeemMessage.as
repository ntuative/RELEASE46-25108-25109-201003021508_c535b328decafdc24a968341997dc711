package com.sulake.habbo.widget.messages
{
   public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage
   {
      
      public static const const_594:String = "RWFCRM_REDEEM";
       
      
      private var var_155:int;
      
      public function RoomWidgetCreditFurniRedeemMessage(param1:String, param2:int)
      {
         super(param1);
         var_155 = param2;
      }
      
      public function get objectId() : int
      {
         return var_155;
      }
   }
}
