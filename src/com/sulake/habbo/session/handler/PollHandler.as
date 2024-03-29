package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.incoming.poll.PollContentsEvent;
   import com.sulake.habbo.communication.messages.incoming.poll.PollErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.poll.PollOfferEvent;
   import com.sulake.habbo.communication.messages.parser.poll.PollContentsParser;
   import com.sulake.habbo.communication.messages.parser.poll.PollErrorParser;
   import com.sulake.habbo.communication.messages.parser.poll.PollOfferParser;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   
   public class PollHandler extends BaseHandler
   {
       
      
      public function PollHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(!param1)
         {
            return;
         }
         param1.addMessageEvent(new PollContentsEvent(onPollContentsEvent));
         param1.addMessageEvent(new PollOfferEvent(onPollOfferEvent));
         param1.addMessageEvent(new PollErrorEvent(onPollErrorEvent));
      }
      
      private function onPollErrorEvent(param1:PollErrorEvent) : void
      {
         var _loc4_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,var_35);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:PollErrorParser = param1.getParser();
         _loc4_ = new RoomSessionPollEvent(RoomSessionPollEvent.const_58,_loc2_,-1);
         _loc4_.summary = "???";
         listener.events.dispatchEvent(_loc4_);
      }
      
      private function onPollContentsEvent(param1:PollContentsEvent) : void
      {
         var _loc4_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,var_35);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:PollContentsParser = param1.getParser();
         _loc4_ = new RoomSessionPollEvent(RoomSessionPollEvent.const_113,_loc2_,_loc3_.id);
         _loc4_.startMessage = _loc3_.startMessage;
         _loc4_.endMessage = _loc3_.endMessage;
         _loc4_.numQuestions = _loc3_.numQuestions;
         _loc4_.questionArray = _loc3_.questionArray;
         listener.events.dispatchEvent(_loc4_);
      }
      
      private function onPollOfferEvent(param1:PollOfferEvent) : void
      {
         var _loc4_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,var_35);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:PollOfferParser = param1.getParser();
         _loc4_ = new RoomSessionPollEvent(RoomSessionPollEvent.const_102,_loc2_,_loc3_.id);
         _loc4_.summary = _loc3_.summary;
         listener.events.dispatchEvent(_loc4_);
      }
   }
}
