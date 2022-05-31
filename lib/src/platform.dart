/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Extends on [TargetPlatform] to include web
enum PlatformTarget {
  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.googlesource.com/>
  fuchsia,

  /// iOS: <https://www.apple.com/ios/>
  iOS,

  /// Linux: <https://www.linux.org>
  linux,

  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,

  web,
}

PlatformStyle _platformStyle(BuildContext context) {
  final platformStyle = PlatformProvider.of(context)?.settings.platformStyle;

  return _platformStyleImpl(context, platformStyle);
}

PlatformStyle _fallbackPlatformStyle(BuildContext context) {
  final platformStyle =
      PlatformProvider.of(context)?.settings.fallbackPlatformStyle;

  return _platformStyleImpl(context, platformStyle);
}

PlatformStyle _platformStyleImpl(
    BuildContext context, PlatformStyleData? platformStyle) {
  final platform = PlatformProvider.of(context)?.platform;

  if (platform == null && kIsWeb) {
    return platformStyle?.web ?? PlatformStyle.Material;
  }

  switch (platform ?? Theme.of(context).platform) {
    case TargetPlatform.android:
      return platformStyle?.android ?? PlatformStyle.Material;
    case TargetPlatform.fuchsia:
      return platformStyle?.fuchsia ?? PlatformStyle.Material;
    case TargetPlatform.iOS:
      return platformStyle?.ios ?? PlatformStyle.Cupertino;
    case TargetPlatform.linux:
      return platformStyle?.linux ?? PlatformStyle.Material;
    case TargetPlatform.macOS:
      return platformStyle?.macos ?? PlatformStyle.Cupertino;
    case TargetPlatform.windows:
      return platformStyle?.windows ?? PlatformStyle.Material;
  }
}

bool isMaterial(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Material;
}

bool isCupertino(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Cupertino;
}

bool isCustom(BuildContext context) {
  return _platformStyle(context) == PlatformStyle.Custom;
}

bool isMaterialFallback(BuildContext context) {
  return _fallbackPlatformStyle(context) == PlatformStyle.Material;
}

bool isCupertinoFallback(BuildContext context) {
  return _fallbackPlatformStyle(context) == PlatformStyle.Cupertino;
}

T platformThemeData<T>(
  BuildContext context, {
  required T Function(ThemeData theme) material,
  required T Function(CupertinoThemeData theme) cupertino,
  T Function(ThemeData theme, CupertinoThemeData cupertinoTheme)? custom,
}) {
  if (custom != null && isCustom(context)) {
    return custom.call(Theme.of(context), CupertinoTheme.of(context));
  }

  return isMaterial(context)
      ? material(Theme.of(context))
      : cupertino(CupertinoTheme.of(context));
}

PlatformTarget platform(BuildContext context) {
  if (kIsWeb) {
    return PlatformTarget.web;
  }

  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
      return PlatformTarget.android;
    case TargetPlatform.fuchsia:
      return PlatformTarget.fuchsia;
    case TargetPlatform.iOS:
      return PlatformTarget.iOS;
    case TargetPlatform.linux:
      return PlatformTarget.linux;
    case TargetPlatform.macOS:
      return PlatformTarget.macOS;
    case TargetPlatform.windows:
      return PlatformTarget.windows;
  }
}

typedef PlatformTargetBuilder<T> = Widget Function(
  T widget,
  Object? data,
);

