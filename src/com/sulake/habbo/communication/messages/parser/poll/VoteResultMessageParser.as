package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1317:int;
      
      private var var_1074:String;
      
      private var var_738:Array;
      
      private var var_1042:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_738.slice();
      }
      
      public function flush() : Boolean
      {
         var_1074 = "";
         var_1042 = [];
         var_738 = [];
         var_1317 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1317;
      }
      
      public function get question() : String
      {
         return var_1074;
      }
      
      public function get choices() : Array
      {
         return var_1042.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1074 = param1.readString();
         var_1042 = [];
         var_738 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1042.push(param1.readString());
            var_738.push(param1.readInteger());
            _loc3_++;
         }
         var_1317 = param1.readInteger();
         return true;
      }
   }
}
