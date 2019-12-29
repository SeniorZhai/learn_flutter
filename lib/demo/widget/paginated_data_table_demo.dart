import 'package:flutter/material.dart';
import '../../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectCount = 0;
  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectCount;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Container(
            width: 60.0,
            child: Text(post.title),
          ),
        ),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl))
      ],
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;
  final PostDataSource _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              source: _postsDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              rowsPerPage: 5,
              // onSelectAll: (value){},
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int columnIndex, bool ascending) {
                      _postsDataSource._sort(
                          (post) => post.title.length, ascending);
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('image')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
