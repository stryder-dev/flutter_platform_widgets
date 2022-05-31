import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'platform.dart';
import 'platform_provider.dart';

extension PlatformIconsExt on BuildContext {
  /// Render either a Material or Cupertino icon based on the platform
  PlatformIcons get platformIcons => PlatformIcons(this);

  IconData platformIcon({
    required IconData material,
    required IconData cupertino,
    IconData? Function(PlatformTarget)? custom,
  }) {
    if (isMaterial(this)) {
      return material;
    }
    if (isCupertino(this)) {
      return cupertino;
    }
    if (isCustom(this)) {
      final p = platform(this);

      final icon = custom?.call(p);
      if (icon != null) {
        return icon;
      }
    }

    if (isMaterialFallback(this)) {
      return material;
    }
    if (isCupertino(this)) {
      return cupertino;
    }

    throw UnsupportedError(
        'This platform is not supported: $defaultTargetPlatform');
  }
}

class PlatformIcons {
  PlatformIcons(this.context);

  final BuildContext context;

  CustomIconBuilder? _customIconData() {
    final provider = PlatformProvider.of(context);
    final currentPlatform = platform(context);
    final platformBuilder = provider?.customWidgetBuilders?[currentPlatform];

    return platformBuilder?.iconBuilder;
  }

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle
  IconData get accountCircle => context.platformIcon(
      material: Icons.account_circle_outlined,
      cupertino: CupertinoIcons.person_crop_circle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.accountCircle?.call(platformTarget));

  /// Icons: Icons.account_circle : CupertinoIcons.person_crop_circle_fill
  IconData get accountCircleSolid => context.platformIcon(
      material: Icons.account_circle,
      cupertino: CupertinoIcons.person_crop_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.accountCircleSolid?.call(platformTarget));

  /// Icons: Icons.add : CupertinoIcons.add
  IconData get add => context.platformIcon(
      material: Icons.add,
      cupertino: CupertinoIcons.add,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.add?.call(platformTarget));

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled
  IconData get addCircled => context.platformIcon(
      material: Icons.add_circle,
      cupertino: CupertinoIcons.add_circled,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.addCircled?.call(platformTarget));

  /// Icons: Icons.add_circle_outline : CupertinoIcons.add_circled
  IconData get addCircledOutline => context.platformIcon(
      material: Icons.add_circle_outline,
      cupertino: CupertinoIcons.add_circled,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.addCircledOutline?.call(platformTarget));

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled_solid
  IconData get addCircledSolid => context.platformIcon(
      material: Icons.add_circle,
      cupertino: CupertinoIcons.add_circled_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.addCircledSolid?.call(platformTarget));

  /// Icons: Icons.arrow_back : CupertinoIcons.back
  IconData get back => context.platformIcon(
      material: Icons.arrow_back,
      cupertino: CupertinoIcons.back,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.back?.call(platformTarget));

  // IconData get battery25Percent =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.battery_25_percent;

  // IconData get battery75Percent =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.battery_75_percent;

  /// Icons: Icons.battery_charging_full : CupertinoIcons.battery_charging
  IconData get batteryCharging => context.platformIcon(
      material: Icons.battery_charging_full,
      cupertino: CupertinoIcons.battery_charging,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.batteryCharging?.call(platformTarget));

  /// Icons: Icons.battery_alert : CupertinoIcons.battery_empty
  IconData get batteryEmpty => context.platformIcon(
      material: Icons.battery_alert,
      cupertino: CupertinoIcons.battery_empty,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.batteryEmpty?.call(platformTarget));

  /// Icons: Icons.battery_full : CupertinoIcons.battery_full
  IconData get batteryFull => context.platformIcon(
      material: Icons.battery_full,
      cupertino: CupertinoIcons.battery_full,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.batteryFull?.call(platformTarget));

  // IconData get bell => isMaterial(context) ? Icons. : CupertinoIcons.bell;

  // IconData get bellSolid =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.bell_solid;

  /// Icons: Icons.bluetooth : CupertinoIcons.bluetooth
  IconData get bluetooth => context.platformIcon(
      material: Icons.bluetooth,
      cupertino: CupertinoIcons.bluetooth,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.bluetooth?.call(platformTarget));

  /// Icons: Icons.book : CupertinoIcons.book
  IconData get book => context.platformIcon(
      material: Icons.book,
      cupertino: CupertinoIcons.book,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.book?.call(platformTarget));

  // IconData get bookSolid =>
  //     isMaterial(context) ? Icons.book : CupertinoIcons.book_solid;

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark
  IconData get bookmark => context.platformIcon(
      material: Icons.bookmark,
      cupertino: CupertinoIcons.bookmark,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.bookmark?.call(platformTarget));

  /// Icons: Icons.bookmark_border : CupertinoIcons.bookmark
  IconData get bookmarkOutline => context.platformIcon(
      material: Icons.bookmark_border,
      cupertino: CupertinoIcons.bookmark,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.bookmarkOutline?.call(platformTarget));

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark_solid
  IconData get bookmarkSolid => context.platformIcon(
      material: Icons.bookmark,
      cupertino: CupertinoIcons.bookmark_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.bookmarkSolid?.call(platformTarget));

