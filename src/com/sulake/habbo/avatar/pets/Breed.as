package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_993:String;
      
      private var _id:int;
      
      private var var_2000:String = "";
      
      private var var_2002:int;
      
      private var var_2001:String;
      
      private var var_1669:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2002 = parseInt(param1.@pattern);
         var_993 = String(param1.@gender);
         var_1669 = Boolean(parseInt(param1.@colorable));
         var_2000 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2000;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1669;
      }
      
      public function get gender() : String
      {
         return var_993;
      }
      
      public function get patternId() : int
      {
         return var_2002;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2001;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2001 = param1;
      }
   }
}
