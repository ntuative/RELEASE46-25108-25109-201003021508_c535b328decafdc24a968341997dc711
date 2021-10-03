package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1050:Boolean;
      
      private var var_1052:Boolean;
      
      private var var_1051:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1050;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1052;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1051 = param1.readBoolean();
         var_1052 = param1.readBoolean();
         var_1050 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1051;
      }
      
      public function flush() : Boolean
      {
         var_1051 = false;
         var_1052 = false;
         var_1050 = false;
         return true;
      }
   }
}