  /// Icons: Icons.brightness_low : CupertinoIcons.brightness
  IconData get brightness => context.platformIcon(
      material: Icons.brightness_low,
      cupertino: CupertinoIcons.brightness,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.brightness?.call(platformTarget));

  /// Icons: Icons.brightness_high : CupertinoIcons.brightness_solid
  IconData get brightnessSolid => context.platformIcon(
      material: Icons.brightness_high,
      cupertino: CupertinoIcons.brightness_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.brightnessSolid?.call(platformTarget));

  /// Icons: Icons.directions_bus : CupertinoIcons.bus
  IconData get bus => context.platformIcon(
      material: Icons.directions_bus,
      cupertino: CupertinoIcons.bus,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.bus?.call(platformTarget));

  /// Icons: Icons.directions_car : CupertinoIcons.car
  IconData get car => context.platformIcon(
      material: Icons.directions_car,
      cupertino: CupertinoIcons.car,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.car?.call(platformTarget));
  // IconData get carDetailed =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.car_detailed;

  /// Icons: Icons.check_box_outline_blank_rounded : CupertinoIcons.square
  IconData get checkBoxBlankOutlineRounded => context.platformIcon(
      material: Icons.check_box_outline_blank_rounded,
      cupertino: CupertinoIcons.square,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.checkBoxBlankOutlineRounded?.call(platformTarget));

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.minus_square
  IconData get checkBoxIndeterminateOutlineRounded => context.platformIcon(
      material: Icons.indeterminate_check_box_outlined,
      cupertino: CupertinoIcons.minus_square,
      custom: (PlatformTarget platformTarget) => _customIconData()
          ?.checkBoxIndeterminateOutlineRounded
          ?.call(platformTarget));

  /// Icons: Icons.indeterminate_check_box_outlined : CupertinoIcons.checkmark_square
  IconData get checkBoxCheckedOutlineRounded => context.platformIcon(
      material: Icons.check_box_outlined,
      cupertino: CupertinoIcons.checkmark_square,
      custom: (PlatformTarget platformTarget) => _customIconData()
          ?.checkBoxCheckedOutlineRounded
          ?.call(platformTarget));

  /// Icons: Icons.check : CupertinoIcons.check_mark
  IconData get checkMark => context.platformIcon(
      material: Icons.check,
      cupertino: CupertinoIcons.check_mark,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.checkMark?.call(platformTarget));

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircled => context.platformIcon(
      material: Icons.check_circle,
      cupertino: CupertinoIcons.check_mark_circled,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.checkMarkCircled?.call(platformTarget));

