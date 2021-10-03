package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_55:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_55 = new IssueMessageData();
         var_55.issueId = param1.readInteger();
         var_55.state = param1.readInteger();
         var_55.categoryId = param1.readInteger();
         var_55.reportedCategoryId = param1.readInteger();
         var_55.timeStamp = getTimer() - param1.readInteger();
         var_55.priority = param1.readInteger();
         var_55.reporterUserId = param1.readInteger();
         var_55.reporterUserName = param1.readString();
         var_55.reportedUserId = param1.readInteger();
         var_55.reportedUserName = param1.readString();
         var_55.pickerUserId = param1.readInteger();
         var_55.pickerUserName = param1.readString();
         var_55.message = param1.readString();
         var_55.chatRecordId = param1.readInteger();
         var_55.roomName = param1.readString();
         var_55.roomType = param1.readInteger();
         if(false)
         {
            var_55.roomResources = param1.readString();
            var_55.unitPort = param1.readInteger();
            var_55.worldId = param1.readInteger();
         }
         if(false)
         {
            var_55.flatType = param1.readString();
            var_55.flatId = param1.readInteger();
            var_55.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return var_55;
      }
      
      public function flush() : Boolean
      {
         var_55 = null;
         return true;
      }
   }
}
