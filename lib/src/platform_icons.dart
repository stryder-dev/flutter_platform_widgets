import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/src/extensions/build_context.dart';

import 'platform.dart';

extension PlatformIconsExt on BuildContext {
  /// Render either a Material or Cupertino icon based on the platform
  PlatformIcons get platformIcons => PlatformIcons(this);

  IconData platformIcon({
    required IconData material,
    required IconData cupertino,
  }) =>
      isMaterial(this) ? material : cupertino;
}

class PlatformIcons {
  PlatformIcons(this.context);

  final BuildContext context;

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle
  IconData get accountCircle => context.isMaterialDesign
      ? Icons.account_circle_outlined
      : CupertinoIcons.person_crop_circle;

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle_fill
  IconData get accountCircleSolid => context.isMaterialDesign
      ? Icons.account_circle
      : CupertinoIcons.person_crop_circle_fill;

  /// Icons: Icons.add : CupertinoIcons.add
  IconData get add => context.isMaterialDesign ? Icons.add : CupertinoIcons.add;

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled
  IconData get addCircled =>
      context.isMaterialDesign ? Icons.add_circle : CupertinoIcons.add_circled;

  /// Icons: Icons.add_circle_outline : CupertinoIcons.add_circled
  IconData get addCircledOutline => context.isMaterialDesign
      ? Icons.add_circle_outline
      : CupertinoIcons.add_circled;

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled_solid
  IconData get addCircledSolid => context.isMaterialDesign
      ? Icons.add_circle
      : CupertinoIcons.add_circled_solid;

  /// Icons: Icons.arrow_back : CupertinoIcons.back
  IconData get back =>
      context.isMaterialDesign ? Icons.arrow_back : CupertinoIcons.back;

  // IconData get battery25Percent =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.battery_25_percent;

  // IconData get battery75Percent =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.battery_75_percent;

  /// Icons: Icons.battery_charging_full : CupertinoIcons.battery_charging
  IconData get batteryCharging => context.isMaterialDesign
      ? Icons.battery_charging_full
      : CupertinoIcons.battery_charging;

  /// Icons: Icons.battery_alert : CupertinoIcons.battery_empty
  IconData get batteryEmpty => context.isMaterialDesign
      ? Icons.battery_alert
      : CupertinoIcons.battery_empty;

  /// Icons: Icons.battery_full : CupertinoIcons.battery_full
  IconData get batteryFull => context.isMaterialDesign
      ? Icons.battery_full
      : CupertinoIcons.battery_full;

  // IconData get bell => context.isMaterialDesign ? Icons. : CupertinoIcons.bell;

  // IconData get bellSolid =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.bell_solid;

  /// Icons: Icons.bluetooth : CupertinoIcons.bluetooth
  IconData get bluetooth =>
      context.isMaterialDesign ? Icons.bluetooth : CupertinoIcons.bluetooth;

  /// Icons: Icons.book : CupertinoIcons.book
  IconData get book =>
      context.isMaterialDesign ? Icons.book : CupertinoIcons.book;

  // IconData get bookSolid =>
  //     context.isMaterialDesign ? Icons.book : CupertinoIcons.book_solid;

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark
  IconData get bookmark =>
      context.isMaterialDesign ? Icons.bookmark : CupertinoIcons.bookmark;

  /// Icons: Icons.bookmark_border : CupertinoIcons.bookmark
  IconData get bookmarkOutline => context.isMaterialDesign
      ? Icons.bookmark_border
      : CupertinoIcons.bookmark;

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark_solid
  IconData get bookmarkSolid =>
      context.isMaterialDesign ? Icons.bookmark : CupertinoIcons.bookmark_solid;

  /// Icons: Icons.brightness_low : CupertinoIcons.brightness
  IconData get brightness => context.isMaterialDesign
      ? Icons.brightness_low
      : CupertinoIcons.brightness;

  /// Icons: Icons.brightness_high : CupertinoIcons.brightness_solid
  IconData get brightnessSolid => context.isMaterialDesign
      ? Icons.brightness_high
      : CupertinoIcons.brightness_solid;

