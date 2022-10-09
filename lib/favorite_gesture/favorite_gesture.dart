import 'package:flutter/material.dart';

import 'favorite_animation_icon.dart';

class FavoriteGesture extends StatefulWidget {
  static const double defaultSize = 100;
  final Widget child;
  final double size;

  const FavoriteGesture(
      {Key? key, required this.child, this.size = defaultSize})
      : super(key: key);

  @override
  State<FavoriteGesture> createState() => _FavoriteGestureState();
}

class _FavoriteGestureState extends State<FavoriteGesture> {
  final GlobalKey _key = GlobalKey();

  // 保存需要显示的icon
   List<Offset> _iconOffsets = [];

  // temp表示最近的一次双击坐标
  Offset temp = Offset.zero;

  Offset _globalToLocal(Offset global) {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(global);
  }

  @override
  Widget build(BuildContext context) {
    var iconStack = Stack(
        children: _iconOffsets
            .map((e) => FavoriteAnimationIcon(
                key: Key(e.toString()),
                size: widget.size,
                position: e,
                onAnimationComplete: () {
                  _iconOffsets.remove(e);
                }))
            .toList());
    return GestureDetector(
      key: _key,
      onDoubleTapDown: (details) {
        // 添加坐标到集合中，触发一次重绘制，根据坐标集合来不同的坐标上渲染出icon
        temp = _globalToLocal(details.globalPosition);
      },
      onDoubleTap: () {
        setState(() => _iconOffsets.add(temp));
      },
      child: Stack(
        children: [
          widget.child,
         iconStack,
        ],
      ),
    );
  }
}
