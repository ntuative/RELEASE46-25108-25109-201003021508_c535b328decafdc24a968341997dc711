package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_716:int = -1;
      
      public static const const_987:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2027:int = -1;
      
      private var var_85:int = 0;
      
      private var var_1236:int = 1;
      
      private var var_841:int = 1;
      
      private var var_2026:Boolean = false;
      
      private var var_2028:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_2026 = param5;
         if(param4 < 0)
         {
            param4 = const_716;
         }
         var_841 = param4;
         var_1236 = param4;
         if(param6 >= 0)
         {
            var_2027 = param6;
            var_2028 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_841 > 0 && param1 > var_841)
         {
            param1 = var_841;
         }
         var_1236 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_841;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2028;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_841 < 0)
         {
            return const_716;
         }
         return var_1236;
      }
      
      public function get activeSequence() : int
      {
         return var_2027;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2026;
      }
      
      public function get x() : int
      {
         return var_85;
      }
   }
}
