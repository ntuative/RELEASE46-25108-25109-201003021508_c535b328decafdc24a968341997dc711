package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["PublicRoomObjectsMessageEvent"] = const_115;
         param1["bound_to_parent_rect"] = const_79;
         param1["child_window"] = const_806;
         param1["embedded_controller"] = const_333;
         param1["resize_to_accommodate_children"] = const_59;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_678;
         param1["mouse_dragging_target"] = const_222;
         param1["mouse_dragging_trigger"] = const_334;
         param1["mouse_scaling_target"] = const_231;
         param1["mouse_scaling_trigger"] = const_451;
         param1["horizontal_mouse_scaling_trigger"] = const_205;
         param1["vertical_mouse_scaling_trigger"] = const_190;
         param1["observe_parent_input_events"] = const_875;
         param1["optimize_region_to_layout_size"] = const_381;
         param1["parent_window"] = const_974;
         param1["relative_horizontal_scale_center"] = const_170;
         param1["relative_horizontal_scale_fixed"] = const_123;
         param1["relative_horizontal_scale_move"] = const_329;
         param1["relative_horizontal_scale_strech"] = const_251;
         param1["relative_scale_center"] = const_839;
         param1["relative_scale_fixed"] = const_724;
         param1["relative_scale_move"] = const_990;
         param1["relative_scale_strech"] = const_858;
         param1["relative_vertical_scale_center"] = const_165;
         param1["relative_vertical_scale_fixed"] = const_114;
         param1["relative_vertical_scale_move"] = const_327;
         param1["relative_vertical_scale_strech"] = const_258;
         param1["on_resize_align_left"] = const_695;
         param1["on_resize_align_right"] = const_426;
         param1["on_resize_align_center"] = const_482;
         param1["on_resize_align_top"] = const_503;
         param1["on_resize_align_bottom"] = const_406;
         param1["on_resize_align_middle"] = const_384;
         param1["on_accommodate_align_left"] = const_973;
         param1["on_accommodate_align_right"] = const_437;
         param1["on_accommodate_align_center"] = const_501;
         param1["on_accommodate_align_top"] = const_842;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_700;
         param1["route_input_events_to_parent"] = const_389;
         param1["use_parent_graphic_context"] = const_30;
         param1["draggable_with_mouse"] = const_791;
         param1["scalable_with_mouse"] = const_938;
         param1["reflect_horizontal_resize_to_parent"] = const_418;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_252;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
