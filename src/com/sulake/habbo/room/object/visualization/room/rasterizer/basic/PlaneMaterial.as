package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.room.utils.IVector3d;
   import flash.display.BitmapData;
   
   public class PlaneMaterial
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var var_487:Array;
      
      public function PlaneMaterial()
      {
         var_487 = [];
         super();
      }
      
      private function getMaterialCellMatrix(param1:IVector3d) : PlaneMaterialCellMatrix
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         while(_loc2_ < var_487.length)
         {
            _loc3_ = var_487[_loc2_] as PlaneMaterialCellMatrix;
            if(_loc3_ != null)
            {
               if(param1.x >= _loc3_.normalMinX && param1.x <= _loc3_.normalMaxX && param1.y >= _loc3_.normalMinY && param1.y <= _loc3_.normalMaxY)
               {
                  return _loc3_;
               }
            }
            _loc2_++;
         }
         return null;
      }
      
      public function render(param1:BitmapData, param2:int, param3:int, param4:IVector3d, param5:Boolean, param6:int, param7:Boolean) : BitmapData
      {
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         var _loc8_:PlaneMaterialCellMatrix = getMaterialCellMatrix(param4);
         if(_loc8_ != null)
         {
            return _loc8_.render(param1,param2,param3,param4,param5,param6,param7);
         }
         return null;
      }
      
      public function addMaterialCellMatrix(param1:int, param2:int, param3:int, param4:Number = -1, param5:Number = 1, param6:Number = -1, param7:Number = 1) : PlaneMaterialCellMatrix
      {
         var _loc8_:* = null;
         _loc8_ = new PlaneMaterialCellMatrix(param1,param2,param3,param4,param5,param6,param7);
         var_487.push(_loc8_);
         return _loc8_;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_487 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_487.length)
            {
               _loc2_ = var_487[_loc1_] as PlaneMaterialCellMatrix;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_487 = null;
         }
      }
   }
}