  /// Icons: Icons.check_circle_outline : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircledOutline => context.platformIcon(
      material: Icons.check_circle_outline,
      cupertino: CupertinoIcons.check_mark_circled,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.checkMarkCircledOutline?.call(platformTarget));

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled_solid
  IconData get checkMarkCircledSolid => context.platformIcon(
      material: Icons.check_circle,
      cupertino: CupertinoIcons.check_mark_circled_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.checkMarkCircledSolid?.call(platformTarget));

  // IconData get circle =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.circle;

  // IconData get circleFilled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.circle_filled;

  /// Icons: Icons.clear : CupertinoIcons.clear
  IconData get clear => context.platformIcon(
      material: Icons.clear,
      cupertino: CupertinoIcons.clear,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.clear?.call(platformTarget));

  // IconData get clearCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.clear_circled;

  // IconData get clearCircledSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.clear_circled_solid;

  /// Icons: Icons.clear : CupertinoIcons.clear_thick
  IconData get clearThick => context.platformIcon(
      material: Icons.clear,
      cupertino: CupertinoIcons.clear_thick,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.clearThick?.call(platformTarget));

  /// Icons: Icons.cancel : CupertinoIcons.clear_thick_circled
  IconData get clearThickCircled => context.platformIcon(
      material: Icons.cancel,
      cupertino: CupertinoIcons.clear_thick_circled,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.clearThickCircled?.call(platformTarget));

  // IconData get clock => isMaterial(context) ? Icons. : CupertinoIcons.clock;

  /// Icons: Icons.watch_later : CupertinoIcons.clock_solid
  IconData get clockSolid => context.platformIcon(
      material: Icons.watch_later,
      cupertino: CupertinoIcons.clock_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.clockSolid?.call(platformTarget));

  /// Icons: Icons.cloud_outlined : CupertinoIcons.cloud
  IconData get cloud => context.platformIcon(
      material: Icons.cloud_outlined,
      cupertino: CupertinoIcons.cloud,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloud?.call(platformTarget));

  /// Icons: Icons.cloud : CupertinoIcons.cloud_fill
  IconData get cloudSolid => context.platformIcon(
      material: Icons.cloud,
      cupertino: CupertinoIcons.cloud_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloudSolid?.call(platformTarget));

  /// Icons: Icons.cloud_download_outlined : CupertinoIcons.cloud_download
  IconData get cloudDownload => context.platformIcon(
      material: Icons.cloud_download_outlined,
      cupertino: CupertinoIcons.cloud_download,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloudDownload?.call(platformTarget));

  /// Icons: Icons.cloud_download : CupertinoIcons.cloud_download_fill
  IconData get cloudDownloadSolid => context.platformIcon(
      material: Icons.cloud_download,
      cupertino: CupertinoIcons.cloud_download_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloudDownloadSolid?.call(platformTarget));

  /// Icons: Icons.cloud_upload_outlined : CupertinoIcons.cloud_upload
  IconData get cloudUpload => context.platformIcon(
      material: Icons.cloud_upload_outlined,
      cupertino: CupertinoIcons.cloud_upload,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloudUpload?.call(platformTarget));

  /// Icons: Icons.cloud_upload : CupertinoIcons.cloud_upload_fill
  IconData get cloudUploadSolid => context.platformIcon(
      material: Icons.cloud_upload,
      cupertino: CupertinoIcons.cloud_upload_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.cloudUploadSolid?.call(platformTarget));

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get collections => context.platformIcon(
      material: Icons.collections,
      cupertino: CupertinoIcons.collections,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.collections?.call(platformTarget));

  /// Icons: Icons.collections : CupertinoIcons.collections_solid
  IconData get collectionsSolid => isMaterial(context)
      ? Icons.collections
      : CupertinoIcons.collections_solid;

  /// Icons: Icons.chat_bubble : CupertinoIcons.conversation_bubble
  IconData get conversationBubble => context.platformIcon(
      material: Icons.chat_bubble,
      cupertino: CupertinoIcons.conversation_bubble,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.conversationBubble?.call(platformTarget));

  /// Icons: Icons.chat_bubble_outline : CupertinoIcons.conversation_bubble
  IconData get conversationBubbleOutline => context.platformIcon(
      material: Icons.chat_bubble_outline,
      cupertino: CupertinoIcons.conversation_bubble,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.conversationBubbleOutline?.call(platformTarget));

  // IconData get conversationBubbleSolid => isMaterial(context)
  //     ? Icons.chat_bubble
  //     : CupertinoIcons.conversation_bubble;

  /// Icons: Icons.create : CupertinoIcons.create
  IconData get create => context.platformIcon(
      material: Icons.create,
      cupertino: CupertinoIcons.create,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.create?.call(platformTarget));

  // IconData get createSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.create_solid;

  /// Icons: Icons.dehaze : CupertinoIcons.bars
  IconData get dehaze => context.platformIcon(
      material: Icons.dehaze,
      cupertino: CupertinoIcons.bars,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.dehaze?.call(platformTarget));

  /// Icons: Icons.delete : CupertinoIcons.delete
  IconData get delete => context.platformIcon(
      material: Icons.delete,
      cupertino: CupertinoIcons.delete,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.delete?.call(platformTarget));

  // IconData get deleteSimple =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.delete_simple;

  /// Icons: Icons.delete : CupertinoIcons.delete_solid
  IconData get deleteSolid => context.platformIcon(
      material: Icons.delete,
      cupertino: CupertinoIcons.delete_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.deleteSolid?.call(platformTarget));

  /// Icons: Icons.delete_outline : CupertinoIcons.delete
  IconData get deleteOutline => context.platformIcon(
      material: Icons.delete_outline,
      cupertino: CupertinoIcons.delete,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.deleteOutline?.call(platformTarget));

  /// Icons: Icons.done : CupertinoIcons.(custom)
  // IconData get done => isMaterial(context)
  //     ? Icons.done
  //     : const IconData(0xf383, not mapped in CupertinoIcons
  //         fontFamily: CupertinoIcons.iconFont,
  //         fontPackage: CupertinoIcons.iconFontPackage);

  // IconData get doubleMusicNote =>
  //     isMaterial(context) ? Icons.music_note : CupertinoIcons.double_music_note;

  /// Icons: Icons.arrow_downward : CupertinoIcons.down_arrow
  IconData get downArrow => context.platformIcon(
      material: Icons.arrow_downward,
      cupertino: CupertinoIcons.down_arrow,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.downArrow?.call(platformTarget));

  /// Icons: Icons.edit : CupertinoIcons.pencil
  IconData get edit => context.platformIcon(
      material: Icons.edit,
      cupertino: CupertinoIcons.pencil,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.edit?.call(platformTarget));

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get ellipsis => context.platformIcon(
      material: Icons.more_horiz,
      cupertino: CupertinoIcons.ellipsis,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.ellipsis?.call(platformTarget));

  /// Icons: Icons.error : CupertinoIcons.exclamationmark_circle_fill
  IconData get error => context.platformIcon(
      material: Icons.error,
      cupertino: CupertinoIcons.exclamationmark_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.error?.call(platformTarget));

  // IconData get eye => isMaterial(context) ? Icons. : CupertinoIcons.eye;

  /// Icons: Icons.visibility_off_outlined : CupertinoIcons.eye_slash
  IconData get eyeSlash => context.platformIcon(
      material: Icons.visibility_off_outlined,
      cupertino: CupertinoIcons.eye_slash,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.eyeSlash?.call(platformTarget));

  /// Icons: Icons.visibility_off : CupertinoIcons.eye_slash_fill
  IconData get eyeSlashSolid => context.platformIcon(
      material: Icons.visibility_off,
      cupertino: CupertinoIcons.eye_slash_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.eyeSlashSolid?.call(platformTarget));

  /// Icons: Icons.visibility : CupertinoIcons.eye_solid
  IconData get eyeSolid => context.platformIcon(
      material: Icons.visibility,
      cupertino: CupertinoIcons.eye_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.eyeSolid?.call(platformTarget));

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get favoriteSolid => context.platformIcon(
      material: Icons.favorite,
      cupertino: CupertinoIcons.heart_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.favoriteSolid?.call(platformTarget));

  /// Icons: Icons.favorite_border : CupertinoIcons.heart
  IconData get favoriteOutline => context.platformIcon(
      material: Icons.favorite_border,
      cupertino: CupertinoIcons.heart,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.favoriteOutline?.call(platformTarget));

  /// Icons: Icons.flag : CupertinoIcons.flag
  IconData get flag => context.platformIcon(
      material: Icons.flag,
      cupertino: CupertinoIcons.flag,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.flag?.call(platformTarget));

  /// Icons: Icons.folder : CupertinoIcons.folder
  IconData get folder => context.platformIcon(
      material: Icons.folder,
      cupertino: CupertinoIcons.folder,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.folder?.call(platformTarget));

  /// Icons: Icons.folder_open : CupertinoIcons.folder_open
  IconData get folderOpen => context.platformIcon(
      material: Icons.folder_open,
      cupertino: CupertinoIcons.folder_open,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.folderOpen?.call(platformTarget));

  /// Icons: Icons.folder : CupertinoIcons.folder_solid
  IconData get folderSolid => context.platformIcon(
      material: Icons.folder,
      cupertino: CupertinoIcons.folder_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.folder?.call(platformTarget));

  /// Icons: Icons.arrow_forward : CupertinoIcons.forward
  IconData get forward => context.platformIcon(
      material: Icons.arrow_forward,
      cupertino: CupertinoIcons.forward,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.forward?.call(platformTarget));

  /// Icons: Icons.fullscreen : CupertinoIcons.fullscreen
  IconData get fullscreen => context.platformIcon(
      material: Icons.fullscreen,
      cupertino: CupertinoIcons.fullscreen,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.fullscreen?.call(platformTarget));

  /// Icons: Icons.fullscreen_exit : CupertinoIcons.fullscreen_exit
  IconData get fullscreenExit => context.platformIcon(
      material: Icons.fullscreen_exit,
      cupertino: CupertinoIcons.fullscreen_exit,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.fullscreenExit?.call(platformTarget));

  /// Icons: Icons.gamepad : CupertinoIcons.game_controller
  IconData get gameController => context.platformIcon(
      material: Icons.gamepad,
      cupertino: CupertinoIcons.game_controller,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.gameController?.call(platformTarget));

  /// Icons: Icons.games : CupertinoIcons.game_controller_solid
  IconData get gameControllerSolid => context.platformIcon(
      material: Icons.games,
      cupertino: CupertinoIcons.game_controller_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.gameControllerSolid?.call(platformTarget));

  // IconData get gear => isMaterial(context) ? Icons. : CupertinoIcons.gear;

  // IconData get gearBig =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.gear_big;

  /// Icons: Icons.settings : CupertinoIcons.gear_solid
  IconData get gearSolid => context.platformIcon(
      material: Icons.settings,
      cupertino: CupertinoIcons.gear_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.gearSolid?.call(platformTarget));

  /// Icons: Icons.group : CupertinoIcons.group
  IconData get group => context.platformIcon(
      material: Icons.group,
      cupertino: CupertinoIcons.group,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.group?.call(platformTarget));

  /// Icons: Icons.group : CupertinoIcons.group_solid
  IconData get groupSolid => context.platformIcon(
      material: Icons.group,
      cupertino: CupertinoIcons.group_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.groupSolid?.call(platformTarget));

  // IconData get heart => isMaterial(context) ? Icons. : CupertinoIcons.heart;

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get heartSolid => context.platformIcon(
      material: Icons.favorite,
      cupertino: CupertinoIcons.heart_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.heartSolid?.call(platformTarget));

  /// Icons: Icons.help : CupertinoIcons.question_circle_fill
  IconData get help => context.platformIcon(
      material: Icons.help,
      cupertino: CupertinoIcons.question_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.help?.call(platformTarget));

  /// Icons: Icons.helpOutline : CupertinoIcons.question_circle
  IconData get helpOutline => context.platformIcon(
      material: Icons.help_outline,
      cupertino: CupertinoIcons.question_circle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.helpOutline?.call(platformTarget));

  /// Icons: Icons.home : CupertinoIcons.home
  IconData get home => context.platformIcon(
      material: Icons.home,
      cupertino: CupertinoIcons.home,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.home?.call(platformTarget));

  /// Icons: Icons.info : CupertinoIcons.info
  IconData get info => context.platformIcon(
      material: Icons.info,
      cupertino: CupertinoIcons.info,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.info?.call(platformTarget));

  // IconData get labFlask =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.lab_flask;

  // IconData get labFlaskSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.lab_flask_solid;

  /// Icons: Icons.chevron_left : CupertinoIcons.left_chevron
  IconData get leftChevron => context.platformIcon(
      material: Icons.chevron_left,
      cupertino: CupertinoIcons.left_chevron,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.leftChevron?.call(platformTarget));

  /// Icons: Icons.location_on : CupertinoIcons.location
  IconData get location => context.platformIcon(
      material: Icons.location_on,
      cupertino: CupertinoIcons.location,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.location?.call(platformTarget));

  /// Icons: Icons.location_on : CupertinoIcons.location_solid
  IconData get locationSolid => context.platformIcon(
      material: Icons.location_on,
      cupertino: CupertinoIcons.location_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.locationSolid?.call(platformTarget));

  /// Icons: Icons.loop : CupertinoIcons.loop
  IconData get loop => context.platformIcon(
      material: Icons.loop,
      cupertino: CupertinoIcons.loop,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.loop?.call(platformTarget));

  // IconData get loopThick =>
  //     isMaterial(context) ? Icons.loop : CupertinoIcons.loop_thick;

  /// Icons: Icons.mail : CupertinoIcons.mail
  IconData get mail => context.platformIcon(
      material: Icons.mail,
      cupertino: CupertinoIcons.mail,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.mail?.call(platformTarget));

  /// Icons: Icons.mail : CupertinoIcons.mail_solid
  IconData get mailSolid => context.platformIcon(
      material: Icons.mail,
      cupertino: CupertinoIcons.mail_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.mailSolid?.call(platformTarget));

  /// Icons: Icons.mail_outline : CupertinoIcons.mail
  IconData get mailOutline => context.platformIcon(
      material: Icons.mail_outline,
      cupertino: CupertinoIcons.mail,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.mailOutline?.call(platformTarget));

  /// Icons: Icons.mic : CupertinoIcons.mic
  IconData get mic => context.platformIcon(
      material: Icons.mic,
      cupertino: CupertinoIcons.mic,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.mic?.call(platformTarget));

  /// Icons: Icons.mic_off : CupertinoIcons.mic_off
  IconData get micOff => context.platformIcon(
      material: Icons.mic_off,
      cupertino: CupertinoIcons.mic_off,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.micOff?.call(platformTarget));

  /// Icons: Icons.mic_none : CupertinoIcons.mic
  IconData get micOutline => context.platformIcon(
      material: Icons.mic_none,
      cupertino: CupertinoIcons.mic,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.micOutline?.call(platformTarget));

  /// Icons: Icons.mic : CupertinoIcons.mic_solid
  IconData get micSolid => context.platformIcon(
      material: Icons.mic,
      cupertino: CupertinoIcons.mic_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.micSolid?.call(platformTarget));

  // IconData get minusCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.minus_circled;

  /// Icons: Icons.music_note : CupertinoIcons.music_note
  IconData get musicNote => context.platformIcon(
      material: Icons.music_note,
      cupertino: CupertinoIcons.music_note,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.musicNote?.call(platformTarget));

  // IconData get news => isMaterial(context) ? Icons. : CupertinoIcons.news;

  // IconData get newsSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.news_solid;

  /// Icons: Icons.lock : CupertinoIcons.padlock
  IconData get padLock => context.platformIcon(
      material: Icons.lock,
      cupertino: CupertinoIcons.padlock,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.padLock?.call(platformTarget));

  /// Icons: Icons.lock_outline : CupertinoIcons.padlock
  IconData get padlockOutline => context.platformIcon(
      material: Icons.lock_outline,
      cupertino: CupertinoIcons.padlock,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.padlockOutline?.call(platformTarget));

  /// Icons: Icons.lock : CupertinoIcons.padlock_solid
  IconData get padlockSolid => context.platformIcon(
      material: Icons.lock,
      cupertino: CupertinoIcons.padlock_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.padlockSolid?.call(platformTarget));

  /// Icons: Icons.pause : CupertinoIcons.pause
  IconData get pause => context.platformIcon(
      material: Icons.pause,
      cupertino: CupertinoIcons.pause,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.pause?.call(platformTarget));

  // IconData get pauseSolid => isMaterial(context)
  //     ? Icons.pause_circle_filled
  //     : CupertinoIcons.pause_solid;

  // IconData get paw => isMaterial(context) ? Icons. : CupertinoIcons.paw;

  // Icons: Icons.pets : CupertinoIcons.paw_solid
  IconData get pawSolid => context.platformIcon(
      material: Icons.pets,
      cupertino: CupertinoIcons.paw_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.pawSolid?.call(platformTarget));

  // Icons: Icons.edit : CupertinoIcons.pen
  IconData get pen => context.platformIcon(
      material: Icons.edit,
      cupertino: CupertinoIcons.pen,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.pen?.call(platformTarget));

  // IconData get pencil =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.pencil;

  /// Icons: Icons.person : CupertinoIcons.person
  IconData get person => context.platformIcon(
      material: Icons.person,
      cupertino: CupertinoIcons.person,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.person?.call(platformTarget));

  /// Icons: Icons.person_add : CupertinoIcons.person_add
  IconData get personAdd => context.platformIcon(
      material: Icons.person_add,
      cupertino: CupertinoIcons.person_add,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.personAdd?.call(platformTarget));

  /// Icons: Icons.person_add : CupertinoIcons.person_add_solid
  IconData get personAddSolid => context.platformIcon(
      material: Icons.person_add,
      cupertino: CupertinoIcons.person_add_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.personAddSolid?.call(platformTarget));

  /// Icons: Icons.person_outline : CupertinoIcons.person
  IconData get personOutline => context.platformIcon(
      material: Icons.person_outline,
      cupertino: CupertinoIcons.person,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.personOutline?.call(platformTarget));

  /// Icons: Icons.person : CupertinoIcons.person_solid
  IconData get personSolid => context.platformIcon(
      material: Icons.person,
      cupertino: CupertinoIcons.person_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.personSolid?.call(platformTarget));

  /// Icons: Icons.phone : CupertinoIcons.phone
  IconData get phone => context.platformIcon(
      material: Icons.phone,
      cupertino: CupertinoIcons.phone,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.phone?.call(platformTarget));

  /// Icons: Icons.phone : CupertinoIcons.phone_solid
  IconData get phoneSolid => context.platformIcon(
      material: Icons.phone,
      cupertino: CupertinoIcons.phone_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.phoneSolid?.call(platformTarget));

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera
  IconData get photoCamera => context.platformIcon(
      material: Icons.photo_camera,
      cupertino: CupertinoIcons.photo_camera,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.photoCamera?.call(platformTarget));

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera_solid
  IconData get photoCameraSolid => context.platformIcon(
      material: Icons.photo_camera,
      cupertino: CupertinoIcons.photo_camera_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.photoCameraSolid?.call(platformTarget));

  /// Icons: Icons.photo_library_outlined : CupertinoIcons.photo_on_rectangle
  IconData get photoLibrary => context.platformIcon(
      material: Icons.photo_library_outlined,
      cupertino: CupertinoIcons.photo_on_rectangle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.photoLibrary?.call(platformTarget));

  /// Icons: Icons.photo_library : CupertinoIcons.photo_fill_on_rectangle_fill
  IconData get photoLibrarySolid => context.platformIcon(
      material: Icons.photo_library,
      cupertino: CupertinoIcons.photo_fill_on_rectangle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.photoLibrarySolid?.call(platformTarget));

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow
  IconData get playArrow => context.platformIcon(
      material: Icons.play_arrow,
      cupertino: CupertinoIcons.play_arrow,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.playArrow?.call(platformTarget));

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow_solid
  IconData get playArrowSolid => context.platformIcon(
      material: Icons.play_arrow,
      cupertino: CupertinoIcons.play_arrow_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.playArrowSolid?.call(platformTarget));

  /// Icons: Icons.play_circle_outline : CupertinoIcons.play_circle
  IconData get playCircle => context.platformIcon(
      material: Icons.play_circle_outline,
      cupertino: CupertinoIcons.play_circle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.playCircle?.call(platformTarget));

  /// Icons: Icons.play_circle : CupertinoIcons.play_circle_fill
  IconData get playCircleSolid => context.platformIcon(
      material: Icons.play_circle,
      cupertino: CupertinoIcons.play_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.playCircleSolid?.call(platformTarget));

  // IconData get plusCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.plus_circled;

  // IconData get profileCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.profile_circled;

  /// Icons: Icons.refresh : CupertinoIcons.refresh
  IconData get refresh => context.platformIcon(
      material: Icons.refresh,
      cupertino: CupertinoIcons.refresh,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.refresh?.call(platformTarget));

  /// Icons: Icons.refresh : CupertinoIcons.refresh_bold
  IconData get refreshBold => context.platformIcon(
      material: Icons.refresh,
      cupertino: CupertinoIcons.refresh_bold,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.refreshBold?.call(platformTarget));

  // IconData get refreshCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.refresh_circled;

  // IconData get refreshCircledSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.refresh_circled_solid;

  // IconData get refreshThick =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.refresh_thick;

  // IconData get refreshThin =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.refresh_thin;

  /// Icons: Icons.remove : CupertinoIcons.minus
  IconData get remove => context.platformIcon(
      material: Icons.remove,
      cupertino: CupertinoIcons.minus,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.remove?.call(platformTarget));

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle
  IconData get removeCircled => context.platformIcon(
      material: Icons.remove_circle,
      cupertino: CupertinoIcons.minus_circle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.removeCircled?.call(platformTarget));

  /// Icons: Icons.remove_circle_outline : CupertinoIcons.minus_circle
  IconData get removeCircledOutline => context.platformIcon(
      material: Icons.remove_circle_outline,
      cupertino: CupertinoIcons.minus_circle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.removeCircledOutline?.call(platformTarget));

  /// Icons: Icons.remove_circle : CupertinoIcons.minus_circle_fill
  IconData get removeCircledSolid => context.platformIcon(
      material: Icons.remove_circle,
      cupertino: CupertinoIcons.minus_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.removeCircledSolid?.call(platformTarget));

  /// Icons: Icons.reply : CupertinoIcons.reply
  IconData get reply => context.platformIcon(
      material: Icons.reply,
      cupertino: CupertinoIcons.reply,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.reply?.call(platformTarget));

  /// Icons: Icons.reply_all : CupertinoIcons.reply_all
  IconData get replyAll => context.platformIcon(
      material: Icons.reply_all,
      cupertino: CupertinoIcons.reply_all,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.replyAll?.call(platformTarget));

  // IconData get replyThickSolid =>
  //     isMaterial(context) ? Icons.reply : CupertinoIcons.reply_thick_solid;

  // IconData get restart =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.restart;

  /// Icons: Icons.chevron_right : CupertinoIcons.right_chevron
  IconData get rightChevron => context.platformIcon(
      material: Icons.chevron_right,
      cupertino: CupertinoIcons.right_chevron,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.rightChevron?.call(platformTarget));

  /// Icons: Icons.search : CupertinoIcons.search
  IconData get search => context.platformIcon(
      material: Icons.search,
      cupertino: CupertinoIcons.search,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.search?.call(platformTarget));

  /// Icons: Icons.settings : CupertinoIcons.settings
  IconData get settings => context.platformIcon(
      material: Icons.settings,
      cupertino: CupertinoIcons.settings,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.settings?.call(platformTarget));

  /// Icons: Icons.settings : CupertinoIcons.settings_solid
  IconData get settingsSolid => context.platformIcon(
      material: Icons.settings,
      cupertino: CupertinoIcons.settings_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.settingsSolid?.call(platformTarget));

  /// Icons: Icons.share : CupertinoIcons.share
  IconData get share => context.platformIcon(
      material: Icons.share,
      cupertino: CupertinoIcons.share,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.share?.call(platformTarget));

  /// Icons: Icons.share : CupertinoIcons.share_solid
  IconData get shareSolid => context.platformIcon(
      material: Icons.share,
      cupertino: CupertinoIcons.share_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.shareSolid?.call(platformTarget));

  // IconData get shareUp =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.share_up;

  /// Icons: Icons.shopping_cart : CupertinoIcons.shopping_cart
  IconData get shoppingCart => context.platformIcon(
      material: Icons.shopping_cart,
      cupertino: CupertinoIcons.shopping_cart,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.shoppingCart?.call(platformTarget));

  /// Icons: Icons.shuffle : CupertinoIcons.shuffle
  IconData get shuffle => context.platformIcon(
      material: Icons.shuffle,
      cupertino: CupertinoIcons.shuffle,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.shuffle?.call(platformTarget));

  // IconData get shuffleMedium =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.shuffle_medium;

  // IconData get shuffleThick =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.shuffle_thick;

  /// Icons: Icons.star : CupertinoIcons.star
  IconData get star => context.platformIcon(
      material: Icons.star,
      cupertino: CupertinoIcons.star,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.star?.call(platformTarget));

  /// Icons: Icons.stars : CupertinoIcons.star_circle_fill
  IconData get starCircleSolid => context.platformIcon(
      material: Icons.stars,
      cupertino: CupertinoIcons.star_circle_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.starCircleSolid?.call(platformTarget));

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera
  IconData get switchCamera => context.platformIcon(
      material: Icons.switch_camera,
      cupertino: CupertinoIcons.switch_camera,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.switchCamera?.call(platformTarget));

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera_solid
  IconData get switchCameraSolid => context.platformIcon(
      material: Icons.switch_camera,
      cupertino: CupertinoIcons.switch_camera_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.switchCameraSolid?.call(platformTarget));

  /// Icons: Icons.label : CupertinoIcons.tag
  IconData get tag => context.platformIcon(
      material: Icons.label,
      cupertino: CupertinoIcons.tag,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.tag?.call(platformTarget));

  /// Icons: Icons.label_outline : CupertinoIcons.tag
  IconData get tagOutline => context.platformIcon(
      material: Icons.label_outline,
      cupertino: CupertinoIcons.tag,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.tagOutline?.call(platformTarget));

  /// Icons: Icons.label : CupertinoIcons.tag_solid
  IconData get tagSolid => context.platformIcon(
      material: Icons.label,
      cupertino: CupertinoIcons.tag_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.tagSolid?.call(platformTarget));

  // IconData get tagsSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.tags_solid;

  /// Icons: Icons.thumb_down : CupertinoIcons.hand_thumbsdown_fill
  IconData get thumbDown => context.platformIcon(
      material: Icons.thumb_down,
      cupertino: CupertinoIcons.hand_thumbsdown_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.thumbDown?.call(platformTarget));

  /// Icons: Icons.thumb_down_outlined : CupertinoIcons.hand_thumbsdown
  IconData get thumbDownOutlined => context.platformIcon(
      material: Icons.thumb_down_outlined,
      cupertino: CupertinoIcons.hand_thumbsdown,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.thumbDownOutlined?.call(platformTarget));

  /// Icons: Icons.thumb_up : CupertinoIcons.hand_thumbsup_fill
  IconData get thumbUp => context.platformIcon(
      material: Icons.thumb_up,
      cupertino: CupertinoIcons.hand_thumbsup_fill,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.thumbUp?.call(platformTarget));

  /// Icons: Icons.thumb_up_outlined : CupertinoIcons.hand_thumbsup
  IconData get thumbUpOutlined => context.platformIcon(
      material: Icons.thumb_up_outlined,
      cupertino: CupertinoIcons.hand_thumbsup,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.thumbUpOutlined?.call(platformTarget));

  /// Icons: Icons.schedule : CupertinoIcons.time
  IconData get time => context.platformIcon(
      material: Icons.schedule,
      cupertino: CupertinoIcons.time,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.time?.call(platformTarget));

  /// Icons: Icons.watch_later : CupertinoIcons.time_solid
  IconData get timeSolid => context.platformIcon(
      material: Icons.watch_later,
      cupertino: CupertinoIcons.time_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.timeSolid?.call(platformTarget));

  /// Icons: Icons.tram : CupertinoIcons.train_style_one
  IconData get train => context.platformIcon(
      material: Icons.tram,
      cupertino: CupertinoIcons.train_style_one,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.train?.call(platformTarget));

  // IconData get trainStyleTwo =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.train_style_two;

  /// Icons: Icons.arrow_upward : CupertinoIcons.up_arrow
  IconData get upArrow => context.platformIcon(
      material: Icons.arrow_upward,
      cupertino: CupertinoIcons.up_arrow,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.upArrow?.call(platformTarget));

  /// Icons: Icons.videocam : CupertinoIcons.video_camer
  IconData get videoCamera => context.platformIcon(
      material: Icons.videocam,
      cupertino: CupertinoIcons.video_camera,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.videoCamera?.call(platformTarget));

  /// Icons: Icons.videocam : CupertinoIcons.video_camera_solid
  IconData get videoCameraSolid => context.platformIcon(
      material: Icons.videocam,
      cupertino: CupertinoIcons.video_camera_solid,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.videoCameraSolid?.call(platformTarget));

  /// Icons: Icons.volume_down : CupertinoIcons.volume_down
  IconData get volumeDown => context.platformIcon(
      material: Icons.volume_down,
      cupertino: CupertinoIcons.volume_down,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.volumeDown?.call(platformTarget));

  /// Icons: Icons.volume_mute : CupertinoIcons.volume_mute
  IconData get volumeMute => context.platformIcon(
      material: Icons.volume_mute,
      cupertino: CupertinoIcons.volume_mute,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.volumeMute?.call(platformTarget));

  /// Icons: Icons.volume_off : CupertinoIcons.volume_off
  IconData get volumeOff => context.platformIcon(
      material: Icons.volume_off,
      cupertino: CupertinoIcons.volume_off,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.volumeOff?.call(platformTarget));

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  IconData get volumeUp => context.platformIcon(
      material: Icons.volume_up,
      cupertino: CupertinoIcons.volume_up,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.volumeUp?.call(platformTarget));

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  // IconData get work => isMaterial(context)
  //     ? Icons.work
  //     : const IconData(0xf3ee, not mapped in CupertinoIcons
  //         fontFamily: CupertinoIcons.iconFont,
  //         fontPackage: CupertinoIcons.iconFontPackage);

  /// Icons: Icons.wifi : CupertinoIcons.wifi
  IconData get wifi => context.platformIcon(
      material: Icons.wifi,
      cupertino: CupertinoIcons.wifi,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.wifi?.call(platformTarget));

  /// Icons: Icons.wifi_off : CupertinoIcons.wifi_slash
  IconData get wifiOff => context.platformIcon(
      material: Icons.wifi_off,
      cupertino: CupertinoIcons.wifi_slash,
      custom: (PlatformTarget platformTarget) =>
          _customIconData()?.wifiOff?.call(platformTarget));
}
