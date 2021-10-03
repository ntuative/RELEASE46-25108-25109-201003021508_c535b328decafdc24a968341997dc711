package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_163:String;
      
      private var var_404:int;
      
      private var var_199:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_163 = param1;
         var_199 = param2;
         var_404 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_199.text = var_163.substring(0,param1) + "...";
         return var_199.textHeight > var_404;
      }
   }
}
