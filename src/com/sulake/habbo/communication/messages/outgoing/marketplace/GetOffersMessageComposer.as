package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetOffersMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_27:Array;
      
      public function GetOffersMessageComposer(param1:int, param2:int, param3:String, param4:int)
      {
         var_27 = new Array();
         super();
         var_27.push(param1);
         var_27.push(param2);
         var_27.push(param3);
         var_27.push(param4);
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
