package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2299:Boolean;
      
      private var var_2301:int;
      
      private var var_2300:Boolean;
      
      private var var_1399:String;
      
      private var var_1160:String;
      
      private var var_1809:int;
      
      private var var_1705:String;
      
      private var var_2302:String;
      
      private var var_1706:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1809 = param1.readInteger();
         this.var_1399 = param1.readString();
         this.var_1705 = param1.readString();
         this.var_2299 = param1.readBoolean();
         this.var_2300 = param1.readBoolean();
         param1.readString();
         this.var_2301 = param1.readInteger();
         this.var_1706 = param1.readString();
         this.var_2302 = param1.readString();
         this.var_1160 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1160;
      }
      
      public function get avatarName() : String
      {
         return this.var_1399;
      }
      
      public function get avatarId() : int
      {
         return this.var_1809;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2299;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2302;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1706;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2300;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1705;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2301;
      }
   }
}
