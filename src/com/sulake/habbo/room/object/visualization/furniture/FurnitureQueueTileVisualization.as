package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1101:int = 1;
      
      private static const const_1042:int = 3;
      
      private static const const_1103:int = 2;
      
      private static const const_1102:int = 15;
       
      
      private var var_879:int;
      
      private var var_222:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1103)
         {
            var_222 = new Array();
            var_222.push(const_1101);
            var_879 = const_1102;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_879 > 0)
         {
            --var_879;
         }
         if(var_879 == 0)
         {
            if(false)
            {
               super.setAnimation(var_222.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
