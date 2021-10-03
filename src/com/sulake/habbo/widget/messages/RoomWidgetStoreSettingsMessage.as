package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_591:String = "RWSSM_STORE_SOUND";
      
      public static const const_527:String = "RWSSM_PREVIEW_SOUND";
      
      public static const const_1296:String = "RWSSM_STORE_SETTINGS";
       
      
      private var var_641:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function set volume(param1:Number) : void
      {
         var_641 = param1;
      }
      
      public function get volume() : Number
      {
         return var_641;
      }
   }
}
