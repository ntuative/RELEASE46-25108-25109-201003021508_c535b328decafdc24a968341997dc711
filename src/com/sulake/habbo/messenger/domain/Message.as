package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_728:int = 2;
      
      public static const const_863:int = 6;
      
      public static const const_520:int = 1;
      
      public static const const_549:int = 3;
      
      public static const const_1000:int = 4;
      
      public static const const_608:int = 5;
       
      
      private var var_1897:String;
      
      private var var_1082:int;
      
      private var var_1667:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1082 = param2;
         var_1667 = param3;
         var_1897 = param4;
      }
      
      public function get time() : String
      {
         return var_1897;
      }
      
      public function get senderId() : int
      {
         return var_1082;
      }
      
      public function get messageText() : String
      {
         return var_1667;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
