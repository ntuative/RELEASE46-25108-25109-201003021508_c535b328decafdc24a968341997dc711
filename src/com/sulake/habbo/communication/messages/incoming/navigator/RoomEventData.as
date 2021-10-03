package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1725:String;
      
      private var var_385:int;
      
      private var var_1894:String;
      
      private var var_1896:String;
      
      private var var_1892:int;
      
      private var var_1893:String;
      
      private var var_1895:int;
      
      private var var_613:Array;
      
      private var var_1041:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_613 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1041 = false;
            return;
         }
         this.var_1041 = true;
         var_1892 = int(_loc2_);
         var_1894 = param1.readString();
         var_385 = int(param1.readString());
         var_1895 = param1.readInteger();
         var_1725 = param1.readString();
         var_1896 = param1.readString();
         var_1893 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_613.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1895;
      }
      
      public function get eventName() : String
      {
         return var_1725;
      }
      
      public function get eventDescription() : String
      {
         return var_1896;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1894;
      }
      
      public function get tags() : Array
      {
         return var_613;
      }
      
      public function get creationTime() : String
      {
         return var_1893;
      }
      
      public function get exists() : Boolean
      {
         return var_1041;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1892;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_385;
      }
   }
}
