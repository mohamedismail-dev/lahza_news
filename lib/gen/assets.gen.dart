// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.svg
  String get arrowLeft => 'assets/icons/arrow_left.svg';

  /// File path: assets/icons/arrow_right.svg
  String get arrowRight => 'assets/icons/arrow_right.svg';

  /// File path: assets/icons/lang.svg
  String get lang => 'assets/icons/lang.svg';

  /// File path: assets/icons/theme.svg
  String get theme => 'assets/icons/theme.svg';

  /// List of all assets
  List<String> get values => [arrowLeft, arrowRight, lang, theme];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/category1.png
  AssetGenImage get category1 =>
      const AssetGenImage('assets/images/category1.png');

  /// File path: assets/images/category2.png
  AssetGenImage get category2 =>
      const AssetGenImage('assets/images/category2.png');

  /// File path: assets/images/category3.png
  AssetGenImage get category3 =>
      const AssetGenImage('assets/images/category3.png');

  /// File path: assets/images/category4.png
  AssetGenImage get category4 =>
      const AssetGenImage('assets/images/category4.png');

  /// File path: assets/images/category5.png
  AssetGenImage get category5 =>
      const AssetGenImage('assets/images/category5.png');

  /// File path: assets/images/category6.png
  AssetGenImage get category6 =>
      const AssetGenImage('assets/images/category6.png');

  /// File path: assets/images/category7.png
  AssetGenImage get category7 =>
      const AssetGenImage('assets/images/category7.png');

  /// File path: assets/images/logo_app_icon.png
  AssetGenImage get logoAppIcon =>
      const AssetGenImage('assets/images/logo_app_icon.png');

  /// File path: assets/images/logo_splash_dark.png
  AssetGenImage get logoSplashDark =>
      const AssetGenImage('assets/images/logo_splash_dark.png');

  /// File path: assets/images/logo_splash_light.png
  AssetGenImage get logoSplashLight =>
      const AssetGenImage('assets/images/logo_splash_light.png');

  /// File path: assets/images/no_connection.svg
  String get noConnection => 'assets/images/no_connection.svg';

  /// File path: assets/images/no_news.svg
  String get noNews => 'assets/images/no_news.svg';

  /// List of all assets
  List<dynamic> get values => [
    category1,
    category2,
    category3,
    category4,
    category5,
    category6,
    category7,
    logoAppIcon,
    logoSplashDark,
    logoSplashLight,
    noConnection,
    noNews,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
