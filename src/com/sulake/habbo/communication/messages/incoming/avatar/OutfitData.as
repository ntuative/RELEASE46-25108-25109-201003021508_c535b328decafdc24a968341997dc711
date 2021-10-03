package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1648:String;
      
      private var var_993:String;
      
      private var var_1649:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1649 = param1.readInteger();
         var_1648 = param1.readString();
         var_993 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_993;
      }
      
      public function get figureString() : String
      {
         return var_1648;
      }
      
      public function get slotId() : int
      {
         return var_1649;
      }
   }
}
