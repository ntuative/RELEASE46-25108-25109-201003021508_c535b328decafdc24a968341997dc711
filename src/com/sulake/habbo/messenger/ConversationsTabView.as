package com.sulake.habbo.messenger
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.messenger.domain.Conversation;
   
   public class ConversationsTabView
   {
       
      
      private var var_780:IWindowContainer;
      
      private var var_1158:int = 30;
      
      private var var_20:IWindowContainer;
      
      private var var_123:HabboMessenger;
      
      public function ConversationsTabView(param1:HabboMessenger, param2:IFrameWindow)
      {
         super();
         var_123 = param1;
         var_20 = IWindowContainer(param2.findChildByName("content"));
         var_780 = IWindowContainer(param2.findChildByName("conversationstab"));
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_20.findChildByName("convo_bg"));
         _loc3_.bitmap = var_123.getButtonImage("convo_bg");
      }
      
      private function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      public function refresh() : void
      {
         var _loc3_:Boolean = false;
         var _loc1_:Array = var_123.conversations.openConversations;
         var _loc2_:int = 0;
         while(_loc2_ < getTabCount())
         {
            refreshTabContent(_loc2_,_loc1_[var_123.conversations.startIndex + _loc2_]);
            _loc2_++;
         }
         while(true)
         {
            _loc3_ = refreshTabContent(_loc2_,null);
            if(_loc3_)
            {
               break;
            }
            _loc2_++;
         }
         if(hasPrevButton())
         {
            refreshAsArrow(0,false);
         }
         if(hasNextButton())
         {
            refreshAsArrow(getTabCount() - 1,true);
         }
      }
      
      private function hasPrevButton() : Boolean
      {
         return var_123.conversations.startIndex > 0;
      }
      
      private function refreshTabBg(param1:IWindowContainer, param2:int, param3:String) : void
      {
         var_123.refreshButton(param1,param3,true,onTabClick,param2);
      }
      
      public function getTabCount() : int
      {
         return Math.floor(0 / var_1158);
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(_loc3_ == 0 && hasPrevButton())
         {
            var_123.conversations.changeStartIndex(-1);
         }
         else if(_loc3_ == getTabCount() - 1 && hasNextButton())
         {
            var_123.conversations.changeStartIndex(1);
         }
         else
         {
            _loc4_ = param2.name == HabboMessenger.const_157 ? var_123.conversations.findConversation(param2.id) : var_123.conversations.openConversations[_loc3_ + var_123.conversations.startIndex];
            if(_loc4_ == null)
            {
               return;
            }
            var_123.conversations.setSelected(_loc4_);
         }
         var_123.messengerView.refresh(true);
      }
      
      private function refreshArrow(param1:IWindowContainer, param2:int, param3:Boolean) : void
      {
         var_123.refreshButton(param1,!!param3 ? "next" : "prev",true,null,0);
      }
      
      private function refreshFigure(param1:IWindowContainer, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.getChildByName(HabboMessenger.const_157) as IBitmapWrapperWindow;
         if(param2 == null || param2 == "")
         {
            _loc3_.visible = false;
         }
         else
         {
            _loc3_.bitmap = var_123.getAvatarFaceBitmap(param2);
            _loc3_.visible = true;
         }
      }
      
      private function hasNextButton() : Boolean
      {
         return var_123.conversations.openConversations.length - var_123.conversations.startIndex > getTabCount();
      }
      
      public function get content() : IWindowContainer
      {
         return var_20;
      }
      
      private function refreshAsArrow(param1:int, param2:Boolean) : void
      {
         var _loc3_:IWindowContainer = var_780.getChildAt(param1) as IWindowContainer;
         hideChildren(_loc3_);
         refreshArrow(_loc3_,param1,param2);
         refreshTabBg(_loc3_,param1,!!param2 ? "tab_bg_next" : "tab_bg_unsel");
         var _loc4_:int = 0 % var_1158;
         _loc3_.width = var_1158 + (!!param2 ? _loc4_ : 0);
      }
      
      private function refreshTabContent(param1:int, param2:Conversation) : Boolean
      {
         var _loc3_:IWindowContainer = var_780.getChildAt(param1) as IWindowContainer;
         if(_loc3_ == null)
         {
            if(param2 == null)
            {
               return true;
            }
            _loc3_ = IWindowContainer(var_123.getXmlWindow("tab_entry"));
            _loc3_.y = 1;
            var_780.addChild(_loc3_);
         }
         hideChildren(_loc3_);
         if(param2 == null)
         {
            return false;
         }
         var _loc4_:String = !!param2.selected ? "tab_bg_sel" : (!!param2.newMessageArrived ? "tab_bg_hilite" : "tab_bg_unsel");
         refreshTabBg(_loc3_,param1,_loc4_);
         refreshFigure(_loc3_,param2.figure);
         _loc3_.x = param1 * var_1158;
         _loc3_.width = var_1158;
         return false;
      }
   }
}
