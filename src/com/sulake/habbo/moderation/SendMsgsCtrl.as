package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1249:String;
      
      private var _disposed:Boolean;
      
      private var var_1458:String;
      
      private var var_1250:int;
      
      private var var_49:ModerationManager;
      
      private var var_793:IDropMenuWindow;
      
      private var var_399:ITextFieldWindow;
      
      private var var_53:IFrameWindow;
      
      private var var_309:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_49 = param1;
         var_1250 = param2;
         var_1458 = param3;
         var_1249 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_185)
         {
            return;
         }
         if(!var_309)
         {
            return;
         }
         var_399.text = "";
         var_309 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_53;
      }
      
      public function getId() : String
      {
         return var_1458;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_309 || false)
         {
            var_49.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_49.connection.send(new ModMessageMessageComposer(var_1250,var_399.text,var_1249));
         this.dispose();
      }
      
      public function show() : void
      {
         var_53 = IFrameWindow(var_49.getXmlWindow("send_msgs"));
         var_53.caption = "Msg To: " + var_1458;
         var_53.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_399 = ITextFieldWindow(var_53.findChildByName("message_input"));
         var_399.procedure = onInputClick;
         var_793 = IDropMenuWindow(var_53.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_793);
         var_793.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_53.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_53.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_49.initMsg.messageTemplates.length);
         param1.populate(var_49.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_53 != null)
         {
            var_53.destroy();
            var_53 = null;
         }
         var_793 = null;
         var_399 = null;
         var_49 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_50)
         {
            return;
         }
         var _loc3_:String = var_49.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_309 = false;
            var_399.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1226;
      }
   }
}
