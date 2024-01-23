import 'package:grimorio/dao/book_database.dart';
import 'package:grimorio/models/google_book.dart';
import 'package:grimorio/models/personal_book.dart';

class BookController {
  PersonalBookDatabase database = PersonalBookDatabase();

  void addBook(GoogleBook googleBook, String dayStarted, String dayFinished, String comments) {
    PersonalBook newPersonalBook = PersonalBook(dayStarted: dayStarted, dayFinished: dayFinished, comments: comments, googleBook: googleBook);

    database.save(newPersonalBook);
  }

  Future<List<PersonalBook>> getBooks() async {
    return database.findAll();
  }

  void updateBook(PersonalBook personalBook) {
    database.save(personalBook);
  }

  void deleteBook(PersonalBook personalBook) {
    database.delete(personalBook);
  }
}