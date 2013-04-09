# Overview

This repo contains an empty iOS app setup with Dev/Prod schemes, a Podfile with some useful libraries we always use and some vendored things that are homegrown and/or don't have pods. For all new iOS projects fork this repo to quickly get these goodies.

# Initial setup

1. Fork the pltemplate repo and clone the fork to your machine.
1. If you don't already have it install the Cocoapods gem.
1. From the fork's clone directory run <tt>pod install</tt>. Never again open the xcodeproj again; always open the xccworkspace instead.
1. You probably want to rename the projects/targets/etc. Do this from XCode for safety. To rename one of these things double click on it slowly. It should change to a textfield you can edit.


We use [Cocoapods](http://cocoapods.org/) for dependency management. Make sure you have a recent Ruby (>= 1.9.3) and the Cocoapods gem installed. Then, in the fork directory

# Third Party Libraries
## KISSMetrics
If you want KISSMetrics support:

1. [Create new KISSMetrics sites](https://www.kissmetrics.com/path) for each scheme (Dev, Prod, etc)
2. Replace the `KISSMETRICS_API_KEY` key in each scheme's xcconfig file

If you DO NOT want KISSMetrics support:

1. Remove the `KISSMETRICS_API_KEY` from each scheme's xcconfig file
2. Remove the `GCC_PREPROCESSOR_DEFINITIONS` definition for `KISSMETRICS_API_KEY` in `Shared.xcconfig`
3. Remove `initKISSmetrics` implementation and call from `PLStartup.m`
4. Remove `KISSmetrics` directory from `/Lib`

The KISSmetrics sdk included is commit: 38494a2 from https://github.com/kissmetrics/KISSmetrics-iOS-Mac-OS-X-Library

## Crashlytics
1. [Download the Crashlytics mac app](https://www.crashlytics.com/download/mac)
3. Open the Crashlytics app (gear icon in your menu)
2. Log in (if you don't have a login, let Ryan know)
4. Click "+ New App" to create a new app

## [Google Analytics](https://developers.google.com/analytics/devguides/collection/ios/v2/)

The Google Analytics sdk included is: 2.0 Beta 4 from https://developers.google.com/analytics/devguides/collection/ios/resources

## [RestKit](http://restkit.org)
## [Base64](https://github.com/nicklockwood/Base64)
## [MBProgressHUD](https://github.com/jdg/MBProgressHUD)
## [NSDate-Helper](https://github.com/billymeltdown/nsdate-helper)
## [OpenUDID](https://github.com/ylechelle/OpenUDID)
## [STUtils](https://github.com/ldandersen/STUtils)