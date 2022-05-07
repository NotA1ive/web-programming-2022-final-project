import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    double parentWidth = MediaQuery.of(context).size.width;
    double parentHeight = MediaQuery.of(context).size.height;

    List<Widget> positionedList = [
      HumanProtrait(
        index: 3,
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      ),
      HumanProtrait(
        index: 2,
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      ),
      HumanProtrait(
        index: 1,
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      ),
      HumanProtrait(
        index: 0,
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      ),
      Dialog(
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      ),
      DialogText(
        screenWidth: parentWidth,
        screenHeight: parentHeight,
        message: '我太難了！',
        userName: 'Alan',
      ),
      Live2dSkin(
        screenWidth: parentWidth,
        screenHeight: parentHeight,
      )
    ];

    return Scaffold(
      body: Stack(children: positionedList),
    );
  }
}

// Positioned Human Protrait
class HumanProtrait extends Positioned {
  HumanProtrait(
      {Key? key,
      int index = 0,
      double screenWidth = 500,
      double screenHeight = 1000,
      String imagePath = 'assets/pic/human.png'})
      : super(
            key: key,
            left: screenWidth * (0.3 + index * 0.15),
            bottom: screenHeight * 0.5 - screenWidth * (0.75 - index * 0.15),
            child: Opacity(
              opacity: 1 / (index + 1),
              child: Image(
                image: AssetImage(imagePath),
                width: screenWidth * 0.4,
                height: screenWidth * 0.4 * 2.5,
              ),
            ));
}

// Positioned Bubble Dialog
class Dialog extends Positioned {
  Dialog({Key? key, double screenWidth = 500, double screenHeight = 1000})
      : super(
          key: key,
          left: screenWidth * 0.2,
          top: 0,
          child: Image(
              image: const AssetImage('assets/pic/dialog.png'),
              width: screenWidth * 0.6,
              height: screenHeight * 0.2,
              fit: BoxFit.fill),
        );
}

// Positioned Text
class DialogText extends Positioned {
  DialogText(
      {Key? key,
      double screenWidth = 500,
      double screenHeight = 1000,
      String message = '',
      String userName = ''})
      : super(
            key: key,
            left: screenWidth * 0.25,
            top: 0,
            child: SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.175,
                child: Center(
                    child: ListTile(
                  title: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('--- ' + userName,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ))));
}

// Positioned live2d skin
class Live2dSkin extends Positioned {
  Live2dSkin({Key? key, double screenWidth = 500, double screenHeight = 1000})
      : super(
          key: key,
          left: 0,
          bottom: 0,
          child: Image(
              image: const AssetImage('assets/pic/hiyori.png'),
              width: screenWidth * 0.4,
              height: screenWidth * 0.9,
              fit: BoxFit.fill),
        );
}
