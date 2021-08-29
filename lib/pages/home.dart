import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie>  movieList = Movie.getMovie();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(itemCount:movieList.length,itemBuilder: (BuildContext context,int index){
        return Stack(
            children: [

               movieCard(movieList[index], context),

              Positioned(
                top: 10,
                child: movieImage(movieList[index].Images[1]),
              )
            ],
           );
        // return Card(
        //   elevation: 4.5,
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //             //color: Colors.blue,
        //
        //           image: DecorationImage(
        //
        //             image: NetworkImage(movieList[index].Images[0]),
        //             fit: BoxFit.cover,
        //           ),
        //             borderRadius: BorderRadius.circular(14),
        //
        //         ),
        //         child : null,
        //       ),
        //     ),
        //     trailing: Text("---"),
        //     title: Text('${movieList[0].title}'),
        //     subtitle: Text("${movieList[0].Director}"),
        //     onTap: (){
        //       Navigator.push(context, MaterialPageRoute(
        //           builder: (context)=>MovieListViewDetails(movieName: movieList.elementAt(index).title,
        //             movie: movieList[index],),)
        //       );
        //     },
        //   ),
        // );
      }),
    );
  }
  Widget movieCard(Movie movie,BuildContext context){
     return InkWell(
       child: Container(
         margin: EdgeInsets.only(left: 60),
         width: MediaQuery.of(context).size.width,
         height: 120.0,
         child: Card(
           color: Colors.black45,
           child: Padding(
             padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
             left: 54.0),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Flexible(
                        child:  Text(movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                       Text("Rating :${movie.imdbRating} / 10",
                         style: TextStyle(

                           fontSize: 15,
                           color: Colors.grey,

                         ),
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text("Released : ${movie.Released}",
                         style: mainTextStyle()
                       ),
                       Text(movie.Runtime,
                         style:mainTextStyle()
                       ),
                       // Text(movie.Rated,
                       //   style: mainTextStyle(),
                       // ),
                     ],
                   ),


                 ],
               ),
             ),
           ),
         ),
       ),
    onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>MovieListViewDetails(movieName: movie.title,
                movie: movie,),)
          );
        },
     );
  }
  TextStyle mainTextStyle(){
    return TextStyle(


        fontSize: 15,
        color: Colors.grey,


    );
  }
  Widget movieImage(String imageUrl){
    String url = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.nCmpm-dgx_C1AqBSz-2C-QHaHa%26pid%3DApi&f=1';
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? url),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
//new screen 
class MovieListViewDetails extends StatelessWidget {
  
  final String movieName;
   final Movie movie;

  const MovieListViewDetails({Key? key, required this.movieName,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details of ${this.movie.title}"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () { 
              Navigator.pop(context);
            },
            child: Text("Go Back ${this.movie.Director}"),
          ),
        ),
      ),
    );
  }
}

