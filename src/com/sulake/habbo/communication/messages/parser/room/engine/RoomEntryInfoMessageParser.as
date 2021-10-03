package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1983:int;
      
      private var var_384:Boolean;
      
      private var var_1984:Boolean;
      
      private var var_835:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1984 = param1.readBoolean();
         if(var_1984)
         {
            var_1983 = param1.readInteger();
            var_384 = param1.readBoolean();
         }
         else
         {
            var_835 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_835 != null)
         {
            var_835.dispose();
            var_835 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1983;
      }
      
      public function get owner() : Boolean
      {
         return var_384;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1984;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_835;
      }
   }
}
