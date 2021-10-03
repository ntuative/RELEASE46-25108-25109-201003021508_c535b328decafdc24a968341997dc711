package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_818:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_818 = new Array();
         var_818.push(param1.length);
         var_818 = var_818.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_818;
      }
   }
}
