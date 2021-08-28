import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List movies=[
    "Titanic",
    "Blade Runner",
    "Avatar",
    "Forrest Gump"
    "Goodfellas",
    "Scarface",
    "The Godfather ",
    "Game of thrones",
    "300",
    "I am a Legend",
    "The Avangers",
    "The End game",
    "Game of thrones",
    "300",
    "I am a Legend",
    "The Avangers",
    "The End game",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(itemCount:movies.length,itemBuilder: (BuildContext context,int index){
        return Card(
          elevation: 4.5,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),

                ),
              ),
            ),
            title: Text(movies[index]),
            subtitle: Text("Movie short description"),
          ),
        );
      }),
    );
  }
}
