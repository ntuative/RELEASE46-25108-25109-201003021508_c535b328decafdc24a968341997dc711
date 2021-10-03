package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
   
   public class RoomSettingsDataMessageParser implements IMessageParser
   {
       
      
      private var var_112:RoomSettingsData;
      
      public function RoomSettingsDataMessageParser()
      {
         super();
      }
      
      public function get data() : RoomSettingsData
      {
         return var_112;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_112 = new RoomSettingsData();
         var_112.roomId = param1.readInteger();
         var_112.name = param1.readString();
         var_112.description = param1.readString();
         var_112.doorMode = param1.readInteger();
         var_112.categoryId = param1.readInteger();
         var_112.maximumVisitors = param1.readInteger();
         var_112.maximumVisitorsLimit = param1.readInteger();
         var_112.tags = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_112.tags.push(param1.readString());
            _loc3_++;
         }
         var_112.controllers = [];
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            var_112.controllers.push(new FlatControllerData(param1));
            _loc5_++;
         }
         var_112.controllerCount = param1.readInteger();
         var_112.allowPets = param1.readInteger() == 1;
         var_112.allowFoodConsume = param1.readInteger() == 1;
         var_112.allowWalkThrough = param1.readInteger() == 1;
         return true;
      }
      
      public function flush() : Boolean
      {
         var_112 = null;
         return true;
      }
   }
}
