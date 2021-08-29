import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
class MovieDetailsThumbnail extends StatelessWidget {

  final String thumbnail;

  const MovieDetailsThumbnail({Key? key,required this.thumbnail}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,
              color: Colors.white,),

          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.topCenter,
              end:  Alignment.bottomCenter,

            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0,),
      child: Row(
        children: [
          MoviePoster(poster : movie.Images[2].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: MovieDetailHeader(movie:movie),
          ),
        ],
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.Year}.\n${movie.Genre}".toUpperCase(),style:
        TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.indigo,
        ),
        ),
        Text(movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        Text.rich(
          TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: movie.Plot,
                ),
                TextSpan(
                  text: "More...",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ]
          ),
        ),
      ],
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10));
    return Card(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          MovieField(field:"Cast",value: movie.Actors),
          SizedBox(
            height: 30,
          ),
          MovieField(field:"Director",value:movie.Director),
          SizedBox(
            height: 30,
          ),
          MovieField(field:"Awards",value:movie.Awards),
          SizedBox(
            height: 30,
          ),
          MovieField(field: "IMDB rating", value: movie.imdbRating),
          SizedBox(
            height: 30,
          ),
          MovieField(field: "Language", value: movie.Language),
          SizedBox(
            height: 30,
          ),
          MovieField(field: "Meta Score", value: movie.Metascore),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {

  final String field;
  final String value;

  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$field :' , style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        ),
        Expanded(
          child: Text('$value' , style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          ),)
      ],
    );
  }
}