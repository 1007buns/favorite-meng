import 'package:flutter/material.dart';
import 'package:flutter_application_1/meng_page.dart';
import 'package:flutter_application_1/photo_picker.dart';
import 'package:flutter_application_1/t_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'favorite_gesture/favorite_gesture.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isShow = true;
  String pic = 'asset/image/meng.jpg';
  TextEditingController _editingController =
      TextEditingController(text: 'favorite-meng');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(size),
      backgroundColor: Colors.black,
      body: _buildBackgroundPic(size),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return isShow
        ? FloatingActionButton(
            tooltip: '点击切换图片',
            onPressed: () => _onTapBackground(),
            backgroundColor: Colors.white30,
            child: const Icon(Icons.add),
          )
        : Container();
  }

  FavoriteGesture _buildBackgroundPic(Size size) {
    return FavoriteGesture(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.black,
        child: PhotoPickerPage(
          pic,
          width: size.width,
          // height: size.height,
        ),
      ),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0.0,
      leading: isShow
          ? Container(
              margin: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(const MengPage(), arguments: pic);
                },
                child: Hero(
                  tag: 'meng',
                  child: TImage(pic, shape: Shape.CIRCLE, width: 8, height: 8),
                ),
              ),
            )
          : Container(),
      title: isShow
          ? SizedBox(
              width: size.width / 2,
              child: TextField(
                controller: _editingController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                ),
              ),
            )
          : Container(),
      titleTextStyle: const TextStyle(fontSize: 25),
      actions: [
        IconButton(
          tooltip: '显示/隐藏控件',
          onPressed: () => setState(() => isShow = !isShow),
          icon: isShow
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite, color: Colors.grey),
        )
      ],
    );
  }

  Future<void> _onTapBackground() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    var path = pickedFile?.path;

    if (path != null) {
      pic = path.toString();
      setState(() {});
      print(path);
    }
  }
}
