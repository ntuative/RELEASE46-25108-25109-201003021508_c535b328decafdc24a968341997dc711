package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2009:Boolean;
      
      private var var_1511:Array;
      
      private var var_2010:Boolean;
      
      private var var_2008:Boolean;
      
      private var var_2007:Boolean;
      
      private var var_146:Array;
      
      private var var_2006:Boolean;
      
      private var var_2005:Boolean;
      
      private var var_1510:Array;
      
      private var var_2012:Boolean;
      
      private var var_2011:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2011;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2009;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2010;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2006;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2005;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1511;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_146 = [];
         var_1511 = [];
         _roomMessageTemplates = [];
         var_1510 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_146.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1511.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1510.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2006 = param1.readBoolean();
         var_2007 = param1.readBoolean();
         var_2010 = param1.readBoolean();
         var_2008 = param1.readBoolean();
         var_2011 = param1.readBoolean();
         var_2005 = param1.readBoolean();
         var_2009 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2012 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2008;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1510;
      }
      
      public function get issues() : Array
      {
         return var_146;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2012;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2007;
      }
   }
}