  /// Icons: Icons.directions_bus : CupertinoIcons.bus
  IconData get bus =>
      context.isMaterialDesign ? Icons.directions_bus : CupertinoIcons.bus;

  /// Icons: Icons.directions_car : CupertinoIcons.car
  IconData get car =>
      context.isMaterialDesign ? Icons.directions_car : CupertinoIcons.car;

  // IconData get carDetailed =>
  //     context.isMaterialDesign ? Icons.book : CupertinoIcons.car_detailed;

  /// Icons: Icons.check_box_outline_blank_rounded : CupertinoIcons.square
  IconData get checkBoxBlankOutlineRounded => context.isMaterialDesign
      ? Icons.check_box_outline_blank_rounded
      : CupertinoIcons.square;

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.minus_square
  IconData get checkBoxIndeterminateOutlineRounded => context.isMaterialDesign
      ? Icons.indeterminate_check_box_outlined
      : CupertinoIcons.minus_square;

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.checkmark_square
  IconData get checkBoxCheckedOutlineRounded => context.isMaterialDesign
      ? Icons.check_box_outlined
      : CupertinoIcons.checkmark_square;

  /// Icons: Icons.check : CupertinoIcons.check_mark
  IconData get checkMark =>
      context.isMaterialDesign ? Icons.check : CupertinoIcons.check_mark;

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircled => context.isMaterialDesign
      ? Icons.check_circle
      : CupertinoIcons.check_mark_circled;

  /// Icons: Icons.check_circle_outline : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircledOutline => context.isMaterialDesign
      ? Icons.check_circle_outline
      : CupertinoIcons.check_mark_circled;

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled_solid
  IconData get checkMarkCircledSolid => context.isMaterialDesign
      ? Icons.check_circle
      : CupertinoIcons.check_mark_circled_solid;

  // IconData get circle =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.circle;

  // IconData get circleFilled =>
  //     context.isMaterialDesign ? Icons.book : CupertinoIcons.circle_filled;

  /// Icons: Icons.clear : CupertinoIcons.clear
  IconData get clear =>
      context.isMaterialDesign ? Icons.clear : CupertinoIcons.clear;

  // IconData get clearCircled =>
  //     context.isMaterialDesign ? Icons.clear : CupertinoIcons.clear_circled;

  // IconData get clearCircledSolid =>
  //     context.isMaterialDesign ? Icons.clear : CupertinoIcons.clear_circled_solid;

  /// Icons: Icons.clear : CupertinoIcons.clear_thick
  IconData get clearThick =>
      context.isMaterialDesign ? Icons.clear : CupertinoIcons.clear_thick;

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get clearThickCircled => context.isMaterialDesign
      ? Icons.cancel
      : CupertinoIcons.clear_thick_circled;

  // IconData get clock => context.isMaterialDesign ? Icons. : CupertinoIcons.clock;

  /// Icons: Icons.watch_later : CupertinoIcons.clock_solid
  IconData get clockSolid =>
      context.isMaterialDesign ? Icons.watch_later : CupertinoIcons.clock_solid;

  /// Icons: Icons.cloud_outlined : CupertinoIcons.cloud
  IconData get cloud =>
      context.isMaterialDesign ? Icons.cloud_outlined : CupertinoIcons.cloud;

  /// Icons: Icons.cloud : CupertinoIcons.cloud_fill
  IconData get cloudSolid =>
      context.isMaterialDesign ? Icons.cloud : CupertinoIcons.cloud_fill;

  /// Icons: Icons.cloud_download_outlined : CupertinoIcons.cloud_download
  IconData get cloudDownload => context.isMaterialDesign
      ? Icons.cloud_download_outlined
      : CupertinoIcons.cloud_download;

  /// Icons: Icons.cloud_download : CupertinoIcons.cloud_download_fill
  IconData get cloudDownloadSolid => context.isMaterialDesign
      ? Icons.cloud_download
      : CupertinoIcons.cloud_download_fill;

