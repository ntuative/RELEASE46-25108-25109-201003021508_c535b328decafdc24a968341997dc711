package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SelectableController extends InteractiveController implements ISelectableWindow
   {
       
      
      public function SelectableController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         setStateFlag(WindowState.const_46,param1);
      }
      
      public function get selector() : ISelectorWindow
      {
         var _loc1_:* = null;
         if(var_6)
         {
            _loc1_ = var_6 as WindowController;
            while(_loc1_)
            {
               if(_loc1_ is ISelectorWindow)
               {
                  return _loc1_ as ISelectorWindow;
               }
               _loc1_ = _loc1_.parent;
            }
         }
         return null;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         if(param2.type == WindowNotifyEvent.const_309)
         {
            if(var_6)
            {
               if(!(var_6 is ISelectorWindow))
               {
                  _loc3_ = var_6.parent as WindowController;
                  while(_loc3_)
                  {
                     if(_loc3_ is ISelectorWindow)
                     {
                        _loc3_.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_213,this,null));
                        break;
                     }
                     _loc3_ = _loc3_.parent as WindowController;
                  }
               }
            }
         }
         return super.update(param1,param2);
      }
      
      public function select() : Boolean
      {
         if(getStateFlag(WindowState.const_46))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_396,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_46,true);
         _loc1_.type = WindowNotifyEvent.const_330;
         update(this,_loc1_);
         return true;
      }
      
      public function get isSelected() : Boolean
      {
         return testStateFlag(WindowState.const_46);
      }
      
      public function unselect() : Boolean
      {
         if(!getStateFlag(WindowState.const_46))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_513,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_46,false);
         _loc1_.type = WindowNotifyEvent.const_607;
         update(this,_loc1_);
         return true;
      }
   }
}
