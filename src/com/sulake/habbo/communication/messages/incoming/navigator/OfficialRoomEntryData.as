package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1309:int = 4;
      
      public static const const_518:int = 3;
      
      public static const const_627:int = 2;
      
      public static const const_947:int = 1;
       
      
      private var var_1865:String;
      
      private var _disposed:Boolean;
      
      private var var_1795:int;
      
      private var var_1861:Boolean;
      
      private var var_887:String;
      
      private var var_801:PublicRoomData;
      
      private var var_1864:int;
      
      private var _index:int;
      
      private var var_1863:String;
      
      private var _type:int;
      
      private var var_1642:String;
      
      private var var_800:GuestRoomData;
      
      private var var_1862:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1865 = param1.readString();
         var_1862 = param1.readString();
         var_1861 = param1.readInteger() == 1;
         var_1863 = param1.readString();
         var_887 = param1.readString();
         var_1864 = param1.readInteger();
         var_1795 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_947)
         {
            var_1642 = param1.readString();
         }
         else if(_type == const_518)
         {
            var_801 = new PublicRoomData(param1);
         }
         else if(_type == const_627)
         {
            var_800 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1864;
      }
      
      public function get popupCaption() : String
      {
         return var_1865;
      }
      
      public function get userCount() : int
      {
         return var_1795;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1861;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_947)
         {
            return 0;
         }
         if(this.type == const_627)
         {
            return this.var_800.maxUserCount;
         }
         if(this.type == const_518)
         {
            return this.var_801.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1862;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_800 != null)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_800;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1863;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_801;
      }
      
      public function get picRef() : String
      {
         return var_887;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1642;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
