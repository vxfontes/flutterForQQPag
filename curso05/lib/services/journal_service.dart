import 'dart:convert';
import 'dart:io';
import 'package:flutter_webapi_first_course/services/webclient.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/journal.dart';

class JournalService {

  String url = WebClient.url;
  http.Client client = WebClient().client;

  static const String resource = "journals/";

  String getURL() {
    return "$url$resource";
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<bool> register(Journal journal) async {
    String journalJSON = json.encode(journal.toMap());

    String token = await getToken();
    http.Response response = await client.post(
      getUri(),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: journalJSON,
    );

    if (response.statusCode != 201) {
      verifyException(json.decode(response.body));
    }

    return false;
  }

  Future<bool> edit(String id, Journal journal) async {
    String journalJSON = json.encode(journal.toMap());

    String token = await getToken();
    http.Response response = await client.put(
      Uri.parse("${getURL()}$id"),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: journalJSON,
    );

    if (response.statusCode != 200) {
      verifyException(json.decode(response.body));
    }

    return true;
  }

  Future<List<Journal>> getAll(String id) async {
    String token = await getToken();
    http.Response response = await client.get(
      Uri.parse("${url}users/$id/$resource"),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      verifyException(json.decode(response.body));
    }

    List<Journal> result = [];

    List<dynamic> jsonList = json.decode(response.body);
    for (var jsonMap in jsonList) {
      result.add(Journal.fromMap(jsonMap));
    }

    return result;
  }

  Future<bool> remove(String id) async {
    String token = await getToken();
    http.Response response = await client.delete(
      Uri.parse("${getURL()}$id"),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      verifyException(json.decode(response.body));
    }

    return true;
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');
    if (token != null) {
      return token;
    }
    return '';
  }

  verifyException(String error) {
    switch (error) {
      case 'jwt expired':
        throw TokenExpiredException();
    }

    throw HttpException(error);
  }
}

class TokenNotValidException implements Exception {}
class TokenExpiredException implements Exception {}