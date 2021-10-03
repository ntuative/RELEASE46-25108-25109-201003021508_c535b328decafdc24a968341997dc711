package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_615:String = "RWUAM_RESPECT_USER";
      
      public static const const_521:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_588:String = "RWUAM_START_TRADING";
      
      public static const const_610:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_572:String = "RWUAM_WHISPER_USER";
      
      public static const const_731:String = "RWUAM_IGNORE_USER";
      
      public static const const_409:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_519:String = "RWUAM_BAN_USER";
      
      public static const const_523:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_449:String = "RWUAM_KICK_USER";
      
      public static const const_558:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_735:String = " RWUAM_RESPECT_PET";
      
      public static const const_354:String = "RWUAM_KICK_BOT";
      
      public static const const_1307:String = "RWUAM_TRAIN_PET";
      
      public static const const_629:String = "RWUAM_PICKUP_PET";
      
      public static const const_676:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_598:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