  /// Icons: Icons.cloud_upload_outlined : CupertinoIcons.cloud_upload
  IconData get cloudUpload => context.isMaterialDesign
      ? Icons.cloud_upload_outlined
      : CupertinoIcons.cloud_upload;

  /// Icons: Icons.cloud_upload : CupertinoIcons.cloud_upload_fill
  IconData get cloudUploadSolid => context.isMaterialDesign
      ? Icons.cloud_upload
      : CupertinoIcons.cloud_upload_fill;

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get collections =>
      context.isMaterialDesign ? Icons.collections : CupertinoIcons.collections;

  /// Icons: Icons.collections : CupertinoIcons.collections_solid
  IconData get collectionsSolid => context.isMaterialDesign
      ? Icons.collections
      : CupertinoIcons.collections_solid;

  /// Icons: Icons.chat_bubble : CupertinoIcons.conversation_bubble
  IconData get conversationBubble => context.isMaterialDesign
      ? Icons.chat_bubble
      : CupertinoIcons.conversation_bubble;

  /// Icons: Icons.chat_bubble_outline : CupertinoIcons.conversation_bubble
  IconData get conversationBubbleOutline => context.isMaterialDesign
      ? Icons.chat_bubble_outline
      : CupertinoIcons.conversation_bubble;

  // IconData get conversationBubbleSolid => context.isMaterialDesign
  //     ? Icons.chat_bubble
  //     : CupertinoIcons.conversation_bubble;

  /// Icons: Icons.create : CupertinoIcons.create
  IconData get create =>
      context.isMaterialDesign ? Icons.create : CupertinoIcons.create;

  // IconData get createSolid =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.create_solid;

  /// Icons: Icons.dehaze : CupertinoIcons.bars
  IconData get dehaze =>
      context.isMaterialDesign ? Icons.dehaze : CupertinoIcons.bars;

  /// Icons: Icons.delete : CupertinoIcons.delete
  IconData get delete =>
      context.isMaterialDesign ? Icons.delete : CupertinoIcons.delete;

  // IconData get deleteSimple =>
  //     context.isMaterialDesign ? Icons.delete : CupertinoIcons.delete_simple;

  /// Icons: Icons.delete : CupertinoIcons.delete_solid
  IconData get deleteSolid =>
      context.isMaterialDesign ? Icons.delete : CupertinoIcons.delete_solid;

  /// Icons: Icons.delete_outline : CupertinoIcons.delete
  IconData get deleteOutline =>
      context.isMaterialDesign ? Icons.delete_outline : CupertinoIcons.delete;

  /// Icons: Icons.done : CupertinoIcons.(custom)
  // IconData get done => context.isMaterialDesign
  //     ? Icons.done
  //     : const IconData(0xf383, not mapped in CupertinoIcons
  //         fontFamily: CupertinoIcons.iconFont,
  //         fontPackage: CupertinoIcons.iconFontPackage);

  // IconData get doubleMusicNote =>
  //     context.isMaterialDesign ? Icons.music_note : CupertinoIcons.double_music_note;

  /// Icons: Icons.arrow_downward : CupertinoIcons.down_arrow
  IconData get downArrow => context.isMaterialDesign
      ? Icons.arrow_downward
      : CupertinoIcons.down_arrow;

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get edit =>
      context.isMaterialDesign ? Icons.edit : CupertinoIcons.pencil;

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get ellipsis =>
      context.isMaterialDesign ? Icons.more_horiz : CupertinoIcons.ellipsis;

  /// Icons: Icons.error : CupertinoIcons.exclamationmark_circle_fill
  IconData get error => context.isMaterialDesign
      ? Icons.error
      : CupertinoIcons.exclamationmark_circle_fill;

  // IconData get eye => context.isMaterialDesign ? Icons. : CupertinoIcons.eye;

  /// Icons: Icons.visibility_off : CupertinoIcons.eye_slash
  IconData get eyeSlash => context.isMaterialDesign
      ? Icons.visibility_off_outlined
      : CupertinoIcons.eye_slash;

