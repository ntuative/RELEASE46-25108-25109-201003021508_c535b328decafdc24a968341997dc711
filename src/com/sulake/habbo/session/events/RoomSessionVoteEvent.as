package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_104:String = "RSPE_VOTE_RESULT";
      
      public static const const_127:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1317:int = 0;
      
      private var var_1074:String = "";
      
      private var var_738:Array;
      
      private var var_1042:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1042 = [];
         var_738 = [];
         super(param1,param2,param7,param8);
         var_1074 = param3;
         var_1042 = param4;
         var_738 = param5;
         if(var_738 == null)
         {
            var_738 = [];
         }
         var_1317 = param6;
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
