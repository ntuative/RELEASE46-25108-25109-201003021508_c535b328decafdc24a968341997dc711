package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_155:int;
      
      private var var_218:int = 0;
      
      private var _roomId:int;
      
      private var var_85:int = 0;
      
      private var _y:int = 0;
      
      private var var_1947:int;
      
      private var var_2246:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_155 = param1;
         var_1947 = param2;
         var_2246 = param3;
         var_85 = param4;
         _y = param5;
         var_218 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1947)
         {
            case RoomObjectCategoryEnum.const_29:
               return [var_155 + " " + var_85 + " " + _y + " " + var_218];
            case RoomObjectCategoryEnum.const_28:
               return [var_155 + " " + var_2246];
            default:
               return [];
         }
      }
   }
}
