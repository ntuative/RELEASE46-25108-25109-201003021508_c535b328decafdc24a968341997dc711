package com.sulake.habbo.communication.messages.outgoing.help
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetFaqCategoryMessageComposer implements IMessageComposer
   {
       
      
      private var var_1161:int;
      
      public function GetFaqCategoryMessageComposer(param1:int)
      {
         super();
         var_1161 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1161];
      }
   }
}
