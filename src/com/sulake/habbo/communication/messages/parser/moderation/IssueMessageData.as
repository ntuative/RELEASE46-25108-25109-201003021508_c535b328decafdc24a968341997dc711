package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_130:int = 1;
      
      public static const const_1312:int = 3;
      
      public static const const_399:int = 2;
       
      
      private var var_1911:int;
      
      private var var_1913:int;
      
      private var var_1912:int;
      
      private var var_1847:int;
      
      private var var_32:int;
      
      private var var_385:int;
      
      private var var_1281:int;
      
      private var var_1728:int;
      
      private var var_1062:int;
      
      private var _roomResources:String;
      
      private var var_1910:int;
      
      private var var_1908:int;
      
      private var var_1914:String;
      
      private var var_1727:String;
      
      private var var_1915:int = 0;
      
      private var var_1301:String;
      
      private var _message:String;
      
      private var var_1679:int;
      
      private var var_1916:String;
      
      private var var_1161:int;
      
      private var var_700:String;
      
      private var var_1909:String;
      
      private var var_1489:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1062 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1915 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1908;
      }
      
      public function set roomName(param1:String) : void
      {
         var_700 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1910 = param1;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_700;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1847 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_32 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1913;
      }
      
      public function get priority() : int
      {
         return var_1911 + var_1915;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1728 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1727;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1489) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1161;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1908 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1281;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1914 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1910;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1847;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1909 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1301 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1728;
      }
      
      public function set priority(param1:int) : void
      {
         var_1911 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1913 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1914;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1912 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1727 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1679 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1301;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1281 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1912;
      }
      
      public function set flatId(param1:int) : void
      {
         var_385 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1161 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1489 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1679;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1916 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1489;
      }
      
      public function get reportedUserId() : int
      {
         return var_1062;
      }
      
      public function get flatId() : int
      {
         return var_385;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1909;
      }
      
      public function get reporterUserName() : String
      {
         return var_1916;
      }
   }
}
