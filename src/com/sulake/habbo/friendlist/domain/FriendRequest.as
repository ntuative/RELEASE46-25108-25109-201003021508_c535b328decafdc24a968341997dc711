package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class FriendRequest implements IDisposable
   {
      
      public static const const_318:int = 2;
      
      public static const const_130:int = 1;
      
      public static const const_940:int = 4;
      
      public static const const_310:int = 3;
       
      
      private var var_1875:int;
      
      private var _view:IWindowContainer;
      
      private var var_1876:String;
      
      private var var_32:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_1032:int;
      
      public function FriendRequest(param1:FriendRequestData)
      {
         super();
         var_1032 = param1.requestId;
         var_1876 = param1.method_5;
         var_1875 = param1.requesterUserId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get method_5() : String
      {
         return var_1876;
      }
      
      public function get requesterUserId() : int
      {
         return var_1875;
      }
      
      public function get requestId() : int
      {
         return var_1032;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         _view = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_32 = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(view != null)
         {
            view.destroy();
            view = null;
         }
      }
   }
}