class CustomWidgetBuilder {
  final PlatformTargetBuilder<PlatformAlertDialog>? alertDialogBuilder;
  final PlatformTargetBuilder<PlatformAppBar>? appBarBuilder;
  final PlatformTargetBuilder<PlatformApp>? appBuilder;
  final PlatformTargetBuilder<PlatformButton>? buttonBuilder;
  final PlatformTargetBuilder<PlatformCircularProgressIndicator>?
      circularProgressIndicatorBuilder;
  final PlatformTargetBuilder<PlatformDialogAction>? dialogActionBuilder;
  final PlatformTargetBuilder<PlatformElevatedButton>? elevatedButtonBuilder;
  final PlatformTargetBuilder<PlatformIconButton>? iconButtonBuilder;
  final PlatformTargetBuilder<PlatformNavBar>? navBarBuilder;
  final PlatformTargetBuilder<PlatformScaffold>? scaffoldBuilder;
  final PlatformTargetBuilder<PlatformSlider>? sliderBuilder;
  final PlatformTargetBuilder<PlatformSwitch>? switchBuilder;
  final PlatformTargetBuilder<PlatformTextButton>? textButtonBuilder;
  final PlatformTargetBuilder<PlatformTextField>? textFieldBuilder;
  final PlatformTargetBuilder<PlatformTextFormField>? textFormFieldBuilder;

  final dynamic Function(BuildContext, DialogData, Object?)? showDialog;
  final dynamic Function(BuildContext, DatePickerData, Object?)? showDatePicker;

  final CustomIconBuilder iconBuilder;

  CustomWidgetBuilder({
    required this.iconBuilder,
    this.alertDialogBuilder,
    this.appBarBuilder,
    this.appBuilder,
    @Deprecated('Use textButtonBuilder or elevatedButtonBuilder instead. PlaformButton deprecated.')
        this.buttonBuilder,
    this.circularProgressIndicatorBuilder,
    this.dialogActionBuilder,
    this.elevatedButtonBuilder,
    this.iconButtonBuilder,
    this.navBarBuilder,
    this.scaffoldBuilder,
    this.sliderBuilder,
    this.switchBuilder,
    this.textButtonBuilder,
    this.textFieldBuilder,
    this.textFormFieldBuilder,
    this.showDialog,
    this.showDatePicker,
  });
}

class CustomIconBuilder {
  final IconData? Function(PlatformTarget platformTarget)? accountCircle;

  final IconData? Function(PlatformTarget platformTarget)? accountCircleSolid;

  final IconData? Function(PlatformTarget platformTarget)? add;

  final IconData? Function(PlatformTarget platformTarget)? addCircled;

  final IconData? Function(PlatformTarget platformTarget)? addCircledOutline;

  final IconData? Function(PlatformTarget platformTarget)? addCircledSolid;

  final IconData? Function(PlatformTarget platformTarget)? back;

  final IconData? Function(PlatformTarget platformTarget)? batteryCharging;

  final IconData? Function(PlatformTarget platformTarget)? batteryEmpty;

  final IconData? Function(PlatformTarget platformTarget)? batteryFull;

  final IconData? Function(PlatformTarget platformTarget)? bluetooth;

  final IconData? Function(PlatformTarget platformTarget)? book;

  final IconData? Function(PlatformTarget platformTarget)? bookmark;

  final IconData? Function(PlatformTarget platformTarget)? bookmarkSolid;

  final IconData? Function(PlatformTarget platformTarget)? bookmarkOutline;

  final IconData? Function(PlatformTarget platformTarget)? brightness;

  final IconData? Function(PlatformTarget platformTarget)? brightnessSolid;

  final IconData? Function(PlatformTarget platformTarget)? bus;

  final IconData? Function(PlatformTarget platformTarget)? car;

  final IconData? Function(PlatformTarget platformTarget)?
      checkBoxBlankOutlineRounded;

  final IconData? Function(PlatformTarget platformTarget)?
      checkBoxIndeterminateOutlineRounded;

  final IconData? Function(PlatformTarget platformTarget)?
      checkBoxCheckedOutlineRounded;

  final IconData? Function(PlatformTarget platformTarget)? checkMark;

  final IconData? Function(PlatformTarget platformTarget)? checkMarkCircled;

  final IconData? Function(PlatformTarget platformTarget)?
      checkMarkCircledOutline;

  final IconData? Function(PlatformTarget platformTarget)?
      checkMarkCircledSolid;

  final IconData? Function(PlatformTarget platformTarget)? clear;

  final IconData? Function(PlatformTarget platformTarget)? clearThick;

  final IconData? Function(PlatformTarget platformTarget)? clearThickCircled;