  /// Icons: Icons.visibility_off : CupertinoIcons.eye_slash
  IconData get eyeSlashSolid => context.isMaterialDesign
      ? Icons.visibility_off
      : CupertinoIcons.eye_slash_fill;

  /// Icons: Icons.visibility : CupertinoIcons.eye_solid
  IconData get eyeSolid =>
      context.isMaterialDesign ? Icons.visibility : CupertinoIcons.eye_solid;

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get favoriteSolid =>
      context.isMaterialDesign ? Icons.favorite : CupertinoIcons.heart_solid;

  /// Icons: Icons.favorite_border : CupertinoIcons.heart
  IconData get favoriteOutline =>
      context.isMaterialDesign ? Icons.favorite_border : CupertinoIcons.heart;

  /// Icons: Icons.flag : CupertinoIcons.flag
  IconData get flag =>
      context.isMaterialDesign ? Icons.flag : CupertinoIcons.flag;

  /// Icons: Icons.folder : CupertinoIcons.folder
  IconData get folder =>
      context.isMaterialDesign ? Icons.folder : CupertinoIcons.folder;

  /// Icons: Icons.folder_open : CupertinoIcons.folder_open
  IconData get folderOpen =>
      context.isMaterialDesign ? Icons.folder_open : CupertinoIcons.folder_open;

  /// Icons: Icons.folder : CupertinoIcons.folder_solid
  IconData get folderSolid =>
      context.isMaterialDesign ? Icons.folder : CupertinoIcons.folder_solid;

  /// Icons: Icons.arrow_forward : CupertinoIcons.forward
  IconData get forward =>
      context.isMaterialDesign ? Icons.arrow_forward : CupertinoIcons.forward;

  /// Icons: Icons.fullscreen : CupertinoIcons.fullscreen
  IconData get fullscreen =>
      context.isMaterialDesign ? Icons.fullscreen : CupertinoIcons.fullscreen;

  /// Icons:
  IconData get fullscreenExit => context.isMaterialDesign
      ? Icons.fullscreen_exit
      : CupertinoIcons.fullscreen_exit;

  /// Icons: Icons.gamepad : CupertinoIcons.game_controller
  IconData get gameController =>
      context.isMaterialDesign ? Icons.gamepad : CupertinoIcons.game_controller;

  /// Icons: Icons.games : CupertinoIcons.game_controller_solid
  IconData get gameControllerSolid => context.isMaterialDesign
      ? Icons.games
      : CupertinoIcons.game_controller_solid;

  // IconData get gear => context.isMaterialDesign ? Icons. : CupertinoIcons.gear;

  // IconData get gearBig =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.gear_big;

  /// Icons: Icons.settings : CupertinoIcons.gear_solid
  IconData get gearSolid =>
      context.isMaterialDesign ? Icons.settings : CupertinoIcons.gear_solid;

  /// Icons: Icons.group : CupertinoIcons.group
  IconData get group =>
      context.isMaterialDesign ? Icons.group : CupertinoIcons.group;

  /// Icons: Icons.group : CupertinoIcons.group_solid
  IconData get groupSolid =>
      context.isMaterialDesign ? Icons.group : CupertinoIcons.group_solid;

  // IconData get heart => context.isMaterialDesign ? Icons. : CupertinoIcons.heart;

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get heartSolid =>
      context.isMaterialDesign ? Icons.favorite : CupertinoIcons.heart_solid;

  /// Icons: Icons.help : CupertinoIcons.question_circle_fill
  IconData get help => context.isMaterialDesign
      ? Icons.help
      : CupertinoIcons.question_circle_fill;

  /// Icons: Icons.helpOutline : CupertinoIcons.question_circle
  IconData get helpOutline => context.isMaterialDesign
      ? Icons.help_outline
      : CupertinoIcons.question_circle;

  /// Icons: Icons.home : CupertinoIcons.home
  IconData get home =>
      context.isMaterialDesign ? Icons.home : CupertinoIcons.home;

