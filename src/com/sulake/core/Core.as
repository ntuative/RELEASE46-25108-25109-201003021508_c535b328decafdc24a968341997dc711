package com.sulake.core
{
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   
   public final class Core
   {
      
      public static const const_618:int = 4;
      
      private static var _instance:ICore;
      
      public static const const_1232:int = 6;
      
      public static const const_913:uint = 1;
      
      public static const const_1360:int = 99;
      
      public static const const_1183:int = 7;
      
      public static const const_1134:uint = 2;
      
      public static const const_1219:uint = 7;
      
      public static const const_908:int = 1;
      
      public static const CORE_SETUP_DEBUG:uint = 7;
      
      public static const const_833:int = 10;
      
      public static const const_1334:int = 5;
      
      public static const const_1322:int = 2;
      
      public static const const_11:int = 9;
      
      public static const const_560:int = 30;
      
      public static const const_1274:uint = 0;
      
      public static const const_1151:int = 3;
      
      public static const const_1264:int = 20;
       
      
      public function Core()
      {
         super();
      }
      
      public static function crash(param1:String, param2:int, param3:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,true,param2,param3);
         }
      }
      
      public static function get instance() : ICore
      {
         return _instance;
      }
      
      public static function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,param2,param3,param4);
         }
      }
      
      public static function get version() : String
      {
         return "0.0.2";
      }
      
      public static function dispose() : void
      {
         if(_instance != null)
         {
            _instance.dispose();
            _instance = null;
         }
      }
      
      public static function instantiate(param1:DisplayObjectContainer, param2:uint) : ICore
      {
         if(_instance == null)
         {
            _instance = new CoreComponent(param1,param2);
         }
         return _instance;
      }
   }
}
