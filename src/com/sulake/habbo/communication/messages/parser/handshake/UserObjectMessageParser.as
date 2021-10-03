package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_538:String;
      
      private var var_2285:String;
      
      private var var_2282:int;
      
      private var var_2283:int;
      
      private var var_1141:String;
      
      private var var_1160:String;
      
      private var _name:String;
      
      private var var_456:int;
      
      private var var_775:int;
      
      private var var_2284:int;
      
      private var var_1852:int;
      
      private var var_2281:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2283;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1160;
      }
      
      public function get customData() : String
      {
         return this.var_2285;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_456;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2282;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2281;
      }
      
      public function get figure() : String
      {
         return this.var_538;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1852;
      }
      
      public function get sex() : String
      {
         return this.var_1141;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_538 = param1.readString();
         this.var_1141 = param1.readString();
         this.var_2285 = param1.readString();
         this.var_1160 = param1.readString();
         this.var_2284 = param1.readInteger();
         this.var_2281 = param1.readString();
         this.var_2282 = param1.readInteger();
         this.var_2283 = param1.readInteger();
         this.var_1852 = param1.readInteger();
         this.var_775 = param1.readInteger();
         this.var_456 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2284;
      }
      
      public function get respectLeft() : int
      {
         return this.var_775;
      }
   }
}
