package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1042:int = -1;
      
      private static const const_746:int = 20;
      
      private static const const_488:int = 9;
       
      
      private var var_596:Boolean = false;
      
      private var var_222:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_596 = true;
            var_222 = new Array();
            var_222.push(const_1042);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_596)
            {
               var_596 = false;
               var_222 = new Array();
               var_222.push(const_746);
               var_222.push(const_488 + param1);
               var_222.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
