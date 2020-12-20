import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Post.dart';
import 'Postlist.dart';
import 'textInput.dart';
import 'database.dart';
import 'package:hello/database.dart';

class Myhomepage extends StatefulWidget {
  final FirebaseUser user;
  Myhomepage(this.user);
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  List<Post> posts = [];

  
  void newPost(String text){
    var post= new Post(text ,widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    }
    );
  } 
  void updatePosts() {
    getAllMessages().then((posts)=>{
      this.setState(() {
        this.posts = posts;
      })
    });
  }
  @override
  void initState() {
    super.initState();
    updatePosts();
  }
@override
  Widget build (BuildContext context) {
    return Scaffold(
    appBar: AppBar(title : Text( 'Hello')), 
    body: Column(children:<Widget>[
      Expanded(child:PostList(this.posts, widget.user)),
       TextInputWidget(this.newPost) 
       ])
    ); 
      
  }
}