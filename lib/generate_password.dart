
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled20/custom.dart';

import 'generatecustom.dart';

class GeneratePassword extends StatefulWidget {
  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Create Simple Password'),
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
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Create Simple Password",
                    style: TextStyle(color: Colors.white,
                        fontSize: 32, fontWeight: FontWeight.bold
                    ),),
                ],
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          final data = ClipboardData(text: _controller.text);
                          Clipboard.setData(data);

                          final snackbar = SnackBar(
                              content: Text("Password Copy"));

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(snackbar);
                        },
                        icon: Icon(Icons.copy,color: Colors.white))
                ),
              ),
              SizedBox(height: 15,),
              buildButtonWidget(),
              buildButtonWidget1(),
            ],
          ),

        ),
      );
  // <-- SEE HERE
  Widget buildButtonWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        onPrimary: Colors.black,
        side: BorderSide(color: Colors.white, width: 5),
      ),
      onPressed: () {
        final password = generatePassword();
        _controller.text = password;
      },
      child: const Text(
        'SIMPLE PASSWORD',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
  Widget buildButtonWidget1() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        onPrimary: Colors.black,
        side: BorderSide(color: Colors.white, width: 5),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => extra()),
        );


      },

      child: const Text(
        'TOUGH  PASSWORD',
        style: TextStyle(fontSize: 40),
      ),
    );


  }

}