  /// Icons: Icons.info : CupertinoIcons.info
  IconData get info =>
      context.isMaterialDesign ? Icons.info : CupertinoIcons.info;

  // IconData get labFlask =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.lab_flask;

  // IconData get labFlaskSolid =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.lab_flask_solid;

  /// Icons: Icons.chevron_left : CupertinoIcons.left_chevron
  IconData get leftChevron => context.isMaterialDesign
      ? Icons.chevron_left
      : CupertinoIcons.left_chevron;

  /// Icons: Icons.location_on : CupertinoIcons.location
  IconData get location =>
      context.isMaterialDesign ? Icons.location_on : CupertinoIcons.location;

  /// Icons: Icons.location_on : CupertinoIcons.location_solid
  IconData get locationSolid => context.isMaterialDesign
      ? Icons.location_on
      : CupertinoIcons.location_solid;

  /// Icons: Icons.loop : CupertinoIcons.loop
  IconData get loop =>
      context.isMaterialDesign ? Icons.loop : CupertinoIcons.loop;

  // IconData get loopThick =>
  //     context.isMaterialDesign ? Icons.loop : CupertinoIcons.loop_thick;

  /// Icons: Icons.mail : CupertinoIcons.mail
  IconData get mail =>
      context.isMaterialDesign ? Icons.mail : CupertinoIcons.mail;

  /// Icons: Icons.mail : CupertinoIcons.mail_solid
  IconData get mailSolid =>
      context.isMaterialDesign ? Icons.mail : CupertinoIcons.mail_solid;

  /// Icons: Icons.mail_outline : CupertinoIcons.mail
  IconData get mailOutline =>
      context.isMaterialDesign ? Icons.mail_outline : CupertinoIcons.mail;

  /// Icons: Icons.mic : CupertinoIcons.mic
  IconData get mic => context.isMaterialDesign ? Icons.mic : CupertinoIcons.mic;

  /// Icons: Icons.mic_off : CupertinoIcons.mic_off
  IconData get micOff =>
      context.isMaterialDesign ? Icons.mic_off : CupertinoIcons.mic_off;

  /// Icons: Icons.mic_none : CupertinoIcons.mic
  IconData get micOutline =>
      context.isMaterialDesign ? Icons.mic_none : CupertinoIcons.mic;

  /// Icons: Icons.mic : CupertinoIcons.mic_solid
  IconData get micSolid =>
      context.isMaterialDesign ? Icons.mic : CupertinoIcons.mic_solid;

  // IconData get minusCircled =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.minus_circled;

  /// Icons: Icons.music_note : CupertinoIcons.music_note
  IconData get musicNote =>
      context.isMaterialDesign ? Icons.music_note : CupertinoIcons.music_note;

  // IconData get news => context.isMaterialDesign ? Icons. : CupertinoIcons.news;

  // IconData get newsSolid =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.news_solid;

  /// Icons: Icons.lock : CupertinoIcons.padlock
  IconData get padLock =>
      context.isMaterialDesign ? Icons.lock : CupertinoIcons.padlock;

  /// Icons: Icons.lock_outline : CupertinoIcons.padlock
  IconData get padlockOutline =>
      context.isMaterialDesign ? Icons.lock_outline : CupertinoIcons.padlock;

  /// Icons: Icons.lock : CupertinoIcons.padlock_solid
  IconData get padlockSolid =>
      context.isMaterialDesign ? Icons.lock : CupertinoIcons.padlock_solid;

  /// Icons: Icons.pause : CupertinoIcons.pause
  IconData get pause =>
      context.isMaterialDesign ? Icons.pause : CupertinoIcons.pause;

  // IconData get pauseSolid => context.isMaterialDesign
  //     ? Icons.pause_circle_filled
  //     : CupertinoIcons.pause_solid;

  // IconData get paw => context.isMaterialDesign ? Icons. : CupertinoIcons.paw;

  // Icons: Icons.pets : CupertinoIcons.paw_solid
  IconData get pawSolid =>
      context.isMaterialDesign ? Icons.pets : CupertinoIcons.paw_solid;

