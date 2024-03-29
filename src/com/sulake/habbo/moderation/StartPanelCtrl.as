package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.navigator.PublicSpaceCastLibsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   
   public class StartPanelCtrl implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1318:Boolean;
      
      private var var_49:ModerationManager;
      
      private var _userId:int;
      
      private var var_53:IFrameWindow;
      
      private var _roomId:int;
      
      public function StartPanelCtrl(param1:ModerationManager)
      {
         super();
         var_49 = param1;
      }
      
      public function userSelected(param1:int, param2:String) : void
      {
         if(var_53 == null)
         {
            return;
         }
         _userId = param1;
         var _loc3_:IButtonWindow = IButtonWindow(var_53.findChildByName("userinfo_but"));
         _loc3_.enable();
         _loc3_.caption = "User info: " + param2;
      }
      
      private function onUserinfoButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_49.windowTracker.show(new UserInfoFrameCtrl(var_49,_userId),var_53,false,false,true);
      }
      
      public function publicSpaceEntered(param1:PublicSpaceCastLibsMessageParser) : void
      {
         if(var_53 == null || param1 == null)
         {
            return;
         }
         var_53.findChildByName("room_tool_but").disable();
         enableChatlogButton();
         var_1318 = false;
         _roomId = param1.nodeId;
      }
      
      private function onChatlogButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_49.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(!!var_1318 ? 0 : 1,_roomId),var_49,WindowTracker.const_604,_roomId),var_53,false,false,true);
      }
      
      public function guestRoomEntered(param1:RoomEntryInfoMessageParser) : void
      {
         if(var_53 == null || param1 == null)
         {
            return;
         }
         var_53.findChildByName("room_tool_but").enable();
         enableChatlogButton();
         var_1318 = true;
         _roomId = param1.guestRoomId;
      }
      
      private function onTicketQueueButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_49.issueManager.init();
      }
      
      private function onRoomToolButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_49.windowTracker.show(new RoomToolCtrl(var_49,_roomId),var_53,false,false,true);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_49 = null;
            if(var_53)
            {
               var_53.dispose();
               var_53 = null;
            }
         }
      }
      
      public function roomExited() : void
      {
         if(var_53 == null)
         {
            return;
         }
         var_53.findChildByName("room_tool_but").disable();
         var_53.findChildByName("chatlog_but").disable();
      }
      
      private function enableChatlogButton() : void
      {
         if(var_49.initMsg.chatlogsPermission)
         {
            var_53.findChildByName("chatlog_but").enable();
         }
      }
      
      public function show() : void
      {
         if(var_53 == null)
         {
            var_53 = IFrameWindow(var_49.getXmlWindow("start_panel"));
            var_53.findChildByName("room_tool_but").procedure = onRoomToolButton;
            var_53.findChildByName("chatlog_but").procedure = onChatlogButton;
            var_53.findChildByName("ticket_queue_but").procedure = onTicketQueueButton;
            var_53.findChildByName("userinfo_but").procedure = onUserinfoButton;
            var_53.findChildByName("userinfo_but").disable();
            var_53.findChildByName("room_tool_but").disable();
            var_53.findChildByName("chatlog_but").disable();
            var_49.disableButton(var_49.initMsg.cfhPermission,var_53,"ticket_queue_but");
            var_49.disableButton(var_49.initMsg.chatlogsPermission,var_53,"chatlog_but");
         }
         var_53.visible = true;
      }
   }
}
