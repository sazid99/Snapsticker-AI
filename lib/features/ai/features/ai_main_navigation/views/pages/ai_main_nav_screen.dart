import 'package:flutter/material.dart';
import 'package:snapsticker/features/ai/features/ai_main_navigation/views/widgets/ai_main_nav_body.dart';
import 'package:snapsticker/features/ai/features/ai_main_navigation/views/widgets/dynamic_input_field.dart';

class AiMainNavScreen extends StatefulWidget {
  const AiMainNavScreen({super.key});

  @override
  State<AiMainNavScreen> createState() => _AiMainNavScreenState();
}

class _AiMainNavScreenState extends State<AiMainNavScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        //note: appbar
        appBar: AppBar(
          title: Text(
            'Snapsticker',
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.new_label_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
          ],
        ),
        //note: drawer
        drawer: Drawer(),
        //note: body
        body: AIMainNavBodyPages(),
        //note: bottom sheet input field  input field
        bottomSheet: DynamicInputField(),
      ),
    );
  }
}
