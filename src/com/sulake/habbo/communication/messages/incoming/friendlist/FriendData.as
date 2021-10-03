package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_538:String;
      
      private var var_1163:String;
      
      private var var_1162:String;
      
      private var var_1161:int;
      
      private var var_993:int;
      
      private var var_1160:String;
      
      private var _name:String;
      
      private var var_1159:Boolean;
      
      private var var_637:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_993 = param1.readInteger();
         this.var_637 = param1.readBoolean();
         this.var_1159 = param1.readBoolean();
         this.var_538 = param1.readString();
         this.var_1161 = param1.readInteger();
         this.var_1162 = param1.readString();
         this.var_1163 = param1.readString();
         this.var_1160 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_993;
      }
      
      public function get realName() : String
      {
         return var_1160;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1162;
      }
      
      public function get categoryId() : int
      {
         return var_1161;
      }
      
      public function get online() : Boolean
      {
         return var_637;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1159;
      }
      
      public function get lastAccess() : String
      {
         return var_1163;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_538;
      }
   }
}
