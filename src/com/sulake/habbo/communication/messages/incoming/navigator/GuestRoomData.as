package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1795:int;
      
      private var var_2210:String;
      
      private var var_2207:int;
      
      private var var_2208:int;
      
      private var var_727:Boolean;
      
      private var var_1684:Boolean;
      
      private var var_385:int;
      
      private var var_1264:String;
      
      private var var_1685:int;
      
      private var var_1161:int;
      
      private var _ownerName:String;
      
      private var var_700:String;
      
      private var var_2209:int;
      
      private var var_2211:RoomThumbnailData;
      
      private var var_2132:Boolean;
      
      private var var_613:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_613 = new Array();
         super();
         var_385 = param1.readInteger();
         var_727 = param1.readBoolean();
         var_700 = param1.readString();
         _ownerName = param1.readString();
         var_1685 = param1.readInteger();
         var_1795 = param1.readInteger();
         var_2209 = param1.readInteger();
         var_1264 = param1.readString();
         var_2207 = param1.readInteger();
         var_2132 = param1.readBoolean();
         var_2208 = param1.readInteger();
         var_1161 = param1.readInteger();
         var_2210 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_613.push(_loc4_);
            _loc3_++;
         }
         var_2211 = new RoomThumbnailData(param1);
         var_1684 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2209;
      }
      
      public function get roomName() : String
      {
         return var_700;
      }
      
      public function get userCount() : int
      {
         return var_1795;
      }
      
      public function get score() : int
      {
         return var_2208;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2210;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2132;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1684;
      }
      
      public function get event() : Boolean
      {
         return var_727;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_613 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1161;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2207;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2211;
      }
      
      public function get doorMode() : int
      {
         return var_1685;
      }
      
      public function get flatId() : int
      {
         return var_385;
      }
      
      public function get description() : String
      {
         return var_1264;
      }
   }
}
