package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_423:uint;
      
      private var var_1064:IUnknown;
      
      private var var_1307:String;
      
      private var var_1063:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1063 = param1;
         var_1307 = getQualifiedClassName(var_1063);
         var_1064 = param2;
         var_423 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1063;
      }
      
      public function get disposed() : Boolean
      {
         return var_1064 == null;
      }
      
      public function get references() : uint
      {
         return var_423;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_423) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1064;
      }
      
      public function get iis() : String
      {
         return var_1307;
      }
      
      public function reserve() : uint
      {
         return ++var_423;
      }
      
      public function dispose() : void
      {
         var_1063 = null;
         var_1307 = null;
         var_1064 = null;
         var_423 = 0;
      }
   }
}
