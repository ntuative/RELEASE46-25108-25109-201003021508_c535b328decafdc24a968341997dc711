package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_570;
         param1["bitmap"] = const_532;
         param1["border"] = const_500;
         param1["border_notify"] = const_1202;
         param1["button"] = const_460;
         param1["button_thick"] = const_512;
         param1["button_icon"] = const_1174;
         param1["button_group_left"] = const_681;
         param1["button_group_center"] = const_617;
         param1["button_group_right"] = const_691;
         param1["canvas"] = const_544;
         param1["checkbox"] = const_601;
         param1["closebutton"] = const_931;
         param1["container"] = const_281;
         param1["container_button"] = const_670;
         param1["display_object_wrapper"] = const_641;
         param1["dropmenu"] = const_403;
         param1["dropmenu_item"] = const_415;
         param1["frame"] = const_283;
         param1["frame_notify"] = const_1339;
         param1["header"] = const_547;
         param1["icon"] = const_830;
         param1["itemgrid"] = const_1017;
         param1["itemgrid_horizontal"] = const_353;
         param1["itemgrid_vertical"] = const_690;
         param1["itemlist"] = const_977;
         param1["itemlist_horizontal"] = const_286;
         param1["itemlist_vertical"] = const_306;
         param1["maximizebox"] = const_1370;
         param1["menu"] = const_1172;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_988;
         param1["minimizebox"] = const_1277;
         param1["notify"] = const_1218;
         param1["PublicRoomObjectsMessageEvent"] = const_561;
         param1["password"] = const_727;
         param1["radiobutton"] = const_729;
         param1["region"] = const_375;
         param1["restorebox"] = const_1357;
         param1["scaler"] = const_803;
         param1["scaler_horizontal"] = const_1290;
         param1["scaler_vertical"] = const_1384;
         param1["scrollbar_horizontal"] = const_364;
         param1["scrollbar_vertical"] = const_688;
         param1["scrollbar_slider_button_up"] = const_850;
         param1["scrollbar_slider_button_down"] = const_869;
         param1["scrollbar_slider_button_left"] = const_1002;
         param1["scrollbar_slider_button_right"] = const_920;
         param1["scrollbar_slider_bar_horizontal"] = const_978;
         param1["scrollbar_slider_bar_vertical"] = const_1001;
         param1["scrollbar_slider_track_horizontal"] = const_792;
         param1["scrollbar_slider_track_vertical"] = const_861;
         param1["scrollable_itemlist"] = const_1229;
         param1["scrollable_itemlist_vertical"] = const_481;
         param1["scrollable_itemlist_horizontal"] = const_1011;
         param1["selector"] = const_685;
         param1["selector_list"] = const_506;
         param1["submenu"] = const_988;
         param1["tab_button"] = const_611;
         param1["tab_container_button"] = const_804;
         param1["tab_context"] = const_351;
         param1["tab_content"] = const_980;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_631;
         param1["input"] = const_666;
         param1["toolbar"] = const_1327;
         param1["tooltip"] = const_284;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
