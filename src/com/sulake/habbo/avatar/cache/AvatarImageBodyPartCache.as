package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import flash.utils.getTimer;
   
   public class AvatarImageBodyPartCache
   {
       
      
      private var var_140:Map;
      
      private var var_1800:int;
      
      private var var_660:IActiveActionData;
      
      public function AvatarImageBodyPartCache()
      {
         super();
         var_140 = new Map();
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getDirection() : int
      {
         return var_1800;
      }
      
      public function getAction() : IActiveActionData
      {
         return var_660;
      }
      
      public function updateActionCache(param1:IActiveActionData, param2:AvatarImageActionCache) : void
      {
         var_140.add(param1.id,param2);
      }
      
      public function getActionCache(param1:IActiveActionData = null) : AvatarImageActionCache
      {
         if(param1 == null)
         {
            param1 = var_660;
         }
         return var_140.getValue(param1.id) as AvatarImageActionCache;
      }
      
      public function setAction(param1:IActiveActionData) : void
      {
         if(var_660 == null)
         {
            var_660 = param1;
         }
         var _loc2_:AvatarImageActionCache = getActionCache(var_660);
         if(_loc2_ != null)
         {
            _loc2_.setLastAccessTime();
         }
         var_660 = param1;
      }
      
      public function setDirection(param1:int) : void
      {
         var_1800 = param1;
      }
      
      public function disposeActions(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(var_140 == null)
         {
            return;
         }
         var _loc2_:int = getTimer();
         var _loc3_:Array = var_140.getKeys();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = var_140.getValue(_loc4_) as AvatarImageActionCache;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.getLastAccessTime();
               if(_loc2_ - _loc6_ >= param1)
               {
                  debugInfo("[Disposing inactive: " + _loc4_ + "]");
                  _loc5_.dispose();
                  var_140.remove(_loc4_);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         if(var_140 == null)
         {
            return;
         }
         Logger.log("[dispose]");
         var_140.dispose();
      }
   }
}
