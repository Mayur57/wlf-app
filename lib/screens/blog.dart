import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wlf/entity/blog_card.dart';
import 'package:wlf/widgets/header.dart';
import 'package:wlf/widgets/navbar.dart';
import 'package:http/http.dart' as http;

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  List<BlogCard> _blogCards = List<BlogCard>();

  Future<List<BlogCard>> fetchBlogs() async {
    var url = 'https://drive.google.com/file/d/1gEznNSAJZJOHWPEMoB2x9bPJeHsoW9oA/view?usp=sharing';
    var blogs = List<BlogCard>();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var blogsJson = json.decode(response.body);
      for (var blogJson in blogsJson) {
        blogs.add(BlogCard.fromJSON(blogJson));
      }
    } else {
      print("Could not fetch data");
    }
    return blogs;
  }

  @override
  void initState() {
    fetchBlogs().then((value){
      setState(() {
        _blogCards.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
