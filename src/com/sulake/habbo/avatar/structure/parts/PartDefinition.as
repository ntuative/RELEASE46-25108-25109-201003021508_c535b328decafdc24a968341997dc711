package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1570:int = -1;
      
      private var var_1321:Boolean;
      
      private var var_1320:String;
      
      private var var_2198:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2198 = String(param1["set-type"]);
         var_1320 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1321 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1570 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1320;
      }
      
      public function get staticId() : int
      {
         return var_1570;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1570 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1321;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1321 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1320 = param1;
      }
      
      public function get setType() : String
      {
         return var_2198;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
