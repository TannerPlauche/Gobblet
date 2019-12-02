import 'package:flutter/material.dart';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:gobblet/store.dart';
import 'package:gobblet/widgets/game-view.widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gobblet Gobbler',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Gobblet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counter = Counter();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

//  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  void _signInUser() async {
    _handleSignIn()
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }

  _navigateToGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Center(
          child: Container(child: Text('Home Page!')),
        ),
        RaisedButton(
          child: Text('Go to game'),
          onPressed: _navigateToGame,
        ),
        Observer(builder: (_) => Text(_counter.value.toString())),
        RaisedButton(
          child: Text('Increment'),
          onPressed: () => _counter.increment(),
        ),
        RaisedButton(
          child: Text('Decrement'),
          onPressed: () => _counter.increment(),
        ),
        RaisedButton(
          child: Text('Log in with Google'),
          onPressed: _signInUser,
        )
      ]),
    );
  }
}