  // Icons: Icons.edit : CupertinoIcons.pen
  IconData get pen =>
      context.isMaterialDesign ? Icons.edit : CupertinoIcons.pen;

  // IconData get pencil =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.pencil;

  /// Icons: Icons.person : CupertinoIcons.person
  IconData get person =>
      context.isMaterialDesign ? Icons.person : CupertinoIcons.person;

  /// Icons: Icons.person_add : CupertinoIcons.person_add
  IconData get personAdd =>
      context.isMaterialDesign ? Icons.person_add : CupertinoIcons.person_add;

  /// Icons: Icons.person_add : CupertinoIcons.person_add_solid
  IconData get personAddSolid => context.isMaterialDesign
      ? Icons.person_add
      : CupertinoIcons.person_add_solid;

  /// Icons: Icons.person_outline : CupertinoIcons.person
  IconData get personOutline =>
      context.isMaterialDesign ? Icons.person_outline : CupertinoIcons.person;

  /// Icons: Icons.person : CupertinoIcons.person_solid
  IconData get personSolid =>
      context.isMaterialDesign ? Icons.person : CupertinoIcons.person_solid;

  /// Icons: Icons.phone : CupertinoIcons.phone
  IconData get phone =>
      context.isMaterialDesign ? Icons.phone : CupertinoIcons.phone;

  /// Icons: Icons.phone : CupertinoIcons.phone_solid
  IconData get phoneSolid =>
      context.isMaterialDesign ? Icons.phone : CupertinoIcons.phone_solid;

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera
  IconData get photoCamera => context.isMaterialDesign
      ? Icons.photo_camera
      : CupertinoIcons.photo_camera;

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera_solid
  IconData get photoCameraSolid => context.isMaterialDesign
      ? Icons.photo_camera
      : CupertinoIcons.photo_camera_solid;

  /// Icons: Icons.photo_library_outlined : CupertinoIcons.photo_on_rectangle
  IconData get photoLibrary => context.isMaterialDesign
      ? Icons.photo_library_outlined
      : CupertinoIcons.photo_on_rectangle;

  /// Icons: Icons.photo_library : CupertinoIcons.photo_fill_on_rectangle_fill
  IconData get photoLibrarySolid => context.isMaterialDesign
      ? Icons.photo_library
      : CupertinoIcons.photo_fill_on_rectangle_fill;

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow
  IconData get playArrow =>
      context.isMaterialDesign ? Icons.play_arrow : CupertinoIcons.play_arrow;

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow_solid
  IconData get playArrowSolid => context.isMaterialDesign
      ? Icons.play_arrow
      : CupertinoIcons.play_arrow_solid;

  /// Icons: Icons.play_circle_outline : CupertinoIcons.play_circle
  IconData get playCircle => context.isMaterialDesign
      ? Icons.play_circle_outline
      : CupertinoIcons.play_circle;

  /// Icons: Icons.play_circle : CupertinoIcons.play_circle_fill
  IconData get playCircleSolid => context.isMaterialDesign
      ? Icons.play_circle
      : CupertinoIcons.play_circle_fill;

  // IconData get plusCircled =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.plus_circled;

  // IconData get profileCircled =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.profile_circled;

  /// Icons: Icons.refresh : CupertinoIcons.refresh
  IconData get refresh =>
      context.isMaterialDesign ? Icons.refresh : CupertinoIcons.refresh;

  /// Icons: Icons.refresh : CupertinoIcons.refresh_bold
  IconData get refreshBold =>
      context.isMaterialDesign ? Icons.refresh : CupertinoIcons.refresh_bold;

  // IconData get refreshCircled =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.refresh_circled;

  // IconData get refreshCircledSolid =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.refresh_circled_solid;

  // IconData get refreshThick =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.refresh_thick;

  // IconData get refreshThin =>
  //     context.isMaterialDesign ? Icons.flag : CupertinoIcons.refresh_thin;

