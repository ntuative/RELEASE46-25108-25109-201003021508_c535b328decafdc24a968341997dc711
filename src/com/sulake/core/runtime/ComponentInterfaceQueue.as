package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1111:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_753:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1111 = param1;
         var_753 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_753;
      }
      
      public function get identifier() : IID
      {
         return var_1111;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1111 = null;
            while(false)
            {
               var_753.pop();
            }
            var_753 = null;
         }
      }
   }
}
