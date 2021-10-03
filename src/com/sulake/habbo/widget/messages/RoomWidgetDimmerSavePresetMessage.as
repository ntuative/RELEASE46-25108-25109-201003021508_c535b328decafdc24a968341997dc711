package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_734:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1715:int;
      
      private var var_1716:int;
      
      private var var_1717:Boolean;
      
      private var var_1066:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_734);
         var_1716 = param1;
         var_1715 = param2;
         _color = param3;
         var_1066 = param4;
         var_1717 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1715;
      }
      
      public function get presetNumber() : int
      {
         return var_1716;
      }
      
      public function get brightness() : int
      {
         return var_1066;
      }
      
      public function get apply() : Boolean
      {
         return var_1717;
      }
   }
}
