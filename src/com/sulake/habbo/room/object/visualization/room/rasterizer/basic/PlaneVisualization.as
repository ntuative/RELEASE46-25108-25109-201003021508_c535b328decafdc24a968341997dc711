package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.PlaneVisualizationAnimationLayer;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaneVisualization
   {
       
      
      private var var_171:Array;
      
      private var var_1936:Boolean = false;
      
      private var var_2298:Number;
      
      private var _geometry:RoomGeometry = null;
      
      private var var_778:Vector3d = null;
      
      private var var_26:BitmapData;
      
      private var var_2297:Number;
      
      public function PlaneVisualization(param1:Number, param2:int, param3:Number, param4:Number)
      {
         var_171 = [];
         super();
         if(param2 < 0)
         {
            param2 = 0;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            var_171.push(null);
            _loc5_++;
         }
         param3 = Number(Math.abs(param3));
         if(param3 > 90)
         {
            param3 = 90;
         }
         param4 = Number(Math.abs(param4));
         if(param4 > 90)
         {
            param4 = 90;
         }
         var_2298 = param3;
         var_2297 = param4;
         _geometry = new RoomGeometry(param1,new Vector3d(param3,param4),new Vector3d(-10,0,0));
         var_778 = new Vector3d();
      }
      
      public function setAnimationLayer(param1:int, param2:XML, param3:IGraphicAssetCollection) : Boolean
      {
         if(param1 < 0 || param1 > var_171.length)
         {
            return false;
         }
         var _loc4_:* = var_171[param1] as IDisposable;
         if(_loc4_ != null)
         {
            _loc4_.dispose();
            _loc4_ = null;
         }
         _loc4_ = new PlaneVisualizationAnimationLayer(param2,param3);
         var_171[param1] = _loc4_;
         var_1936 = true;
         return true;
      }
      
      public function get hasAnimationLayers() : Boolean
      {
         return var_1936;
      }
      
      public function setLayer(param1:int, param2:PlaneMaterial, param3:uint, param4:int, param5:int = 0) : Boolean
      {
         if(param1 < 0 || param1 > var_171.length)
         {
            return false;
         }
         var _loc6_:* = var_171[param1] as IDisposable;
         if(_loc6_ != null)
         {
            _loc6_.dispose();
            _loc6_ = null;
         }
         _loc6_ = new PlaneVisualizationLayer(param2,param3,param4,param5);
         var_171[param1] = _loc6_;
         return true;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      public function render(param1:BitmapData, param2:int, param3:int, param4:IVector3d, param5:Boolean, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:Number = 0, param11:Number = 0, param12:int = 0) : BitmapData
      {
         var _loc14_:* = null;
         var _loc15_:* = null;
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         if(param1 == null || param1.width != param2 || param1.height != param3)
         {
            param1 = null;
         }
         if(var_26 != null)
         {
            if(var_26.width == param2 && var_26.height == param3 && Vector3d.isEqual(var_778,param4))
            {
               if(!hasAnimationLayers)
               {
                  if(param1 != null)
                  {
                     param1.copyPixels(var_26,var_26.rect,new Point(0,0),null,null,false);
                     return param1;
                  }
                  return var_26;
               }
            }
            else
            {
               var_26.dispose();
               var_26 = null;
            }
         }
         if(var_26 == null)
         {
            var_26 = new BitmapData(param2,param3,true,16777215);
         }
         else
         {
            var_26.fillRect(var_26.rect,16777215);
         }
         if(param1 == null)
         {
            param1 = var_26;
         }
         var_778.assign(param4);
         var _loc13_:int = 0;
         while(_loc13_ < var_171.length)
         {
            _loc14_ = var_171[_loc13_] as PlaneVisualizationLayer;
            _loc15_ = var_171[_loc13_] as PlaneVisualizationAnimationLayer;
            if(_loc14_ != null)
            {
               _loc14_.render(param1,param2,param3,param4,param5);
            }
            else if(_loc15_ != null)
            {
               _loc15_.render(param1,param2,param3,param4,param6,param7,param8,param9,param10,param11,param12);
            }
            _loc13_++;
         }
         if(param1 != null && param1 != var_26)
         {
            var_26.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
            return param1;
         }
         return var_26;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_171 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_171.length)
            {
               _loc2_ = var_171[_loc1_] as IDisposable;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_171 = null;
         }
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_26 != null)
         {
            var_26.dispose();
         }
         if(var_778 != null)
         {
            var_778 = null;
         }
      }
   }
}
