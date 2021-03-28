import 'dart:math';

import 'package:b13_flutter/commands/base_command.dart';
import 'package:b13_flutter/models/main_app_model.dart';
import 'package:b13_flutter/shared/utils/device_info.dart';
import 'package:b13_flutter/shared/utils/native_window_utils/window_utils.dart';
import 'package:b13_flutter/shared/utils/time_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/core_packages.dart';
import 'package:system_info/system_info.dart';
import 'package:window_size/window_size.dart';
import '../commands/base_command.dart' as Commands;

class BootstrapCommand extends Commands.BaseAppCommand {
  static int kMinBootstrapTimeMs = 2000;

  Future<void> run(BuildContext context) async {
    int startTime = TimeUtils.nowMillis;
    if (Commands.mainContext == null) {
      Commands.setContext(context);
    }
    safePrint("Bootstrap Started, v${MainAppState.kVersion}");
    // Load AppModel ASAP
    await mainAppState.load();
    safePrint(
        "BootstrapCommand - AppModel Loaded, user = ${mainAppState.currentUser}");
    // Set the cacheSize so we'll use more RAM on desktop and higher spec devices.
    _configureMemoryCache();

    // Once model is loaded, we can configure the desktop.
    if (DeviceInfo.isDesktop) {
      _configureDesktop();
    }
    // For aesthetics, we'll keep splash screen up for some min-time (skip on web)
    if (kIsWeb == false) {
      int remaining = kMinBootstrapTimeMs - (TimeUtils.nowMillis - startTime);
      if (remaining > 0) {
        await Future<void>.delayed(Duration(milliseconds: remaining));
      }
    }
    mainAppState.hasBootstrapped = true;
    safePrint("BootstrapCommand - Complete");
  }

  void _configureMemoryCache() {
    int cacheSize = (DeviceInfo.isDesktop ? 2048 : 512) << 20;
    // If we're on a native platform, reserve some reasonable amt of RAM
    if (DeviceInfo.isDesktop) {
      try {
        // Use some percentage of system ram, but don't fall below the default, in case this returns 0 or some other invalid value.
        cacheSize =
            max(cacheSize, (SysInfo.getTotalPhysicalMemory() / 4).round());
      } on Exception catch (e) {
        safePrint(e.toString());
      }
    }
    imageCache?.maximumSizeBytes = cacheSize;
  }

  void _configureDesktop() {
    // /// Polish (for Windows OS), to hide any movement of the window on startup.
    IoUtils.instance.showWindowWhenReady();

    setWindowTitle("B13 Flutter");
    Size minSize = Size(600, 700);
    setWindowMinSize(minSize);
    setWindowMaxSize(Size(8192,
        8192)); // maxSize is needed for Linux to allow scaling, TODO: log an issue for this

    // Restore the previous window settings on load
    if (mainAppState.hasValidWindowRect) {
      setWindowFrame(mainAppState.windowRect);
      safePrint("Restoring window with frame: ${mainAppState.windowRect}");
    } else {
      setWindowFrame(Rect.fromLTRB(50, 50, 800, 700));
    }
  }
}
