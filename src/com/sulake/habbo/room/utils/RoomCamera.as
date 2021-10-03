package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_340:Number = 0.5;
      
      private static const const_761:int = 3;
      
      private static const const_1065:Number = 1;
       
      
      private var var_1902:Boolean = false;
      
      private var var_1904:Boolean = false;
      
      private var var_1001:int = 0;
      
      private var var_259:Vector3d = null;
      
      private var var_1898:int = 0;
      
      private var var_1903:int = 0;
      
      private var var_1907:Boolean = false;
      
      private var var_1906:int = -2;
      
      private var var_1905:Boolean = false;
      
      private var var_1899:int = 0;
      
      private var var_1900:int = -1;
      
      private var var_388:Vector3d = null;
      
      private var var_1901:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1898;
      }
      
      public function get targetId() : int
      {
         return var_1900;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1899 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1898 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1902 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1900 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1904 = param1;
      }
      
      public function dispose() : void
      {
         var_388 = null;
         var_259 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_388 == null)
         {
            var_388 = new Vector3d();
         }
         var_388.assign(param1);
         var_1001 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1906;
      }
      
      public function get screenHt() : int
      {
         return var_1901;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1903 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_259;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1901 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1899;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1902;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1904;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_388 != null && var_259 != null)
         {
            ++var_1001;
            _loc2_ = Vector3d.dif(var_388,var_259);
            if(_loc2_.length <= const_340)
            {
               var_259 = var_388;
               var_388 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_340 * (const_761 + 1))
               {
                  _loc2_.mul(const_340);
               }
               else if(var_1001 <= const_761)
               {
                  _loc2_.mul(const_340);
               }
               else
               {
                  _loc2_.mul(const_1065);
               }
               var_259 = Vector3d.sum(var_259,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1907 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1903;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1905 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1906 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_259 != null)
         {
            return;
         }
         var_259 = new Vector3d();
         var_259.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1907;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1905;
      }
   }
}
