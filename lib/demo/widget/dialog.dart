import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              FlatButton(
                child: Text('list dialog'),
                onPressed: () {
                  _showListDialog(context);
                },
              ),
              FlatButton(
                child: Text('click'),
                onPressed: () {
                  _showCustomDialog(context);
                },
              ),
              FlatButton(
                child: Text("custom"),
                onPressed: () {
                  showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showListDialog(BuildContext context) async {
    int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Column(
            children: [
              ListTile(
                title: Text("select"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                ),
              )
            ],
          ));
        });
    print(index);
  }

  Future<void> _showCustomDialog(BuildContext context) async {
    int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280, maxHeight: 200),
              child: Material(
                child: Container(
                  color: Colors.red,
                ),
                type: MaterialType.card,
              ),
            ),
          );
        });
    print(index);
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissble = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          final Widget pageChild = Builder(builder: builder);
          return SafeArea(
            child: Builder(builder: (BuildContext context) {
              return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
            }),
          );
        },
        barrierDismissible: barrierDismissble,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        transitionDuration: const Duration(microseconds: 150),
        transitionBuilder: _buildMaterialDialogTransitions);
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
