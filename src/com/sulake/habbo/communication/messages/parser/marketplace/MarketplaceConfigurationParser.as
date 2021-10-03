package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1761:int;
      
      private var var_1564:int;
      
      private var var_1766:int;
      
      private var var_1763:int;
      
      private var var_1762:int;
      
      private var var_1565:int;
      
      private var var_1764:int;
      
      private var var_1765:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1761;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1564;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1764;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1763;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1762;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1565;
      }
      
      public function get commission() : int
      {
         return var_1766;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1765 = param1.readBoolean();
         var_1766 = param1.readInteger();
         var_1564 = param1.readInteger();
         var_1565 = param1.readInteger();
         var_1763 = param1.readInteger();
         var_1761 = param1.readInteger();
         var_1762 = param1.readInteger();
         var_1764 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1765;
      }
   }
}