  final IconData? Function(PlatformTarget platformTarget)? clockSolid;

  final IconData? Function(PlatformTarget platformTarget)? cloud;

  final IconData? Function(PlatformTarget platformTarget)? cloudSolid;

  final IconData? Function(PlatformTarget platformTarget)? cloudDownload;

  final IconData? Function(PlatformTarget platformTarget)? cloudDownloadSolid;

  final IconData? Function(PlatformTarget platformTarget)? cloudUpload;

  final IconData? Function(PlatformTarget platformTarget)? cloudUploadSolid;

  final IconData? Function(PlatformTarget platformTarget)? collections;

  final IconData? Function(PlatformTarget platformTarget)? conversationBubble;

  final IconData? Function(PlatformTarget platformTarget)?
      conversationBubbleOutline;

  final IconData? Function(PlatformTarget platformTarget)? create;

  final IconData? Function(PlatformTarget platformTarget)? dehaze;

  final IconData? Function(PlatformTarget platformTarget)? delete;

  final IconData? Function(PlatformTarget platformTarget)? deleteSolid;

  final IconData? Function(PlatformTarget platformTarget)? deleteOutline;

  final IconData? Function(PlatformTarget platformTarget)? downArrow;

  final IconData? Function(PlatformTarget platformTarget)? edit;

  final IconData? Function(PlatformTarget platformTarget)? ellipsis;

  final IconData? Function(PlatformTarget platformTarget)? error;

  final IconData? Function(PlatformTarget platformTarget)? eyeSlash;

  final IconData? Function(PlatformTarget platformTarget)? eyeSlashSolid;

  final IconData? Function(PlatformTarget platformTarget)? eyeSolid;

  final IconData? Function(PlatformTarget platformTarget)? favoriteSolid;

  final IconData? Function(PlatformTarget platformTarget)? favoriteOutline;

  final IconData? Function(PlatformTarget platformTarget)? flag;

  final IconData? Function(PlatformTarget platformTarget)? folder;

  final IconData? Function(PlatformTarget platformTarget)? folderOpen;

  final IconData? Function(PlatformTarget platformTarget)? folderSolid;

  final IconData? Function(PlatformTarget platformTarget)? forward;

  final IconData? Function(PlatformTarget platformTarget)? fullscreen;

  final IconData? Function(PlatformTarget platformTarget)? fullscreenExit;

  final IconData? Function(PlatformTarget platformTarget)? gameController;

  final IconData? Function(PlatformTarget platformTarget)? gameControllerSolid;

  final IconData? Function(PlatformTarget platformTarget)? gearSolid;

  final IconData? Function(PlatformTarget platformTarget)? group;

  final IconData? Function(PlatformTarget platformTarget)? groupSolid;

  final IconData? Function(PlatformTarget platformTarget)? heartSolid;

  final IconData? Function(PlatformTarget platformTarget)? help;

  final IconData? Function(PlatformTarget platformTarget)? helpOutline;

  final IconData? Function(PlatformTarget platformTarget)? home;

  final IconData? Function(PlatformTarget platformTarget)? info;

  final IconData? Function(PlatformTarget platformTarget)? leftChevron;

  final IconData? Function(PlatformTarget platformTarget)? location;

  final IconData? Function(PlatformTarget platformTarget)? locationSolid;

  final IconData? Function(PlatformTarget platformTarget)? loop;

  final IconData? Function(PlatformTarget platformTarget)? mail;

  final IconData? Function(PlatformTarget platformTarget)? mailSolid;

  final IconData? Function(PlatformTarget platformTarget)? mailOutline;

  final IconData? Function(PlatformTarget platformTarget)? mic;

  final IconData? Function(PlatformTarget platformTarget)? micOff;

  final IconData? Function(PlatformTarget platformTarget)? micOutline;

  final IconData? Function(PlatformTarget platformTarget)? micSolid;

  final IconData? Function(PlatformTarget platformTarget)? musicNote;

  final IconData? Function(PlatformTarget platformTarget)? padLock;

