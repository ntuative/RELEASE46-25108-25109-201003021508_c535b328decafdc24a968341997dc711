package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_766:ConversationsTabView;
      
      private var _disposed:Boolean = false;
      
      private var var_123:HabboMessenger;
      
      private var var_1132:ConversationView;
      
      private var var_12:IFrameWindow;
      
      private var var_374:Timer;
      
      private var var_686:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_123 = param1;
         var_374 = new Timer(300,1);
         var_374.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_12 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1132.addMessage(param2);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_686.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_12.visible = false;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1132.afterResize();
         this.var_766.refresh();
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_123.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_123.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_686.text = "";
         var_123.conversations.addMessageAndUpdateView(new Message(Message.const_520,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_12 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_123.conversations.findSelectedConversation();
         var_12.caption = _loc2_ == null ? "" : _loc2_.name;
         var_766.refresh();
         var_1132.refresh();
         if(var_123.conversations.openConversations.length < 1)
         {
            var_12.visible = false;
            var_123.setHabboToolbarIcon(false,false);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_374)
            {
               var_374.stop();
               var_374.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_374 = null;
            }
            var_123 = null;
            _disposed = true;
         }
      }
      
      public function openMessenger() : void
      {
         if(var_123.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_12 == null)
         {
            prepareContent();
            refresh(true);
            var_123.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.MESSENGER,var_12));
         }
         else
         {
            refresh(true);
            var_12.visible = true;
            var_12.activate();
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_766 == null ? 7 : int(this.var_766.getTabCount());
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_12 != null && false;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_43 || param2 != var_12)
         {
            return;
         }
         if(!this.var_374.running)
         {
            this.var_374.reset();
            this.var_374.start();
         }
      }
      
      public function close() : void
      {
         if(var_12 != null)
         {
            var_12.visible = false;
         }
      }
      
      private function prepareContent() : void
      {
         var_12 = IFrameWindow(var_123.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_12.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_12.procedure = onWindow;
         var_12.title.color = 4294623744;
         var_12.title.textColor = 4287851525;
         var_766 = new ConversationsTabView(var_123,var_12);
         var_766.refresh();
         var_686 = ITextFieldWindow(var_12.findChildByName("message_input"));
         var_686.addEventListener(WindowKeyboardEvent.const_142,onMessageInput);
         var_1132 = new ConversationView(var_123,var_12);
         var_12.scaler.setParamFlag(HabboWindowParam.const_614,false);
         var_12.scaler.setParamFlag(HabboWindowParam.const_855,true);
      }
   }
}
