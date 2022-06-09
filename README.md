<p align="center">
  <img height="160" src="/assets/images/logo-tmdb.png">
</p>

<h4 align="center">
  YouTap Flutter Assessment Project.
</h4>

## Getting Started

First of all, thank you for let me in to the following test.

this is a few depedencies i used to develop:

- [Provider for State Management](https://pub.dev/packages/provider)
- [Persistent Bottom Nav Bar for Navigation Bar](https://pub.dev/packages/persistent_bottom_nav_bar)
- [Flutter Modular for Routing](https://pub.dev/packages/flutter_modular)
- [Google Fonts for Font](https://pub.dev/packages/google_fonts)
- [Flutter Remix for Icon](https://pub.dev/packages/flutter_remix)
- [Flutter Dotenv for Environment Management](https://pub.dev/packages/flutter_dotenv)
- [Dio for HTTP request](https://pub.dev/packages/dio)
- [Cached Network Image for Image Request](https://pub.dev/packages/cached_network_image)
- [Intl for Time Format](https://pub.dev/packages/intl)

## Assets

i created example `json` folder dynamic API call

## Library

I'm using MVC / MVVC design pattern *not really sure what am i using, sorry.
and separated to each folder by type.

## Folder

### Components

used for base and custom component so its reusable

### models

used for Class and Data ChangeNotifier

### modules

used for reusable and global function

### pages

user for parent and its children page

## How To

### Run

Use `Flutter run` to run Project locally

### Build

Building apps have different way since it could be run on Android and iOS. But both type have its own behavior

#### Android

`flutter build apk` to build normally, but if you want it in smaller size you can split using `flutter build apk --split-per-abi`

#### iOS

`flutter build ipa`. But **XCode** is required. You must use a device running **macOS** to build.

## Screenshot

### Splash Screen

<img width="200" src="/assets/images/screenshot-splash.png" />

### Movie Page

<img width="200" src="/assets/images/screenshot-list.png" />
<img width="200" src="/assets/images/screenshot-detail.png" />
<img width="200" src="/assets/images/screenshot-detail-with-review.png" />

### Television Page

<img width="200" src="/assets/images/screenshot-list-2.png" />
<img width="200" src="/assets/images/screenshot-detail-2.png" />
<img width="200" src="/assets/images/screenshot-detail-with-review-2.png" />