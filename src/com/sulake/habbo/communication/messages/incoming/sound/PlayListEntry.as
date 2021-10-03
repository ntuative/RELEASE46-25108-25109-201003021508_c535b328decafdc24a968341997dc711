package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2069:int;
      
      private var var_2068:int = 0;
      
      private var var_2071:String;
      
      private var var_2070:int;
      
      private var var_2067:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_2069 = param1;
         var_2070 = param2;
         var_2067 = param3;
         var_2071 = param4;
      }
      
      public function get length() : int
      {
         return var_2070;
      }
      
      public function get name() : String
      {
         return var_2067;
      }
      
      public function get creator() : String
      {
         return var_2071;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2068;
      }
      
      public function get id() : int
      {
         return var_2069;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2068 = param1;
      }
   }
}
