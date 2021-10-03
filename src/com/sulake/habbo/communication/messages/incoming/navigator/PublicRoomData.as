package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1913:int;
      
      private var var_1927:String;
      
      private var var_1847:int;
      
      private var _disposed:Boolean;
      
      private var var_1928:int;
      
      private var var_1848:String;
      
      private var var_1228:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1848 = param1.readString();
         var_1913 = param1.readInteger();
         var_1847 = param1.readInteger();
         var_1927 = param1.readString();
         var_1928 = param1.readInteger();
         var_1228 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1928;
      }
      
      public function get worldId() : int
      {
         return var_1847;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_1848;
      }
      
      public function get unitPort() : int
      {
         return var_1913;
      }
      
      public function get castLibs() : String
      {
         return var_1927;
      }
      
      public function get nodeId() : int
      {
         return var_1228;
      }
   }
}
