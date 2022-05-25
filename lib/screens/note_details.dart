import 'package:flutter/material.dart';
import 'package:note_app/models/mycard.dart';
import 'package:note_app/services/db_helper.dart';

class NoteDetails extends StatefulWidget {
  MyNote? myNote;
  NoteDetails({this.myNote});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _subTitleTextEditingController =
      TextEditingController();
  bool isEditable = false;

  initData() {
    _titleTextEditingController.text = widget.myNote!.title!;
    _subTitleTextEditingController.text = widget.myNote!.subTitle!;
  }

  update() async {
    await DBHelper.dbHelper.updateTask(MyNote(
        id: widget.myNote!.id,
        title: _titleTextEditingController.text,
        subTitle: _subTitleTextEditingController.text));
  }

  addNewTask(){
DBHelper.dbHelper.addTask(MyNote(
                          title: _titleTextEditingController.text,
                          subTitle: _subTitleTextEditingController.text));
  }

  @override
  void initState() {
    isEditable = false;
    widget.myNote != null ? initData() : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title:const Text(
          'Nots',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                isEditable = !isEditable;
                setState(() {});
                if (isEditable != true) {
                  widget.myNote != null
                      ? update()
                      : addNewTask();
                }
              },
              icon: isEditable ? Icon(Icons.save) : Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: TextFormField(
                enabled: isEditable,
                controller: _titleTextEditingController,
                maxLines: 3,
                style: const TextStyle(color: Colors.white, fontSize: 30),
                decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
                enabled: isEditable,
                controller: _subTitleTextEditingController,
                maxLines: 30,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: const InputDecoration(
                    hintText: "Sub Title",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
        ],
      ),
    );
  }
}
