package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2093:int;
      
      private var var_2088:String;
      
      private var var_1528:IActionDefinition;
      
      private var var_2090:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2089:String;
      
      private var var_2092:String;
      
      private var var_1669:Boolean;
      
      private var var_2091:ColorTransform;
      
      private var var_2079:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2088 = param1;
         var_2089 = param2;
         var_2093 = param3;
         _color = param4;
         _frames = param5;
         var_1528 = param6;
         var_1669 = param7;
         var_2079 = param8;
         var_2092 = param9;
         var_2090 = param10;
         var_2091 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1669;
      }
      
      public function get partType() : String
      {
         return var_2089;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2079;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2090;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2093;
      }
      
      public function get flippedPartType() : String
      {
         return var_2092;
      }
      
      public function get bodyPartId() : String
      {
         return var_2088;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1528;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2091;
      }
   }
}