  final IconData? Function(PlatformTarget platformTarget)? padlockOutline;

  final IconData? Function(PlatformTarget platformTarget)? padlockSolid;

  final IconData? Function(PlatformTarget platformTarget)? pause;

  final IconData? Function(PlatformTarget platformTarget)? pawSolid;

  final IconData? Function(PlatformTarget platformTarget)? pen;

  final IconData? Function(PlatformTarget platformTarget)? person;

  final IconData? Function(PlatformTarget platformTarget)? personAdd;

  final IconData? Function(PlatformTarget platformTarget)? personAddSolid;

  final IconData? Function(PlatformTarget platformTarget)? personOutline;

  final IconData? Function(PlatformTarget platformTarget)? personSolid;

  final IconData? Function(PlatformTarget platformTarget)? phone;

  final IconData? Function(PlatformTarget platformTarget)? phoneSolid;

  final IconData? Function(PlatformTarget platformTarget)? photoCamera;

  final IconData? Function(PlatformTarget platformTarget)? photoCameraSolid;

  final IconData? Function(PlatformTarget platformTarget)? photoLibrary;

  final IconData? Function(PlatformTarget platformTarget)? photoLibrarySolid;

  final IconData? Function(PlatformTarget platformTarget)? playArrow;

  final IconData? Function(PlatformTarget platformTarget)? playArrowSolid;

  final IconData? Function(PlatformTarget platformTarget)? playCircle;

  final IconData? Function(PlatformTarget platformTarget)? playCircleSolid;

  final IconData? Function(PlatformTarget platformTarget)? refresh;

  final IconData? Function(PlatformTarget platformTarget)? refreshBold;

  final IconData? Function(PlatformTarget platformTarget)? remove;

  final IconData? Function(PlatformTarget platformTarget)? removeCircled;

  final IconData? Function(PlatformTarget platformTarget)? removeCircledOutline;

  final IconData? Function(PlatformTarget platformTarget)? removeCircledSolid;

  final IconData? Function(PlatformTarget platformTarget)? reply;

  final IconData? Function(PlatformTarget platformTarget)? replyAll;

  final IconData? Function(PlatformTarget platformTarget)? rightChevron;

  final IconData? Function(PlatformTarget platformTarget)? search;

  final IconData? Function(PlatformTarget platformTarget)? settings;

  final IconData? Function(PlatformTarget platformTarget)? settingsSolid;

  final IconData? Function(PlatformTarget platformTarget)? share;

  final IconData? Function(PlatformTarget platformTarget)? shareSolid;

  final IconData? Function(PlatformTarget platformTarget)? shoppingCart;

  final IconData? Function(PlatformTarget platformTarget)? shuffle;

  final IconData? Function(PlatformTarget platformTarget)? star;

  final IconData? Function(PlatformTarget platformTarget)? starCircleSolid;

  final IconData? Function(PlatformTarget platformTarget)? switchCamera;

  final IconData? Function(PlatformTarget platformTarget)? switchCameraSolid;

  final IconData? Function(PlatformTarget platformTarget)? tag;

  final IconData? Function(PlatformTarget platformTarget)? tagOutline;

  final IconData? Function(PlatformTarget platformTarget)? tagSolid;

  final IconData? Function(PlatformTarget platformTarget)? thumbDown;

  final IconData? Function(PlatformTarget platformTarget)? thumbDownOutlined;

  final IconData? Function(PlatformTarget platformTarget)? thumbUp;

  final IconData? Function(PlatformTarget platformTarget)? thumbUpOutlined;

  final IconData? Function(PlatformTarget platformTarget)? time;

  final IconData? Function(PlatformTarget platformTarget)? timeSolid;

  final IconData? Function(PlatformTarget platformTarget)? train;

  final IconData? Function(PlatformTarget platformTarget)? upArrow;

  final IconData? Function(PlatformTarget platformTarget)? videoCamera;

  final IconData? Function(PlatformTarget platformTarget)? videoCameraSolid;

