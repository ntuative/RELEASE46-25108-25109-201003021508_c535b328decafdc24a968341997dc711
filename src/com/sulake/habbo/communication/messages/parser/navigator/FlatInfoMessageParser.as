package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_220:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_220 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_220;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_220 = new RoomSettingsFlatInfo();
         var_220.allowFurniMoving = param1.readInteger() == 1;
         var_220.doorMode = param1.readInteger();
         var_220.id = param1.readInteger();
         var_220.ownerName = param1.readString();
         var_220.type = param1.readString();
         var_220.name = param1.readString();
         var_220.description = param1.readString();
         var_220.showOwnerName = param1.readInteger() == 1;
         var_220.allowTrading = param1.readInteger() == 1;
         var_220.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
