package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_944:SoundChannel = null;
      
      private var var_759:Boolean;
      
      private var var_945:Sound = null;
      
      private var var_641:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_945 = param1;
         var_945.addEventListener(Event.COMPLETE,onComplete);
         var_641 = 1;
         var_759 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_759;
      }
      
      public function stop() : Boolean
      {
         var_944.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_759 = false;
         var_944 = var_945.play(0);
         this.volume = var_641;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_641;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_944.position;
      }
      
      public function get length() : Number
      {
         return var_945.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_641 = param1;
         if(var_944 != null)
         {
            var_944.soundTransform = new SoundTransform(var_641);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_759 = true;
      }
   }
}
