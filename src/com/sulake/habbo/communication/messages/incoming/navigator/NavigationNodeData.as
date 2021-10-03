package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1228:int;
      
      private var var_1529:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1228 = param1;
         var_1529 = param2;
         Logger.log("READ NODE: " + var_1228 + ", " + var_1529);
      }
      
      public function get nodeName() : String
      {
         return var_1529;
      }
      
      public function get nodeId() : int
      {
         return var_1228;
      }
   }
}
