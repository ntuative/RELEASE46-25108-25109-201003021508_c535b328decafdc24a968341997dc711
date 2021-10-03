package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SetSoundSettingsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_27:Array;
      
      public function SetSoundSettingsComposer(param1:int)
      {
         var_27 = new Array();
         super();
         var_27.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_27;
      }
      
      public function dispose() : void
      {
         var_27 = null;
      }
   }
}