  final IconData? Function(PlatformTarget platformTarget)? volumeDown;

  final IconData? Function(PlatformTarget platformTarget)? volumeMute;

  final IconData? Function(PlatformTarget platformTarget)? volumeOff;

  final IconData? Function(PlatformTarget platformTarget)? volumeUp;

  final IconData? Function(PlatformTarget platformTarget)? wifi;

  final IconData? Function(PlatformTarget platformTarget)? wifiOff;

  CustomIconBuilder({
    this.accountCircle,
    this.accountCircleSolid,
    this.add,
    this.addCircled,
    this.addCircledOutline,
    this.addCircledSolid,
    this.back,
    this.batteryCharging,
    this.batteryEmpty,
    this.batteryFull,
    this.bluetooth,
    this.book,
    this.bookmark,
    this.bookmarkSolid,
    this.bookmarkOutline,
    this.brightness,
    this.brightnessSolid,
    this.bus,
    this.car,
    this.checkBoxBlankOutlineRounded,
    this.checkBoxIndeterminateOutlineRounded,
    this.checkBoxCheckedOutlineRounded,
    this.checkMark,
    this.checkMarkCircled,
    this.checkMarkCircledOutline,
    this.checkMarkCircledSolid,
    this.clear,
    this.clearThick,
    this.clearThickCircled,
    this.clockSolid,
    this.cloud,
    this.cloudSolid,
    this.cloudDownload,
    this.cloudDownloadSolid,
    this.cloudUpload,
    this.cloudUploadSolid,
    this.collections,
    this.conversationBubble,
    this.conversationBubbleOutline,
    this.create,
    this.dehaze,
    this.delete,
    this.deleteSolid,
    this.deleteOutline,
    this.downArrow,
    this.edit,
    this.ellipsis,
    this.error,
    this.eyeSlash,
    this.eyeSlashSolid,
    this.eyeSolid,
    this.favoriteSolid,
    this.favoriteOutline,
    this.flag,
    this.folder,
    this.folderOpen,
    this.folderSolid,
    this.forward,
    this.fullscreen,
    this.fullscreenExit,
    this.gameController,
    this.gameControllerSolid,
    this.gearSolid,
    this.group,
    this.groupSolid,
    this.heartSolid,
    this.help,
    this.helpOutline,
    this.home,
    this.info,
    this.leftChevron,
    this.location,
    this.locationSolid,
    this.loop,
    this.mail,
    this.mailSolid,
    this.mailOutline,
    this.mic,
    this.micOff,
    this.micOutline,
    this.micSolid,
    this.musicNote,
    this.padLock,
    this.padlockOutline,
    this.padlockSolid,
    this.pause,
    this.pawSolid,
    this.pen,
    this.person,
    this.personAdd,
    this.personAddSolid,
    this.personOutline,
    this.personSolid,
    this.phone,
    this.phoneSolid,
    this.photoCamera,
    this.photoCameraSolid,
    this.photoLibrary,
    this.photoLibrarySolid,
    this.playArrow,
    this.playArrowSolid,
    this.playCircle,
    this.playCircleSolid,
    this.refresh,
    this.refreshBold,
    this.remove,
    this.removeCircled,
    this.removeCircledOutline,
    this.removeCircledSolid,
    this.reply,
    this.replyAll,
    this.rightChevron,
    this.search,
    this.settings,
    this.settingsSolid,
    this.share,
    this.shareSolid,
    this.shoppingCart,
    this.shuffle,
    this.star,
    this.starCircleSolid,
    this.switchCamera,
    this.switchCameraSolid,
    this.tag,
    this.tagOutline,
    this.tagSolid,
    this.thumbDown,
    this.thumbDownOutlined,
    this.thumbUp,
    this.thumbUpOutlined,
    this.time,
    this.timeSolid,
    this.train,
    this.upArrow,
    this.videoCamera,
    this.videoCameraSolid,
    this.volumeDown,
    this.volumeMute,
    this.volumeOff,
    this.volumeUp,
    this.wifi,
    this.wifiOff,
  });
}
