import 'package:chat_application_iub_cse464/const_config/text_config.dart';
import 'package:flutter/material.dart';

import '../../../const_config/color_config.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.scaffoldColor,
      body: Center(
        child: Text("Updates Coming soon....",style: TextDesign().bodyTextSmall,),
      ),
    );
  }
}