package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1043:int = 31;
      
      private static const const_1042:int = 32;
      
      private static const const_489:int = 30;
      
      private static const const_746:int = 20;
      
      private static const const_488:int = 10;
       
      
      private var var_596:Boolean = false;
      
      private var var_222:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_222 = new Array();
         super();
         super.setAnimation(const_489);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_596 = true;
            var_222 = new Array();
            var_222.push(const_1043);
            var_222.push(const_1042);
            return;
         }
         if(param1 > 0 && param1 <= const_488)
         {
            if(var_596)
            {
               var_596 = false;
               var_222 = new Array();
               if(_direction == 2)
               {
                  var_222.push(const_746 + 5 - param1);
                  var_222.push(const_488 + 5 - param1);
               }
               else
               {
                  var_222.push(const_746 + param1);
                  var_222.push(const_488 + param1);
               }
               var_222.push(const_489);
               return;
            }
            super.setAnimation(const_489);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
