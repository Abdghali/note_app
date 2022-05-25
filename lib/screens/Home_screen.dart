import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/card.dart';
import 'package:note_app/screens/note_details.dart';

import '../models/mycard.dart';
import '../services/db_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyNote> myNotes = [];
  getAllNotes() async {
    myNotes = await DBHelper.dbHelper.getAllTasks();
    setState(() {});
  }

  @override
  void initState() {
    getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar:true ,
      backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Nots',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                getAllNotes();
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: myNotes.length < 1
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6),
              itemCount: myNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NoteDetails(
                                    myNote: MyNote(
                                        id: myNotes[index].id,
                                        title: myNotes[index].title,
                                        subTitle: myNotes[index].subTitle),
                                  ))).then((value) => getAllNotes());
                    },
                    child: MyCard(
                      myNote: MyNote(
                          id: myNotes[index].id,
                          title: myNotes[index].title,
                          subTitle: myNotes[index].subTitle),
                    ));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NoteDetails())).then((value) => getAllNotes());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
    );
  }
}
