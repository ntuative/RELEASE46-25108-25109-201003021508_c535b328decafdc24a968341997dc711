package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_318:Timer;
      
      protected var var_927:String;
      
      protected var var_926:uint;
      
      protected var var_1096:Point;
      
      protected var var_241:IToolTipWindow;
      
      protected var var_1097:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1096 = new Point();
         var_1097 = new Point(20,20);
         var_926 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_318 != null)
         {
            var_318.stop();
            var_318.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_318 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function method_3(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1096);
            if(var_241 != null && true)
            {
               var_241.x = param1 + var_1097.x;
               var_241.y = param2 + var_1097.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_318 != null)
         {
            var_318.reset();
         }
         if(_window && true)
         {
            if(var_241 == null || false)
            {
               var_241 = _window.context.create("undefined::ToolTip",var_927,WindowType.const_284,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_241.x = _loc2_.x + var_1096.x + var_1097.x;
            var_241.y = _loc2_.y + var_1096.y + var_1097.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_927 = IInteractiveWindow(param1).toolTipCaption;
               var_926 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_927 = param1.caption;
               var_926 = 500;
            }
            _mouse.x = var_119.mouseX;
            _mouse.y = var_119.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1096);
            if(var_927 != null && var_927 != "")
            {
               if(var_318 == null)
               {
                  var_318 = new Timer(var_926,1);
                  var_318.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_318.reset();
               var_318.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_241 != null && true)
         {
            var_241.destroy();
            var_241 = null;
         }
      }
   }
}
