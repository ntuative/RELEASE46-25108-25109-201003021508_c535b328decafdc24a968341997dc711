package com.sulake.habbo.room.object.visualization.room.publicroom
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.room.RoomVisualization;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class PublicRoomVisualization extends RoomVisualization
   {
       
      
      protected var var_1103:int = 0;
      
      private var var_2231:Boolean = false;
      
      public function PublicRoomVisualization()
      {
         super();
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         super.update(param1,param2);
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         initializeLayout(param1);
         var _loc4_:IRoomObjectModel = object.getModel();
         var _loc5_:String = _loc4_.getString(RoomObjectVariableEnum.const_320);
         var _loc6_:* = !Boolean(_loc4_.getNumber(RoomObjectVariableEnum.const_472));
         if(_loc5_ != "" && data != null)
         {
            data.layoutRasterizer.showAd(this,_loc5_,_loc6_);
         }
      }
      
      protected function get data() : PublicRoomVisualizationData
      {
         return _data as PublicRoomVisualizationData;
      }
      
      override public function get floorRelativeDepth() : Number
      {
         return 131;
      }
      
      private function addSprites(param1:int) : void
      {
         createSprites(var_1103 + param1);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!param1 is PublicRoomVisualizationData)
         {
            return false;
         }
         return super.initialize(param1);
      }
      
      private function initializeLayout(param1:IRoomGeometry) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(var_2231)
         {
            return;
         }
         if(data != null)
         {
            var_1103 = spriteCount;
            _loc2_ = object.getModel();
            _loc3_ = _loc2_.getString(RoomObjectVariableEnum.const_919);
            data.layoutRasterizer.layout = _loc3_;
            data.layoutRasterizer.initializeGeometry(param1);
            addSprites(data.layoutRasterizer.elementCount());
            _loc4_ = 0;
            while(_loc4_ < data.layoutRasterizer.elementCount())
            {
               data.layoutRasterizer.setElementToSprite(_loc4_,getSprite(_loc4_ + var_1103));
               _loc4_++;
            }
            data.layoutRasterizer.initializeAds(var_1103,this);
         }
         var_2231 = true;
      }
      
      override public function get wallRelativeDepth() : Number
      {
         return 135;
      }
   }
}
