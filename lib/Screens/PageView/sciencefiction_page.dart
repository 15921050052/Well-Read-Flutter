import "package:flutter/material.dart";
import 'package:well_read/Modal/sciencefiction_books.dart';

class ScienceFictionPage extends StatefulWidget {
  const ScienceFictionPage({ Key key }) : super(key: key);

  @override
  ScienceFictionPageState createState() => new ScienceFictionPageState();

}

class ScienceFictionPageState extends State<ScienceFictionPage>{

  @override
  Widget build(BuildContext context) {
    ///create book tile hero
    createTile(Book book) => Hero(
      tag: book.title,
      child: Material(
        elevation: 13.0,
        shadowColor: Colors.indigo.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'detail/${book.title}');
          },
          child: Image(
            image: AssetImage(book.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    /// Create book grid tiles that displays entire array of books
    /// will be placed in HomePage and each category page
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    return new Scaffold(
      backgroundColor: Colors.indigo.shade300,
      body:grid,
      bottomNavigationBar: new PreferredSize(
        preferredSize: new Size (0.0, 0.0),
        child: new Container(
          color: Colors.deepPurple,
          child: new Text("Sci-Fi Books", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),),
        ),
      ),
    );
  }
}