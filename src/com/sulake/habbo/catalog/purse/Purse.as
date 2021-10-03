package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1702:int = 0;
      
      private var var_1701:int = 0;
      
      private var var_1703:int = 0;
      
      private var var_1704:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1701;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1701 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function get credits() : int
      {
         return var_1703;
      }
      
      public function get clubDays() : int
      {
         return var_1702;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1704 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1703 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1704;
      }
   }
}
