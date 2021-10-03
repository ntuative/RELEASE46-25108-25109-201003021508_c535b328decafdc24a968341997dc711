package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1436:String;
      
      private var var_1491:String;
      
      private var var_1033:String;
      
      private var var_410:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1436 = String(param1.@align);
         var_1033 = String(param1.@base);
         var_1491 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_410 = Number(_loc2_);
            if(var_410 > 1)
            {
               var_410 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1436;
      }
      
      public function get ink() : String
      {
         return var_1491;
      }
      
      public function get base() : String
      {
         return var_1033;
      }
      
      public function get isBlended() : Boolean
      {
         return var_410 != 1;
      }
      
      public function get blend() : Number
      {
         return var_410;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
