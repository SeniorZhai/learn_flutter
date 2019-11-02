import 'dart:io';

import 'package:async/async.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoItem {
  final int id;
  final String content;
  final bool isDone;
  final DateTime createdAt;

  TodoItem({this.id, this.content, this.isDone = false, this.createdAt});

  TodoItem.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'],
        isDone = map['isDone'] == 1,
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'content': content,
        'isDone': isDone ? 1 : 0,
        'createdAt': createdAt.millisecondsSinceEpoch
      };
}

class SqliteDemo extends StatefulWidget {
  @override
  _SqliteDemoState createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  static const kDbFilename = "sqlite_ex.db";
  static const kDbTableName = "demo_tb1";
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  Database _db;
  List<TodoItem> _todos = [];

  Future<void> _initDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, kDbFilename);
    this._db = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS $kDbTableName(
        id INTEGER PRIMARY KEY,
        isDone BIT NOT NULL,
        content TEXT,
        createdAt INTEGER
      )
      ''');
    });
  }

  Future<void> _getTodoItems() async {
    List<Map> jsons = await this._db.rawQuery('SELECT * FROM $kDbTableName');
    print('${jsons.length} rows retrieved from db!');
    this._todos = jsons.map((json) => TodoItem.fromJsonMap(json)).toList();
  }

  Future<void> _addTodoItem(TodoItem todo) async {
    await this._db.transaction(
      (Transaction txn) async {
        int id = await txn.rawInsert('''
          INSERT INTO $kDbTableName
            (content, isDone, createdAt)
          VALUES
            (
              "${todo.content}",
              ${todo.isDone ? 1 : 0}, 
              ${todo.createdAt.millisecondsSinceEpoch}
            )''');
        print('Inserted todo item with id=$id.');
      },
    );
  }

  Future<void> _toggleTodoItem(TodoItem todo) async {
    int count = await this._db.rawUpdate('''
      UPDATE $kDbTableName
        SET isDone = ?
        WHERE id = ?
    ''', [todo.isDone ? 0 : 1, todo.id]);
    print('Updated $count records in db');
  }

  Future<void> _deleteTodoItem(TodoItem todo) async {
    final count = await this._db.rawDelete('''
        DELETE FROM $kDbTableName
        WHERE id = ${todo.id}
      ''');
    print('Updated $count records in db.');
  }

  Future<bool> _asyncInit() async {
    await _memoizer.runOnce(() async {
      await _initDb();
      await _getTodoItems();
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _asyncInit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == false)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Scaffold(
          appBar: AppBar(title: Text("Sql demo")),
          body: ListView(
            children: this._todos.map(_itemToListTile).toList(),
          ),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }

  Future<void> _updateUI() async {
    await _getTodoItems();
    setState(() {});
  }

  ListTile _itemToListTile(TodoItem todo) => ListTile(
        title: Text(
          todo.content,
          style: TextStyle(
              fontStyle: todo.isDone ? FontStyle.italic : null,
              color: todo.isDone ? Colors.grey : null,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text('id=${todo.id}\ncreated at ${todo.createdAt}'),
        isThreeLine: true,
        leading: IconButton(
          icon: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
          onPressed: () async {
            await _toggleTodoItem(todo);
            _updateUI();
          },
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await _deleteTodoItem(todo);
              _updateUI();
            }),
      );

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _addTodoItem(
          TodoItem(
            content: english_words.generateWordPairs().first.asPascalCase,
            createdAt: DateTime.now(),
          ),
        );
        _updateUI();
      },
    );
  }
}
