import 'package:english_words/english_words.dart' as english_words;
import './user.dart';

class UsersGenerater {
  List<User> generate() {
    return english_words.nouns.take(50).map((e) => User(name: e)).toList();
  }
}
