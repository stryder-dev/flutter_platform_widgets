/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

library flutter_platform_widgets;

export 'src/platform.dart'
    show
        isCupertino,
        isMaterial,
        changeToAutoDetectPlatform,
        changeToCupertinoPlatform,
        changeToMaterialPlatform,
        showPlatformDialog,
        showPlatformModalSheet;
export 'src/platform_alert_dialog.dart';
export 'src/platform_app.dart';
export 'src/platform_app_bar.dart';
export 'src/platform_button.dart';
export 'src/platform_circluar_progress_indicator.dart';
export 'src/platform_dialog_action.dart';
export 'src/platform_icon_button.dart';
export 'src/platform_nav_bar.dart';
export 'src/platform_provider.dart';
export 'src/platform_routing.dart' show platformPageRoute;
export 'src/platform_scaffold.dart';
export 'src/platform_slider.dart';
export 'src/platform_switch.dart';
export 'src/platform_text.dart';
export 'src/platform_text_field.dart';
export 'src/platform_widget.dart';
export 'src/widget_base.dart';
