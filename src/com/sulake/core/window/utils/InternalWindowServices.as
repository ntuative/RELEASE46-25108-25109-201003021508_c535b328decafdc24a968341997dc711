package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_119:DisplayObject;
      
      private var var_2308:uint;
      
      private var var_873:IWindowToolTipAgentService;
      
      private var var_872:IWindowMouseScalingService;
      
      private var var_223:IWindowContext;
      
      private var var_870:IWindowFocusManagerService;
      
      private var var_871:IWindowMouseListenerService;
      
      private var var_874:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2308 = 0;
         var_119 = param2;
         var_223 = param1;
         var_874 = new WindowMouseDragger(param2);
         var_872 = new WindowMouseScaler(param2);
         var_871 = new WindowMouseListener(param2);
         var_870 = new FocusManager(param2);
         var_873 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_872;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_870;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_873;
      }
      
      public function dispose() : void
      {
         if(var_874 != null)
         {
            var_874.dispose();
            var_874 = null;
         }
         if(var_872 != null)
         {
            var_872.dispose();
            var_872 = null;
         }
         if(var_871 != null)
         {
            var_871.dispose();
            var_871 = null;
         }
         if(var_870 != null)
         {
            var_870.dispose();
            var_870 = null;
         }
         if(var_873 != null)
         {
            var_873.dispose();
            var_873 = null;
         }
         var_223 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_871;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_874;
      }
   }
}
