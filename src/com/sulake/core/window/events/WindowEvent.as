package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_303:String = "WE_CHILD_RESIZED";
      
      public static const const_1345:String = "WE_CLOSE";
      
      public static const const_1141:String = "WE_DESTROY";
      
      public static const const_141:String = "WE_CHANGE";
      
      public static const const_1263:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1450:String = "WE_PARENT_RESIZE";
      
      public static const const_88:String = "WE_UPDATE";
      
      public static const const_1245:String = "WE_MAXIMIZE";
      
      public static const const_411:String = "WE_DESTROYED";
      
      public static const const_956:String = "WE_UNSELECT";
      
      public static const const_1170:String = "WE_MAXIMIZED";
      
      public static const const_1542:String = "WE_UNLOCKED";
      
      public static const const_379:String = "WE_CHILD_REMOVED";
      
      public static const const_164:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1247:String = "WE_ACTIVATE";
      
      public static const const_232:String = "WE_ENABLED";
      
      public static const const_442:String = "WE_CHILD_RELOCATED";
      
      public static const const_1252:String = "WE_CREATE";
      
      public static const const_659:String = "WE_SELECT";
      
      public static const const_174:String = "";
      
      public static const const_1586:String = "WE_LOCKED";
      
      public static const const_1497:String = "WE_PARENT_RELOCATE";
      
      public static const const_1594:String = "WE_CHILD_REMOVE";
      
      public static const const_1516:String = "WE_CHILD_RELOCATE";
      
      public static const const_1538:String = "WE_LOCK";
      
      public static const const_185:String = "WE_FOCUSED";
      
      public static const const_543:String = "WE_UNSELECTED";
      
      public static const const_864:String = "WE_DEACTIVATED";
      
      public static const const_1283:String = "WE_MINIMIZED";
      
      public static const const_1552:String = "WE_ARRANGED";
      
      public static const const_1547:String = "WE_UNLOCK";
      
      public static const const_1455:String = "WE_ATTACH";
      
      public static const const_1190:String = "WE_OPEN";
      
      public static const const_1281:String = "WE_RESTORE";
      
      public static const const_1563:String = "WE_PARENT_RELOCATED";
      
      public static const const_1324:String = "WE_RELOCATE";
      
      public static const const_1584:String = "WE_CHILD_RESIZE";
      
      public static const const_1534:String = "WE_ARRANGE";
      
      public static const const_1336:String = "WE_OPENED";
      
      public static const const_1237:String = "WE_CLOSED";
      
      public static const const_1494:String = "WE_DETACHED";
      
      public static const const_1429:String = "WE_UPDATED";
      
      public static const const_1149:String = "WE_UNFOCUSED";
      
      public static const const_465:String = "WE_RELOCATED";
      
      public static const const_1368:String = "WE_DEACTIVATE";
      
      public static const const_195:String = "WE_DISABLED";
      
      public static const const_687:String = "WE_CANCEL";
      
      public static const const_707:String = "WE_ENABLE";
      
      public static const const_1271:String = "WE_ACTIVATED";
      
      public static const const_1305:String = "WE_FOCUS";
      
      public static const const_1504:String = "WE_DETACH";
      
      public static const const_1156:String = "WE_RESTORED";
      
      public static const const_1146:String = "WE_UNFOCUS";
      
      public static const const_50:String = "WE_SELECTED";
      
      public static const const_1349:String = "WE_PARENT_RESIZED";
      
      public static const const_1362:String = "WE_CREATED";
      
      public static const const_1527:String = "WE_ATTACHED";
      
      public static const const_1373:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1588:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1366:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1588 = param3;
         var_1366 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1366;
      }
      
      public function get related() : IWindow
      {
         return var_1588;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1366 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
