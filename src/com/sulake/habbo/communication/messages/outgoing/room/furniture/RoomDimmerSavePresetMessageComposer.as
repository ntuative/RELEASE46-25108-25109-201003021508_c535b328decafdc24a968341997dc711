package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1715:int;
      
      private var var_1716:int;
      
      private var var_2111:Boolean;
      
      private var var_2110:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2109:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1716 = param1;
         var_1715 = param2;
         var_2110 = param3;
         var_2109 = param4;
         var_2111 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1716,var_1715,var_2110,var_2109,int(var_2111)];
      }
      
      public function dispose() : void
      {
      }
   }
}
