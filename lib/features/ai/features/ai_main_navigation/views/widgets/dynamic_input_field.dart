import 'package:flutter/material.dart';

class DynamicInputField extends StatelessWidget {
  const DynamicInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.blueGrey)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          TextField(
            maxLines: null,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Describe or Ask Snapsticker',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 25)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined, size: 25),
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send, size: 25)),
            ],
          ),
        ],
      ),
    );
  }
}
