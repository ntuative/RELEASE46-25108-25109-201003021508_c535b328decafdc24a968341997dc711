package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_73:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_218:Vector3d = null;
      
      private var var_2053:int = 0;
      
      private var var_2095:String = null;
      
      private var _category:int = 0;
      
      private var var_2094:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2094 = param3;
         var_73 = new Vector3d();
         var_73.assign(param4);
         var_218 = new Vector3d();
         var_218.assign(param5);
         var_2053 = param6;
         var_2095 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_73;
      }
      
      public function get typeId() : int
      {
         return var_2053;
      }
      
      public function get dir() : Vector3d
      {
         return var_218;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2095;
      }
      
      public function get operation() : String
      {
         return var_2094;
      }
      
      public function dispose() : void
      {
         var_73 = null;
         var_218 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
