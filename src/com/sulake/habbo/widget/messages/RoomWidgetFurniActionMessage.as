package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_234:String = "RWFAM_MOVE";
      
      public static const const_686:String = "RWFUAM_ROTATE";
      
      public static const const_566:String = "RWFAM_PICKUP";
       
      
      private var var_2025:int = 0;
      
      private var var_2160:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_2025 = param2;
         var_2160 = param3;
      }
      
      public function get furniId() : int
      {
         return var_2025;
      }
      
      public function get furniCategory() : int
      {
         return var_2160;
      }
   }
}
