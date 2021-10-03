package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1732:Array;
      
      private var var_1733:String;
      
      private var var_1731:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1733 = param1;
         var_1732 = param2;
         var_1731 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1733;
      }
      
      public function get yieldList() : Array
      {
         return var_1732;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1731;
      }
   }
}
