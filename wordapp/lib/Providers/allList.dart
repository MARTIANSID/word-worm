import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Word {
  String title;
  String description;
  List link;
  String th;
  Word({this.description, this.link, this.th, this.title});
}

class Words with ChangeNotifier {
  String uurl = 'https://stuck.daxy.in/';

  int totalWords = 0;
  int wordsLearnedToday = 0;
  List<dynamic> words = [];

  Future<void> getWords() async {
    try {
      final reponse = await http.get('${uurl}word');
      final responseData = json.decode(reponse.body);
      words = responseData['details']['words']
          .map((i) => Word(
                description: i['description'],
                title: i['title'],
                th: i["thesaurus"],
              ))
          .toList();
      totalWords = responseData['details']["totalWords"];
      wordsLearnedToday = responseData['details']["wordsLearntToday"];

      print(wordsLearnedToday);
      print(words);
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  Future<void> addWord({title, description, link, th}) async {
    try {
      print(title);
      print(th);
      print(description);

      wordsLearnedToday = wordsLearnedToday + 1;
      totalWords = totalWords + 1;

      final response = await http.post('${uurl}word',
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            "title": title,
            "description": description == null ? "" : description,
            "thesaurus": th == null ? "" : th,
            "links": ["this is link"],
          }));
      await getWords();
      notifyListeners();
      final responseBody = jsonDecode(response.body);

      if (responseBody['error'] == true)
        throw HttpException(responseBody['details']['message']);
      // print('PP checkIfRegistered response: $responseBody');
      return responseBody['registered'];
    } catch (err) {
      throw err;
    }
  }
}
