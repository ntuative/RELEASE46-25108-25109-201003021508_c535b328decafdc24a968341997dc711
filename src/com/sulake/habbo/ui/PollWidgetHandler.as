package com.sulake.habbo.ui
{
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPollUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPollMessage;
   import flash.events.Event;
   
   public class PollWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _disposed:Boolean = false;
      
      public function PollWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_288;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetPollMessage.ANSWER,RoomWidgetPollMessage.const_441,RoomWidgetPollMessage.const_571];
      }
      
      public function update() : void
      {
         _container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         if(_container == null || true)
         {
            return;
         }
         var _loc2_:RoomSessionPollEvent = param1 as RoomSessionPollEvent;
         if(_loc2_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionPollEvent.const_102:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_102);
               _loc3_.summary = _loc2_.summary;
               break;
            case RoomSessionPollEvent.const_58:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_58);
               _loc3_.summary = _loc2_.summary;
               break;
            case RoomSessionPollEvent.const_113:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_113);
               _loc3_.startMessage = _loc2_.startMessage;
               _loc3_.endMessage = _loc2_.endMessage;
               _loc3_.numQuestions = _loc2_.numQuestions;
               _loc3_.questionArray = _loc2_.questionArray;
         }
         if(_loc3_ == null)
         {
            return;
         }
         _container.events.dispatchEvent(_loc3_);
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:RoomWidgetPollMessage = param1 as RoomWidgetPollMessage;
         if(_loc2_ == null)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetPollMessage.const_571:
               _container.roomSession.sendPollStartMessage(_loc2_.id);
               break;
            case RoomWidgetPollMessage.const_441:
               _container.roomSession.sendPollRejectMessage(_loc2_.id);
               break;
            case RoomWidgetPollMessage.ANSWER:
               _container.roomSession.sendPollAnswerMessage(_loc2_.id,_loc2_.questionId,_loc2_.answers);
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomSessionPollEvent.const_102);
         _loc1_.push(RoomSessionPollEvent.const_58);
         _loc1_.push(RoomSessionPollEvent.const_113);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         _container = null;
      }
   }
}
