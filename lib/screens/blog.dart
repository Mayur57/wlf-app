import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wlf/entity/blog_card.dart';
import 'package:wlf/widgets/header.dart';
import 'package:wlf/widgets/navbar.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();


}
//class BlogCard{
//  String title;
//  String article;
//
//  BlogCard(this.title,this.article);
//
//// BlogCard.fromJSON(Map<String, dynamic> json){
////   title = json["title"];
////   article = json["article"];
//// }
//}

class _BlogPageState extends State<BlogPage> {
  final _firestore = Firestore.instance;
  String title;
  String article;
  var i=0;
  var titles=[];
  var articles=[];

  List<BlogCard> _blogCards = [
    BlogCard("title0","article0"),
    BlogCard("title-1","article-1")
  ];

//  Future<List<BlogCard>> fetchBlogs() async {
//    var url = 'https://drive.google.com/file/d/1gEznNSAJZJOHWPEMoB2x9bPJeHsoW9oA/view?usp=sharing';
//    var blogs = List<BlogCard>();
//    var response = await http.get(url);
//    if (response.statusCode == 200) {
//      var blogsJson = json.decode(response.body);
//      for (var blogJson in blogsJson) {
//        blogs.add(BlogCard.fromJSON(blogJson));
//      }
//    } else {
//      print("Could not fetch data");
//    }
//    return blogs;
//  }

  @override
  void initState() {
//    fetchBlogs().then((value){
//      setState(() {
//        _blogCards.addAll(value);
//      });
//    });
  _getBlog();
  super.initState();
  }
   _getBlog() async {
    final blogs = await _firestore.collection('blogs').getDocuments();
setState(() {


  for (var blog in blogs.documents) {
    titles.add(blog.data["title"]);
    articles.add(blog.data["article"]);
    _blogCards.add( BlogCard(blog.data["title"],blog.data["article"]));
    print( _blogCards[i].article);
    print( _blogCards[i].title);

    i++;
  }
  for(var title in titles ){
    print(title);
  }
  print(i);
});


}
    @override
    Widget build(BuildContext context) {
      return Scaffold(
//        floatingActionButton: FloatingActionButton(
//            onPressed: () {
//
//            _getBlog();
//            setState(() {
//
//            });
//
//            }
//
//        ),
        backgroundColor: Color(0xFFFEEED7),
        bottomNavigationBar: SizedBox(
          height: 75,
          child: CustomNavbar(),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
                     ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text(
//                            _blogCards[index].title,
                          _blogCards[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            _blogCards[index].article,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _blogCards.length,
              ),
              Header(),
            ],
          ),
        ),
      );
    }
  }

