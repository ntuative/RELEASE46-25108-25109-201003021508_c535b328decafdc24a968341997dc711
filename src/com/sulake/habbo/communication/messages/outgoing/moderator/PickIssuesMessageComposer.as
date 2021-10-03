package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class PickIssuesMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_27:Array;
      
      public function PickIssuesMessageComposer(param1:Array)
      {
         var_27 = new Array();
         super();
         this.var_27.push(param1.length);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.var_27.push(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_27;
      }
      
      public function dispose() : void
      {
         this.var_27 = null;
      }
   }
}
