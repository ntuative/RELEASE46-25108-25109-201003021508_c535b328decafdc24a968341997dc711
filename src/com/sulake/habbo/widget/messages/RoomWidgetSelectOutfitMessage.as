package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_909:String = "select_outfit";
       
      
      private var var_1681:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_909);
         var_1681 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1681;
      }
   }
}
