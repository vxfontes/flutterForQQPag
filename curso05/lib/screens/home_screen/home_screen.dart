import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/logout.dart';
import 'package:flutter_webapi_first_course/screens/commom/exception_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/journal.dart';
import '../../services/journal_service.dart';
import 'widgets/home_screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();
  final JournalService _journalService = JournalService();

  String userId = '';

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
        actions: [
          IconButton(
            onPressed: () {
              refresh();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          userId: userId,
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
          refreshFunction: refresh,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                logout(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void refresh() async {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString('accessToken');
      String? id = prefs.getString('id');
      String? email = prefs.getString('email');

      if (token != null && id != null && email != null) {
        _journalService.getAll(id).then((List<Journal> listJournal) {
          setState(() {
            userId = id;
            database = {};
            for (Journal journal in listJournal) {
              database[journal.id] = journal;
            }

            if (_listScrollController.hasClients) {
              final double position =
                  _listScrollController.position.maxScrollExtent;
              _listScrollController.jumpTo(position);
            }
          });
        }).catchError((e) {
          logout(context);
        }, test: (error) => error is TokenNotValidException
        ).catchError((e) {
          showExceptionDialog(context, content: e.message);
        }, test: (error) => error is HttpException);
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }
}
