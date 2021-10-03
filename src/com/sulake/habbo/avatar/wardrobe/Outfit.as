package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   
   public class Outfit implements IOutfit
   {
       
      
      private var var_993:String;
      
      private var var_538:String;
      
      private var _view:OutfitView;
      
      private var var_1523:IAvatarImage;
      
      private var var_11:HabboAvatarEditor;
      
      private var _image:BitmapData;
      
      public function Outfit(param1:HabboAvatarEditor, param2:String, param3:String)
      {
         super();
         var_11 = param1;
         _view = new OutfitView(param1.windowManager,param1.assets,param2 != "");
         switch(param3)
         {
            case FigureData.const_77:
            case "m":
            case "M":
               param3 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param3 = "null";
         }
         var_538 = param2;
         var_993 = param3;
         update();
      }
      
      public function get gender() : String
      {
         return var_993;
      }
      
      public function get image() : BitmapData
      {
         if(_image == null)
         {
            return new BitmapData(33,56,false,0);
         }
         return _image;
      }
      
      public function get view() : OutfitView
      {
         return _view;
      }
      
      public function update() : void
      {
         var_1523 = var_11.avatarRenderManager.createAvatarImage(figure,AvatarScaleType.const_97);
         var_1523.setDirection(AvatarSetType.const_37,int(FigureData.const_894));
         _image = var_1523.getImage(AvatarSetType.const_37);
         _view.udpate(_image);
      }
      
      public function get figure() : String
      {
         return var_538;
      }
      
      public function dispose() : void
      {
         var_538 = null;
         var_993 = null;
         _image = null;
      }
   }
}
