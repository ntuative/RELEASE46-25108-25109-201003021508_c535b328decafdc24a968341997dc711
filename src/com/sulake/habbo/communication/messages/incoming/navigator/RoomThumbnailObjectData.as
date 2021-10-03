package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1457:int;
      
      private var var_1456:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1457;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1457 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1457 = this.var_1457;
         _loc1_.var_1456 = this.var_1456;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1456 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1456;
      }
   }
}
