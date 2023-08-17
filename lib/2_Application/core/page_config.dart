import 'package:flutter/cupertino.dart';

class PageConfig {
  final Widget child;
  const PageConfig({
    Widget ? child }) : child = child ?? const Placeholder();
}