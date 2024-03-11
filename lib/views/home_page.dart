import 'package:flutter/material.dart';
import 'package:hw1/data/news.dart';
import 'package:hw1/models/article_model.dart';
import 'package:hw1/views/article_page.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
 
  List<ArticleModel>? _articles;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    _articles = await News().getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("News",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        Text("Theme")
          ] 
        ),
      ),

      body: (_articles == null) ? const Center(
        child: CircularProgressIndicator()
      ) : Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(title: _articles![index].title, description: _articles![index].description, image: _articles![index].urlToImage,
                    url: _articles![index].url, author: _articles![index].author, content: _articles![index].content);
                  },
                  itemCount: _articles!.length),
              ),
    );
  }
}


class Card extends StatelessWidget {
  final String title, description, image, url, author, content;
  const Card({super.key, required this.title, required this.description, required this.image, required this.url, required this.author, required this.content});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticlePage(title: title, content: content, image: image, 
        url: url, author: author)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14, top: 14),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(image),
            ),
            Text(title, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 14),),
          ],
        ),
      ),
    );
  }
}