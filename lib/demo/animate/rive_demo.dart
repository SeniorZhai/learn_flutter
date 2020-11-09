import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveDemo extends StatefulWidget {
  @override
  _RiveDemoState createState() => _RiveDemoState();
}

class _RiveDemoState extends State<RiveDemo> {
  final riveFileName = 'assets/rive/off_road_car.riv';
  Artboard _artboard;
  RiveAnimationController _wipersController;
  bool _wipers = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();
    if (file.import(bytes)) {
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('idle'),
        ));
    }
  }

  void _wipersChange(bool wipersOn) {
    if (_wipersController == null) {
      _artboard.addController(
          _wipersController = SimpleAnimation('windshield_wipers'));
    }
    setState(() => _wipersController.isActive = _wipers = wipersOn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Rive')), body: buildContainer());
  }

  Widget buildContainer() {
    return Column(
      children: [
        Expanded(
          child: _artboard != null
              ? Rive(
                  artboard: _artboard,
                  fit: BoxFit.cover,
                )
              : Container(),
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: SwitchListTile(
            title: const Text('Wipers'),
            value: _wipers,
            onChanged: _wipersChange,
          ),
        ),
      ],
    );
  }
}
