package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1708:Boolean = false;
      
      private var var_1709:int = 0;
      
      private var var_1702:int = 0;
      
      private var var_1710:int = 0;
      
      private var var_1495:int = 0;
      
      private var var_1704:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1495 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1709;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1708;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1708 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1709 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1702 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1495;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1710 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1702;
      }
      
      public function get pixelBalance() : int
      {
         return var_1710;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1704 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1704;
      }
   }
}