  /// Icons: Icons.remove : CupertinoIcons.minus
  IconData get remove =>
      context.isMaterialDesign ? Icons.remove : CupertinoIcons.minus;

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle
  IconData get removeCircled => context.isMaterialDesign
      ? Icons.remove_circle
      : CupertinoIcons.minus_circle;

  /// Icons: Icons.remove_circle_outline : CupertinoIcons.minus_circle
  IconData get removeCircledOutline => context.isMaterialDesign
      ? Icons.remove_circle_outline
      : CupertinoIcons.minus_circle;

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle_fill
  IconData get removeCircledSolid => context.isMaterialDesign
      ? Icons.remove_circle
      : CupertinoIcons.minus_circle_fill;

  /// Icons: Icons.reply : CupertinoIcons.reply
  IconData get reply =>
      context.isMaterialDesign ? Icons.reply : CupertinoIcons.reply;

  /// Icons: Icons.reply_all : CupertinoIcons.reply_all
  IconData get replyAll =>
      context.isMaterialDesign ? Icons.reply_all : CupertinoIcons.reply_all;

  // IconData get replyThickSolid =>
  //     context.isMaterialDesign ? Icons.reply : CupertinoIcons.reply_thick_solid;

  // IconData get restart =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.restart;

  /// Icons: Icons.chevron_right : CupertinoIcons.right_chevron
  IconData get rightChevron => context.isMaterialDesign
      ? Icons.chevron_right
      : CupertinoIcons.right_chevron;

  /// Icons: Icons.search : CupertinoIcons.search
  IconData get search =>
      context.isMaterialDesign ? Icons.search : CupertinoIcons.search;

  /// Icons: Icons.settings : CupertinoIcons.settings
  IconData get settings =>
      context.isMaterialDesign ? Icons.settings : CupertinoIcons.settings;

  /// Icons: Icons.settings : CupertinoIcons.settings_solid
  IconData get settingsSolid =>
      context.isMaterialDesign ? Icons.settings : CupertinoIcons.settings_solid;

  /// Icons: Icons.share : CupertinoIcons.share
  IconData get share =>
      context.isMaterialDesign ? Icons.share : CupertinoIcons.share;

  /// Icons: Icons.share : CupertinoIcons.share_solid
  IconData get shareSolid =>
      context.isMaterialDesign ? Icons.share : CupertinoIcons.share_solid;

  // IconData get shareUp =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.share_up;

  /// Icons: Icons.shopping_cart : CupertinoIcons.shopping_cart
  IconData get shoppingCart => context.isMaterialDesign
      ? Icons.shopping_cart
      : CupertinoIcons.shopping_cart;

  /// Icons: Icons.shuffle : CupertinoIcons.shuffle
  IconData get shuffle =>
      context.isMaterialDesign ? Icons.shuffle : CupertinoIcons.shuffle;

  // IconData get shuffleMedium =>
  //     context.isMaterialDesign ? Icons.share : CupertinoIcons.shuffle_medium;

  // IconData get shuffleThick =>
  //     context.isMaterialDesign ? Icons.share : CupertinoIcons.shuffle_thick;

  /// Icons: Icons.star : CupertinoIcons.(custom)
  IconData get star =>
      context.isMaterialDesign ? Icons.star : CupertinoIcons.star;

  /// Icons: Icons.stars : CupertinoIcons.(custom)
  IconData get starCircleSolid =>
      context.isMaterialDesign ? Icons.stars : CupertinoIcons.star_circle_fill;

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera
  IconData get switchCamera => context.isMaterialDesign
      ? Icons.switch_camera
      : CupertinoIcons.switch_camera;

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera_solid
  IconData get switchCameraSolid => context.isMaterialDesign
      ? Icons.switch_camera
      : CupertinoIcons.switch_camera_solid;

  /// Icons: Icons.label : CupertinoIcons.tag
  IconData get tag =>
      context.isMaterialDesign ? Icons.label : CupertinoIcons.tag;

  /// Icons: Icons.label_outline : CupertinoIcons.tag
  IconData get tagOutline =>
      context.isMaterialDesign ? Icons.label_outline : CupertinoIcons.tag;

