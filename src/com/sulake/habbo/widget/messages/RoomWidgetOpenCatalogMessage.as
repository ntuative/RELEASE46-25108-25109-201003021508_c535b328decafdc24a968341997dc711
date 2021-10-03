package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_596:String = "RWOCM_CLUB_MAIN";
      
      public static const const_553:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1851:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_553);
         var_1851 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1851;
      }
   }
}
