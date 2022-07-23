import 'package:flutter/material.dart';

typedef NameCallBack = void Function(String?);

class NewItemDialog extends StatefulWidget {
  final String title;
  final NameCallBack callBack;

  const NewItemDialog({Key? key, required this.title, required this.callBack})
      : super(key: key);

  @override
  State createState() => _NewItemDialogState();
}

class _NewItemDialogState extends State<NewItemDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final query = MediaQuery.of(context);
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 150,
        height: 80,
        child: TextField(
          // decoration: const InputDecoration(border: InputBorder.none),
          keyboardType: TextInputType.text,
          autofocus: true,
          maxLines: 1,
          cursorColor: Colors.black,
          controller: textController,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.callBack(null);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.callBack(textController.text);
            },
            child: const Text('New')),
      ],
    );
  }
}
