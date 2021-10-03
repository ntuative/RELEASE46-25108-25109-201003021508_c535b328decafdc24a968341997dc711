package com.sulake.habbo.avatar.structure.figure
{
   import flash.utils.Dictionary;
   
   public class SetType implements ISetType
   {
       
      
      private var _type:String;
      
      private var _partSets:Dictionary;
      
      private var var_2162:Boolean;
      
      private var var_2163:int;
      
      public function SetType(param1:XML)
      {
         super();
         _type = String(param1.@type);
         var_2163 = parseInt(param1.@paletteid);
         var_2162 = Boolean(parseInt(param1.@mandatory));
         _partSets = new Dictionary();
         append(param1);
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get partSets() : Dictionary
      {
         return _partSets;
      }
      
      public function get isMandatory() : Boolean
      {
         return var_2162;
      }
      
      public function get paletteID() : int
      {
         return var_2163;
      }
      
      public function getPartSet(param1:int) : IFigurePartSet
      {
         return _partSets[String(param1)];
      }
      
      public function append(param1:XML) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1["set"])
         {
            _partSets[String(_loc2_.@id)] = new FigurePartSet(_loc2_);
         }
      }
   }
}
