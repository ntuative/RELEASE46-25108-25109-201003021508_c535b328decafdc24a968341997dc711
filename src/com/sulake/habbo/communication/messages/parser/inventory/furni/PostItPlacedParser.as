package com.sulake.habbo.communication.messages.parser.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PostItPlacedParser implements IMessageParser
   {
       
      
      private var var_2213:int;
      
      private var _id:int;
      
      public function PostItPlacedParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _id = param1.readInteger();
         var_2213 = param1.readInteger();
         return true;
      }
      
      public function get itemsLeft() : int
      {
         return var_2213;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
