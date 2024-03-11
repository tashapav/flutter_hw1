import 'package:flutter/material.dart';
import 'package:hw1/models/article_model.dart';
import 'package:dio/dio.dart';


class News {

  Future<List<ArticleModel>> getNews() async {

    final response = await Dio().get("https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=cac479a092844cfcb5788863af6e481c");

    final data = response.data['articles'] as List<dynamic>;
    List<ArticleModel> newsList = [];

    for (var el in data) {
      if (el['author'] != null && el['title'] != null && el['description'] != null && el['url'] != null && el['urlToImage'] != null && el['content'] != null) {
        newsList.add(ArticleModel(author: el['author'], title: el['title'], description: el['description'], url: el['url'], 
          urlToImage: el['urlToImage'], content: el['content']));
      }
    }
 
    return newsList;
  }
}