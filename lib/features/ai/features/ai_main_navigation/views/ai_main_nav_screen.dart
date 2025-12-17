import 'package:flutter/material.dart';
import 'package:snapsticker/features/ai/features/ai_main_navigation/views/dynamic_input_field.dart';

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

class AIMainNavBodyPages extends StatelessWidget {
  const AIMainNavBodyPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 120),
      //note: main column
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            //note: take ai snap
            Text(
              '  Take AI Snap',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: SizedBox(
                height: 200,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .end,
                    children: [
                      Icon(Icons.camera, size: 60, color: Colors.blueGrey),
                    ],
                  ),
                ),
              ),
            ),
            //note: top trending
            SizedBox(height: 20),
            Text(
              '  Top Trending',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) =>
                    Card(child: SizedBox(height: 200, width: 125)),
              ),
            ),
            //note: your stickers
            SizedBox(height: 20),
            Text(
              '  Your Stickers',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) =>
                    Card(child: SizedBox(height: 125, width: 125)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
