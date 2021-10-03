package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_748:LegacyWallGeometry = null;
      
      private var var_529:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_530:TileHeightMap = null;
      
      private var var_1608:String = null;
      
      private var _roomId:int = 0;
      
      private var var_749:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_748 = new LegacyWallGeometry();
         var_749 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_530 != null)
         {
            var_530.dispose();
         }
         var_530 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1608 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_748;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_749;
      }
      
      public function dispose() : void
      {
         if(var_530 != null)
         {
            var_530.dispose();
            var_530 = null;
         }
         if(var_748 != null)
         {
            var_748.dispose();
            var_748 = null;
         }
         if(var_749 != null)
         {
            var_749.dispose();
            var_749 = null;
         }
         if(var_529 != null)
         {
            var_529.dispose();
            var_529 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_530;
      }
      
      public function get worldType() : String
      {
         return var_1608;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_529 != null)
         {
            var_529.dispose();
         }
         var_529 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_529;
      }
   }
}
