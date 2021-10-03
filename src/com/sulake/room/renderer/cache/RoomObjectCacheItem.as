package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_556:RoomObjectLocationCacheItem = null;
      
      private var var_172:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_556 = new RoomObjectLocationCacheItem(param1);
         var_172 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_556;
      }
      
      public function dispose() : void
      {
         if(var_556 != null)
         {
            var_556.dispose();
            var_556 = null;
         }
         if(var_172 != null)
         {
            var_172.dispose();
            var_172 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_172;
      }
   }
}
