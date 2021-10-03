package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2161:int;
      
      private var var_1301:String = "";
      
      private var var_1062:int;
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1301 = param1;
      }
      
      public function get topicIndex() : int
      {
         return var_2161;
      }
      
      public function set topicIndex(param1:int) : void
      {
         var_2161 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1301;
      }
      
      public function flush() : void
      {
         var_1062 = 0;
         var_1301 = "";
      }
      
      public function get userSelected() : Boolean
      {
         return var_1062 > 0;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1062 = param1;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function get reportedUserId() : int
      {
         return var_1062;
      }
   }
}
