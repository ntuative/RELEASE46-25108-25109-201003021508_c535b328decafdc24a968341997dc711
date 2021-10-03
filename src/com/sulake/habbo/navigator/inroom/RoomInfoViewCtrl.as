package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_647:IWindowContainer;
      
      private var var_953:ITextWindow;
      
      private var var_188:RoomSettingsCtrl;
      
      private var var_1140:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1135:ITextWindow;
      
      private var var_326:IWindowContainer;
      
      private var var_1724:IWindowContainer;
      
      private var var_1722:ITextWindow;
      
      private var var_767:IWindowContainer;
      
      private var var_1411:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_700:ITextWindow;
      
      private var var_1412:IWindowContainer;
      
      private var var_1137:IWindowContainer;
      
      private var var_769:ITextWindow;
      
      private var var_951:ITextFieldWindow;
      
      private var var_291:IWindowContainer;
      
      private var var_770:ITextWindow;
      
      private var var_1413:IButtonWindow;
      
      private var var_952:ITextWindow;
      
      private var var_2287:int;
      
      private var var_1134:IContainerButtonWindow;
      
      private var var_768:IWindowContainer;
      
      private var var_1139:ITextWindow;
      
      private var var_1136:IContainerButtonWindow;
      
      private var var_1410:ITextWindow;
      
      private var var_1414:IButtonWindow;
      
      private var var_896:TagRenderer;
      
      private var var_1725:ITextWindow;
      
      private var var_325:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_646:ITextWindow;
      
      private var var_246:RoomThumbnailCtrl;
      
      private var var_1138:IContainerButtonWindow;
      
      private var var_1723:IWindowContainer;
      
      private var var_245:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_325 = new RoomEventViewCtrl(_navigator);
         var_188 = new RoomSettingsCtrl(_navigator,this,true);
         var_246 = new RoomThumbnailCtrl(_navigator);
         var_896 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_188);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_188.active = true;
         this.var_325.active = false;
         this.var_246.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1411.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1414.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1412.visible = Util.hasVisibleChildren(var_1412);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_700.text = param1.roomName;
         var_700.height = NaN;
         _ownerName.text = param1.ownerName;
         var_769.text = param1.description;
         var_896.refreshTags(var_326,param1.tags);
         var_769.visible = false;
         if(param1.description != "")
         {
            var_769.height = NaN;
            var_769.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_326,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_326,"thumb_down",_loc3_,onThumbDown,0);
         var_1722.visible = _loc3_;
         var_770.visible = !_loc3_;
         var_1410.visible = !_loc3_;
         var_1410.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_326,"home",param2,null,0);
         _navigator.refreshButton(var_326,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_326,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_700.y,0);
         var_326.visible = true;
         var_326.height = Util.getLowestPoint(var_326);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_395,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1413.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1140.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1138.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1134.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1136.visible = _navigator.data.canEditRoomSettings && param1;
         var_1137.visible = Util.hasVisibleChildren(var_1137);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_325.active = false;
         this.var_188.active = false;
         this.var_246.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_325.active = false;
         this.var_188.active = false;
         this.var_246.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_395,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_291);
         var_291.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_188.refresh(var_291);
         this.var_246.refresh(var_291);
         Util.moveChildrenToColumn(var_291,["room_details","room_buttons"],0,2);
         var_291.height = Util.getLowestPoint(var_291);
         var_291.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_951.setSelection(0,var_951.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_245);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_325.refresh(var_245);
         if(Util.hasVisibleChildren(var_245) && !this.var_246.active)
         {
            Util.moveChildrenToColumn(var_245,["event_details","event_buttons"],0,2);
            var_245.height = Util.getLowestPoint(var_245);
            var_245.visible = true;
         }
         else
         {
            var_245.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_325.active = true;
         this.var_188.active = false;
         this.var_246.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_953.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_953.height = NaN;
         var_1135.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1135.height = NaN;
         Util.moveChildrenToColumn(var_647,["public_space_name","public_space_desc"],var_953.y,0);
         var_647.visible = true;
         var_647.height = Math.max(86,Util.getLowestPoint(var_647));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboNavigatorCom_rico_ob5_png";
         if(_loc1_ && true && true && true)
         {
            var_768.visible = true;
            var_951.text = this.getEmbedData();
         }
         else
         {
            var_768.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_188.load(param1);
         this.var_188.active = true;
         this.var_325.active = false;
         this.var_246.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_188.active = false;
         this.var_325.active = false;
         this.var_246.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_68,false);
         _window.setParamFlag(HabboWindowParam.const_1329,true);
         _window.visible = false;
         var_291 = IWindowContainer(find("room_info"));
         var_326 = IWindowContainer(find("room_details"));
         var_647 = IWindowContainer(find("public_space_details"));
         var_1723 = IWindowContainer(find("owner_name_cont"));
         var_1724 = IWindowContainer(find("rating_cont"));
         var_1137 = IWindowContainer(find("room_buttons"));
         var_700 = ITextWindow(find("room_name"));
         var_953 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_769 = ITextWindow(find("room_desc"));
         var_1135 = ITextWindow(find("public_space_desc"));
         var_952 = ITextWindow(find("owner_caption"));
         var_770 = ITextWindow(find("rating_caption"));
         var_1722 = ITextWindow(find("rate_caption"));
         var_1410 = ITextWindow(find("rating_txt"));
         var_245 = IWindowContainer(find("event_info"));
         var_767 = IWindowContainer(find("event_details"));
         var_1412 = IWindowContainer(find("event_buttons"));
         var_1725 = ITextWindow(find("event_name"));
         var_646 = ITextWindow(find("event_desc"));
         var_1140 = IContainerButtonWindow(find("add_favourite_button"));
         var_1138 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1134 = IContainerButtonWindow(find("make_home_button"));
         var_1136 = IContainerButtonWindow(find("unmake_home_button"));
         var_1413 = IButtonWindow(find("room_settings_button"));
         var_1411 = IButtonWindow(find("create_event_button"));
         var_1414 = IButtonWindow(find("edit_event_button"));
         var_768 = IWindowContainer(find("embed_info"));
         var_1139 = ITextWindow(find("embed_info_txt"));
         var_951 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1140,onAddFavouriteClick);
         Util.setProcDirectly(var_1138,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1413,onRoomSettingsClick);
         Util.setProcDirectly(var_1134,onMakeHomeClick);
         Util.setProcDirectly(var_1136,onUnmakeHomeClick);
         Util.setProcDirectly(var_1411,onEventSettingsClick);
         Util.setProcDirectly(var_1414,onEventSettingsClick);
         Util.setProcDirectly(var_951,onEmbedSrcClick);
         _navigator.refreshButton(var_1140,"favourite",true,null,0);
         _navigator.refreshButton(var_1138,"favourite",true,null,0);
         _navigator.refreshButton(var_1134,"home",true,null,0);
         _navigator.refreshButton(var_1136,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_291,onHover);
         Util.setProcDirectly(var_245,onHover);
         var_952.width = var_952.textWidth;
         Util.moveChildrenToRow(var_1723,["owner_caption","owner_name"],var_952.x,var_952.y,3);
         var_770.width = var_770.textWidth;
         Util.moveChildrenToRow(var_1724,["rating_caption","rating_txt"],var_770.x,var_770.y,3);
         var_1139.height = NaN;
         Util.moveChildrenToColumn(var_768,["embed_info_txt","embed_src_txt"],var_1139.y,2);
         var_768.height = Util.getLowestPoint(var_768) + 5;
         var_2287 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1725.text = param1.eventName;
         var_646.text = param1.eventDescription;
         var_896.refreshTags(var_767,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_646.visible = false;
         if(param1.eventDescription != "")
         {
            var_646.height = NaN;
            var_646.y = Util.getLowestPoint(var_767) + 2;
            var_646.visible = true;
         }
         var_767.visible = true;
         var_767.height = Util.getLowestPoint(var_767);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_930,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
