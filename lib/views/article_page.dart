import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final String  title, image, url, author, content;
  const ArticlePage({required this.title, required this.image, required this.url, required this.author, required this.content});

  void openLink() async {
    Uri uri = Uri.parse(url);
    //if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    //} else {
      //throw "error launching";
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(image),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: openLink,
              child: Text(url, style:  const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
            ),
            const SizedBox(height: 15,),
            Text(author, style:  TextStyle(color: Colors.grey[600], fontSize: 12),),
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            const SizedBox(height: 20,),
            Text(content, style: TextStyle(color: Colors.grey[800], fontSize: 14),),
          ],
        ),
      ),
    );
  }
}