  /// Icons: Icons.label : CupertinoIcons.tag_solid
  IconData get tagSolid =>
      context.isMaterialDesign ? Icons.label : CupertinoIcons.tag_solid;

  // IconData get tagsSolid =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.tags_solid;

  /// Icons: Icons.thumb_down : CupertinoIcons.hand_thumbsdown_fill
  IconData get thumbDown => context.isMaterialDesign
      ? Icons.thumb_down
      : CupertinoIcons.hand_thumbsdown_fill;

  /// Icons: Icons.thumb_down_outlined : CupertinoIcons.hand_thumbsdown
  IconData get thumbDownOutlined => context.isMaterialDesign
      ? Icons.thumb_down_outlined
      : CupertinoIcons.hand_thumbsdown;

  /// Icons: Icons.thumb_up : CupertinoIcons.hand_thumbsup_fill
  IconData get thumbUp => context.isMaterialDesign
      ? Icons.thumb_up
      : CupertinoIcons.hand_thumbsup_fill;

  /// Icons: Icons.thumb_up_outlined : CupertinoIcons.hand_thumbsup
  IconData get thumbUpOutlined => context.isMaterialDesign
      ? Icons.thumb_up_outlined
      : CupertinoIcons.hand_thumbsup;

  /// Icons: Icons.schedule : CupertinoIcons.time
  IconData get time =>
      context.isMaterialDesign ? Icons.schedule : CupertinoIcons.time;

  /// Icons: Icons.watch_later : CupertinoIcons.time_solid
  IconData get timeSolid =>
      context.isMaterialDesign ? Icons.watch_later : CupertinoIcons.time_solid;

  /// Icons: Icons.tram : CupertinoIcons.train_style_one
  IconData get train =>
      context.isMaterialDesign ? Icons.tram : CupertinoIcons.train_style_one;

  // IconData get trainStyleTwo =>
  //     context.isMaterialDesign ? Icons. : CupertinoIcons.train_style_two;

  /// Icons: Icons.arrow_upward : CupertinoIcons.up_arrow
  IconData get upArrow =>
      context.isMaterialDesign ? Icons.arrow_upward : CupertinoIcons.up_arrow;

  /// Icons: Icons.videocam : CupertinoIcons.video_camer
  IconData get videoCamera =>
      context.isMaterialDesign ? Icons.videocam : CupertinoIcons.video_camera;

  /// Icons: Icons.videocam : CupertinoIcons.video_camera_solid
  IconData get videoCameraSolid => context.isMaterialDesign
      ? Icons.videocam
      : CupertinoIcons.video_camera_solid;

  /// Icons: Icons.volume_down : CupertinoIcons.volume_down
  IconData get volumeDown =>
      context.isMaterialDesign ? Icons.volume_down : CupertinoIcons.volume_down;

  /// Icons: Icons.volume_mute : CupertinoIcons.volume_mute
  IconData get volumeMute =>
      context.isMaterialDesign ? Icons.volume_mute : CupertinoIcons.volume_mute;

  /// Icons: Icons.volume_off : CupertinoIcons.volume_off
  IconData get volumeOff =>
      context.isMaterialDesign ? Icons.volume_off : CupertinoIcons.volume_off;

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  IconData get volumeUp =>
      context.isMaterialDesign ? Icons.volume_up : CupertinoIcons.volume_up;

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  // IconData get work => context.isMaterialDesign
  //     ? Icons.work
  //     : const IconData(0xf3ee, not mapped in CupertinoIcons
  //         fontFamily: CupertinoIcons.iconFont,
  //         fontPackage: CupertinoIcons.iconFontPackage);

  /// Icons: Icons.wifi : CupertinoIcons.wifi
  IconData get wifi =>
      context.isMaterialDesign ? Icons.wifi : CupertinoIcons.wifi;

  /// Icons: Icons.wifi_off : CupertinoIcons.wifi_slash
  IconData get wifiOff =>
      context.isMaterialDesign ? Icons.wifi_off : CupertinoIcons.wifi_slash;
}
