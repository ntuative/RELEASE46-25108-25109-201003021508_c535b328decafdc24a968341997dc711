package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_104:String = "RWPUE_VOTE_RESULT";
      
      public static const const_127:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1317:int;
      
      private var var_1074:String;
      
      private var var_738:Array;
      
      private var var_1042:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1074 = param2;
         var_1042 = param3;
         var_738 = param4;
         if(var_738 == null)
         {
            var_738 = [];
         }
         var_1317 = param5;
      }
      
      public function get votes() : Array
      {
         return var_738.slice();
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
   }
}
