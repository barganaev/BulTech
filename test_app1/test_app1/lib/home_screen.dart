import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Chekcbox values
  bool _checked1 = true;
  bool _checked2 = false;

  // Slider value
  double _changed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundCheckBox(
                  isChecked: _checked1,
                  checkedColor: Colors.blue,
                  // uncheckedColor: Colors.red,
                  animationDuration: Duration(
                      milliseconds: _changed.toInt() + 200
                  ),
                  onTap: (value) {
                    setState(() {
                      _checked1 = value!;
                      _checked2 = !value;
                    });
                  }
              ),
              RoundCheckBox(
                isChecked: _checked2,
                checkedColor: Colors.green,
                // uncheckedColor: Colors.red,
                animationDuration: Duration(
                  milliseconds: _changed.toInt() + 200
                ),
                onTap: (value) {
                  setState(() {
                    _checked2 = value!;
                    _checked1 = !value;
                  });
                }
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Animation duration'),
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 1,
            ),
            child: Slider(
              min: 0,
              max: 1800,
              value: _changed,
              onChanged: (value){
                setState(() {
                  _changed = value;
                });
              }
            ),
          ),
          Text('${_changed.toInt() + 200} ms'),
        ],
      )
    );
  }
}
