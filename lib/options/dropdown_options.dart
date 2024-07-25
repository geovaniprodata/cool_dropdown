import 'package:cool_dropdown/enums/dropdown_align.dart';
import 'package:cool_dropdown/enums/dropdown_animation.dart';
import 'package:cool_dropdown/enums/selected_item_align.dart';
import 'package:flutter/material.dart';

class DropdownOptions {
  /// The width of the dropdown.
  final double? width;

  /// The height of the dropdown.
  final double height, top, left;

  /// The color of the dropdown.
  final Color color;

  /// The border radius of the dropdown.
  final BorderRadius borderRadius;

  /// The border of the dropdown.
  final BorderSide borderSide;

  /// The shadows of the dropdown.
  final List<BoxShadow> shadows;

  /// The animation type of the dropdown, [size], [scale].
  final DropdownAnimationType animationType;

  /// The alignment of the dropdown. If the dropdown and result box are different sizes, the dropdown will be aligned to the result box
  final DropdownAlign align;

  /// The scroll alignment of the selected item in the dropdown.
  final SelectedItemAlign selectedItemAlign;

  /// The gap between the dropdown and dropdown items.
  final DropdownGap gap;

  /// The padding of the dropdown.
  final EdgeInsets padding;

  /// The duration of the dropdown scroll animation.
  final Duration duration;

  /// The curve of the dropdown scroll animation.
  final Curve curve;

  /// The color of icon when dropdown item is selected.
  final Color? selectedIconColor;

  const DropdownOptions({
    this.width,
    this.height = 220,
    this.top = 0,
    this.left = 0,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.borderSide = BorderSide.none,
    this.selectedIconColor = Colors.black,
    this.shadows = const [
      BoxShadow(
        color: Color(0x1a9E9E9E),
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(0, 1),
      )
    ],
    this.animationType = DropdownAnimationType.scale,
    this.align = DropdownAlign.center,
    this.selectedItemAlign = SelectedItemAlign.center,
    this.gap = DropdownGap.zero,
    this.padding = EdgeInsets.zero,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  /// The max blur radius plus max spread radius of the dropdown.
  double get shadowMaxBlurRadiusPlusMaxSpreadRadius {
    double max = 0;
    for (final shadow in shadows) {
      final blurRadius = shadow.blurRadius;
      final spreadRadius = shadow.spreadRadius;
      final offset = shadow.offset;
      final maxBlurRadiusPlusMaxSpreadRadius = blurRadius + spreadRadius + offset.distance;
      if (maxBlurRadiusPlusMaxSpreadRadius > max) {
        max = maxBlurRadiusPlusMaxSpreadRadius;
      }
    }
    return 2 * max;
  }

  /// padding - dropdown border width
  EdgeInsets get calcPadding => animationType == DropdownAnimationType.size
      ? EdgeInsets.only(
          top: borderSide.width * 0.5 + padding.top,
          bottom: borderSide.width * 0.5 + padding.bottom,
          left: borderSide.width * 0.5 + padding.left,
          right: borderSide.width * 0.5 + padding.right,
        )
      : EdgeInsets.zero;

  /// dropdown border width + shadow max blur radius plus max spread radius to show shadow
  EdgeInsets get marginGap => animationType == DropdownAnimationType.size
      ? EdgeInsets.only(
          top: borderSide.width * 0.5 + shadowMaxBlurRadiusPlusMaxSpreadRadius,
          bottom: borderSide.width * 0.5 + shadowMaxBlurRadiusPlusMaxSpreadRadius,
          left: borderSide.width * 0.5 + shadowMaxBlurRadiusPlusMaxSpreadRadius,
          right: borderSide.width * 0.5 + shadowMaxBlurRadiusPlusMaxSpreadRadius,
        )
      : EdgeInsets.zero;
}

class DropdownGap {
  final double top;
  final double bottom;
  final double betweenItems;
  final double betweenDropdownAndEdge;

  const DropdownGap.all(double gap)
      : top = gap,
        bottom = gap,
        betweenItems = gap,
        betweenDropdownAndEdge = gap;

  const DropdownGap.only({
    this.top = 0,
    this.bottom = 0,
    this.betweenItems = 0,
    this.betweenDropdownAndEdge = 0,
  });

  static const DropdownGap zero = DropdownGap.all(0);
}
