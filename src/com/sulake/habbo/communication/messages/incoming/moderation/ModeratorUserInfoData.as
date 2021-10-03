package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2014:int;
      
      private var var_2016:int;
      
      private var var_2018:int;
      
      private var _userName:String;
      
      private var var_2017:int;
      
      private var var_2013:int;
      
      private var var_2015:int;
      
      private var _userId:int;
      
      private var var_637:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2013 = param1.readInteger();
         var_2017 = param1.readInteger();
         var_637 = param1.readBoolean();
         var_2018 = param1.readInteger();
         var_2016 = param1.readInteger();
         var_2014 = param1.readInteger();
         var_2015 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2015;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_637;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2017;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2016;
      }
      
      public function get cautionCount() : int
      {
         return var_2014;
      }
      
      public function get cfhCount() : int
      {
         return var_2018;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2013;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
