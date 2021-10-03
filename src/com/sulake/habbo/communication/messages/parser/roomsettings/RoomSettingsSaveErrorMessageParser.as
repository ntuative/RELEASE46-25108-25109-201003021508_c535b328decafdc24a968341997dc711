package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1522:int = 9;
      
      public static const const_1524:int = 4;
      
      public static const const_1581:int = 1;
      
      public static const const_1275:int = 10;
      
      public static const const_1556:int = 2;
      
      public static const const_1286:int = 7;
      
      public static const const_1215:int = 11;
      
      public static const const_1601:int = 3;
      
      public static const const_1261:int = 8;
      
      public static const const_1325:int = 5;
      
      public static const const_1447:int = 6;
      
      public static const const_1236:int = 12;
       
      
      private var var_2123:String;
      
      private var _roomId:int;
      
      private var var_1125:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2123;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1125 = param1.readInteger();
         var_2123 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1125;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
