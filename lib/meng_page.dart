import 'package:flutter/cupertino.dart';

import 'package:flutter_application_1/t_image.dart';
import 'package:get/get.dart';

class MengPage extends StatelessWidget {
  const MengPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pic = Get.arguments;
    return Hero(
      tag: 'meng',
      child: Center(
        child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: TImage(pic)),
      ),
    );
  }
}
