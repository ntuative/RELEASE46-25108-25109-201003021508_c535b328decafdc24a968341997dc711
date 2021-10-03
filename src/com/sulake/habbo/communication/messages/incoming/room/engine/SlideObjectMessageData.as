package com.sulake.habbo.communication.messages.incoming.room.engine
{
   import com.sulake.room.utils.Vector3d;
   
   public class SlideObjectMessageData
   {
      
      public static const const_1016:String = "mv";
      
      public static const const_999:String = "sld";
       
      
      private var var_73:Vector3d;
      
      private var var_1298:String;
      
      private var var_205:Boolean = false;
      
      private var _target:Vector3d;
      
      private var _id:int = 0;
      
      public function SlideObjectMessageData(param1:int, param2:Vector3d, param3:Vector3d, param4:String = null)
      {
         super();
         _id = param1;
         var_73 = param2;
         _target = param3;
         var_1298 = param4;
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function set moveType(param1:String) : void
      {
         if(!var_205)
         {
            var_1298 = param1;
         }
      }
      
      public function get loc() : Vector3d
      {
         return var_73;
      }
      
      public function set target(param1:Vector3d) : void
      {
         if(!var_205)
         {
            _target = param1;
         }
      }
      
      public function set loc(param1:Vector3d) : void
      {
         if(!var_205)
         {
            var_73 = param1;
         }
      }
      
      public function get target() : Vector3d
      {
         return _target;
      }
      
      public function get moveType() : String
      {
         return var_1298;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
