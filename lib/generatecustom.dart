import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';



class extra extends StatelessWidget {
  const extra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geno',
      theme: ThemeData(
        primarySwatch: Colors.amber,

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();


  double _sliderValue = 5;
  bool _switchValue = false;

  void _generatePassword() {
    _textEditingController.text = randomAlphaNumeric(_sliderValue.round());
    if (_switchValue) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Copied \☺',
        ),
        backgroundColor: Colors.black45.withOpacity(0.4),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar:  AppBar(
        title: Text('Create Tough Password'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.more_vert
                ),
              )
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 50,
            //   width: 320,
            //   child: AdWidget(ad: _topAdBanner),
            // ),
            Row(
              children: [
                Text("FaceBook",
                  style: TextStyle(color: Colors.white,
                      fontSize: 32, fontWeight: FontWeight.bold
                  ),),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Enter your name',
              ),
            ),
            Row(
              children: [
                Text("TOUGH    password:",
                  style: TextStyle(color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.bold
                  ),),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                style: const TextStyle(fontSize: 22),
                onTap: () {},
                controller: _textEditingController,
                maxLength: 30,
                autofocus: false, //true -  takes 10 fps
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: "TOUGH password:",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),

            // slider

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Slider(
                divisions: 25,
                min: 5,
                max: 30,
                label: "Password length: ${_sliderValue.round()}",
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                value: _sliderValue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MyElevatedButton(
                  text: 'Generate',
                  callback: () => _generatePassword(),
                ),
                const SizedBox(
                  height: 30,
                ),
                _MyElevatedButton(
                    text: 'Copy',
                    callback: () {
                      if (_textEditingController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Copied! 😜'),
                        ));
                        FlutterClipboard.copy('${_textEditingController.text}')
                            .then((value) =>
                            print('${_textEditingController.text}'));
                      }
                    }),
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              //  colors: [Colors.pink, Colors.red, Colors.orange],
                colors: [
                  Colors.amber,
                  Colors.blue,
                  Colors.brown,
                ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      ),
    );
  }
}

class _MyElevatedButton extends StatelessWidget {
  final VoidCallback callback;

  final String text;

  const _MyElevatedButton(
      {Key? key, required this.callback, required this.text})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
