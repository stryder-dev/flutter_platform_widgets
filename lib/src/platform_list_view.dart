/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widget_base.dart';
import 'platform_widget.dart';

class PlatformListHeading{
  PlatformListHeading({
    this.leading,
    this.title,
    this.secondaryTitle,
    this.trailing,
    this.onTap,
  });

  final Widget leading;
  final Widget title;
  final Widget secondaryTitle;
  final Widget trailing;
  final Function onTap;
}

class PlatformListTile{
  PlatformListTile({
    this.leading,
    @required this.title,
    this.trailing,
    this.onTap,
    this.data,
  });

  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Function onTap;
  final dynamic data;
}

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.children,
  });

  final Key widgetKey;
  final List<dynamic> children;
}

class MaterialListViewData extends _BaseData {
  MaterialListViewData({
    Key widgetKey,
    List<dynamic> children,
  }) : super(
    widgetKey: widgetKey,
    children: children);
}

class CupertinoListViewData extends _BaseData {
  CupertinoListViewData({
    Key widgetKey,
    List<dynamic> children,
  }) : super(
    widgetKey: widgetKey,
    children: children);
}

class PlatformListView extends PlatformWidgetBase<Column, ListView> {
  final Key widgetKey;
  final List<dynamic> children;

  final PlatformBuilder<MaterialListViewData> android;
  final PlatformBuilder<CupertinoListViewData> ios;

  PlatformListView(
      {Key key,
      this.widgetKey,
      this.children,
      this.android,
      this.ios})
      : super(key: key) {
        children.forEach((tile) {
          assert(
            (tile is PlatformListTile) || (tile is PlatformListHeading),
            'Each row in a PlatformListView\' children has to be a type of either PlatformListTile or PlatformListHeading.'
          );
        });
      }

  @override
  ListView createAndroidWidget(BuildContext context) {
    MaterialListViewData data;
    if (android != null) {
      data = android(context);
    }

    List<Widget> tiles = [];

    dynamic displayLeading;
    dynamic displayTrailing;

    for (var tile in children) {
      if (tile.leading is PlatformWidget) {
        displayLeading = (tile.leading as PlatformWidget).android ?? null;
      } else {
        displayLeading = (tile.leading != null) ? true : null;
      }

      if (tile.trailing is PlatformWidget) {
        displayTrailing = (tile.trailing as PlatformWidget).android ?? null;
      } else {
        displayTrailing = (tile.trailing != null) ? true : null;
      }

      if (tile is PlatformListTile) {
        tiles.add(
          ListTile(
            title: tile.title,
            onTap: () {
              if (tile.onTap != null) {
                tile.onTap();
              }
            },
            leading: (displayLeading != null) ? tile.leading : null,
            trailing: (displayTrailing != null) ? tile.trailing : null,
          )
        );
      }

      if (tile is PlatformListHeading) {
        dynamic displaySecondaryTitle;
        dynamic displayTitle;

        if (tile.secondaryTitle is PlatformWidget) {
          displaySecondaryTitle = (tile.secondaryTitle as PlatformWidget).android ?? null;
        } else {
          displaySecondaryTitle = (tile.secondaryTitle != null) ? true : null;
        }

        // title is not required for PlatformListHeading, unlike PlatformListTile
        if (tile.title is PlatformWidget) {
          displayTitle = (tile.title as PlatformWidget).android ?? null;
        } else {
          displayTitle = (tile.title != null) ? true : null;
        }

        tiles.add(
          ListTile(
            subtitle: (displaySecondaryTitle != null) ? tile.secondaryTitle : null,
            title: (displayTitle != null) ? tile.title : null,
            onTap: () {
              if (tile.onTap != null) {
                tile.onTap();
              }
            },
            leading: (displayLeading != null) ? tile.leading : null,
            trailing: (displayTrailing != null) ? tile.trailing : null,
          )
        );
      }
    }

    return ListView(
      key: data?.widgetKey ?? widgetKey,
      children: tiles
    );
  }

  @override
  Column createIosWidget(BuildContext context) {
    CupertinoListViewData data;
    if (ios != null) {
      data = ios(context);
    }

    List<Widget> tiles = [];

    dynamic displayLeading;
    dynamic displayTrailing;

    for (var tile in children) {
      if (tile.leading is PlatformWidget) {
        displayLeading = (tile.leading as PlatformWidget).ios ?? null;
      } else {
        displayLeading = (tile.leading != null) ? true : null;
      }

      if (tile.trailing is PlatformWidget) {
        displayTrailing = (tile.trailing as PlatformWidget).ios ?? null;
      } else {
        displayTrailing = (tile.trailing != null) ? true : null;
      }

      bool displayUnderline = true;

      if (children.indexOf(tile) + 1 < children.length) {
        if (children[children.indexOf(tile) + 1] is PlatformListHeading) {
          displayUnderline = false;
        }
      }

      if (tile is PlatformListTile) {
        tiles.add(
          GestureDetector(
            onTap: () {
              if (tile.onTap != null) {
                tile.onTap();
              }
            },
            child: Row(
              children: <Widget>[
                if (displayLeading != null) Container(
                  child: tile.leading,
                  width: 36,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 10),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(right: 10),
                                child: tile.title,
                              ),
                            ),
                            if (displayTrailing != null) Container(
                              alignment: Alignment.centerRight,
                              child: tile.trailing,
                            ),
                          ],
                        ),
                      ),
                      if (displayUnderline) Container(
                        height: 1,
                        color: Color(0xFFD9D9D9),
                      )
                    ],
                  ),
                )
              ],
            )
          )
        );
      }

      if (tile is PlatformListHeading) {
        dynamic displaySecondaryTitle;
        dynamic displayTitle;

        if (tile.secondaryTitle is PlatformWidget) {
          displaySecondaryTitle = (tile.secondaryTitle as PlatformWidget).ios ?? null;
        } else {
          displaySecondaryTitle = (tile.secondaryTitle != null) ? true : null;
        }

        // title is not required for PlatformListHeading, unlike PlatformListTile
        if (tile.title is PlatformWidget) {
          displayTitle = (tile.title as PlatformWidget).ios ?? null;
        } else {
          displayTitle = (tile.title != null) ? true : null;
        }
        
        tiles.add(
          GestureDetector(
            onTap: () {
              if (tile.onTap != null) {
                tile.onTap();
              }
            },
            child: Column(
              children: <Widget>[
                Container(
                  color: Color(0xffefeff5),
                  child: Row(
                    children: <Widget>[
                      if (displayLeading != null) Container(
                        child: tile.leading,
                        width: 36,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                        child: DefaultTextStyle(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 50.0,
                              ),
                              child: Column(
                                mainAxisAlignment: (displaySecondaryTitle != null) ? MainAxisAlignment.start : MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(right: 10, left: 10),
                                    child: (displaySecondaryTitle != null) ? tile.secondaryTitle : null,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(right: 10, left: 10),
                                    child: (displayTitle != null) ? tile.title : null,
                                  ),
                                ]
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0xff747479)
                          ),
                        ),
                      ),
                      if (displayTrailing != null) Container(
                        child: tile.trailing,
                        width: 36,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(0xFFD9D9D9),
                )
              ]
            )
          )
        );
      }
    }
  
    return Column(
      key: data?.widgetKey ?? widgetKey,
      children: tiles
    );
  }
}