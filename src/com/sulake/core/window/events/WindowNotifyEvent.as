package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1267:String = "WN_CREATED";
      
      public static const const_1007:String = "WN_DISABLE";
      
      public static const const_985:String = "WN_DEACTIVATED";
      
      public static const const_995:String = "WN_OPENED";
      
      public static const const_937:String = "WN_CLOSED";
      
      public static const const_884:String = "WN_DESTROY";
      
      public static const const_1530:String = "WN_ARRANGED";
      
      public static const const_445:String = "WN_PARENT_RESIZED";
      
      public static const const_801:String = "WN_ENABLE";
      
      public static const const_906:String = "WN_RELOCATE";
      
      public static const const_851:String = "WN_FOCUS";
      
      public static const const_997:String = "WN_PARENT_RELOCATED";
      
      public static const const_428:String = "WN_PARAM_UPDATED";
      
      public static const const_589:String = "WN_PARENT_ACTIVATED";
      
      public static const const_198:String = "WN_RESIZED";
      
      public static const const_900:String = "WN_CLOSE";
      
      public static const const_1003:String = "WN_PARENT_REMOVED";
      
      public static const const_241:String = "WN_CHILD_RELOCATED";
      
      public static const const_623:String = "WN_ENABLED";
      
      public static const const_272:String = "WN_CHILD_RESIZED";
      
      public static const const_941:String = "WN_MINIMIZED";
      
      public static const const_653:String = "WN_DISABLED";
      
      public static const const_213:String = "WN_CHILD_ACTIVATED";
      
      public static const const_382:String = "WN_STATE_UPDATED";
      
      public static const const_607:String = "WN_UNSELECTED";
      
      public static const const_455:String = "WN_STYLE_UPDATED";
      
      public static const const_1432:String = "WN_UPDATE";
      
      public static const const_459:String = "WN_PARENT_ADDED";
      
      public static const const_634:String = "WN_RESIZE";
      
      public static const const_672:String = "WN_CHILD_REMOVED";
      
      public static const const_1510:String = "";
      
      public static const const_837:String = "WN_RESTORED";
      
      public static const const_330:String = "WN_SELECTED";
      
      public static const const_957:String = "WN_MINIMIZE";
      
      public static const const_910:String = "WN_FOCUSED";
      
      public static const const_1351:String = "WN_LOCK";
      
      public static const const_289:String = "WN_CHILD_ADDED";
      
      public static const const_807:String = "WN_UNFOCUSED";
      
      public static const const_429:String = "WN_RELOCATED";
      
      public static const const_907:String = "WN_DEACTIVATE";
      
      public static const const_1209:String = "WN_CRETAE";
      
      public static const const_799:String = "WN_RESTORE";
      
      public static const const_309:String = "WN_ACTVATED";
      
      public static const const_1189:String = "WN_LOCKED";
      
      public static const const_396:String = "WN_SELECT";
      
      public static const const_918:String = "WN_MAXIMIZE";
      
      public static const const_932:String = "WN_OPEN";
      
      public static const const_513:String = "WN_UNSELECT";
      
      public static const const_1523:String = "WN_ARRANGE";
      
      public static const const_1240:String = "WN_UNLOCKED";
      
      public static const const_1569:String = "WN_UPDATED";
      
      public static const const_834:String = "WN_ACTIVATE";
      
      public static const const_1331:String = "WN_UNLOCK";
      
      public static const const_892:String = "WN_MAXIMIZED";
      
      public static const const_954:String = "WN_DESTROYED";
      
      public static const const_797:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1588,cancelable);
      }
   }
}
