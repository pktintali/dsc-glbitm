import 'package:flutter/material.dart';
import 'package:dsc_glbajaj/NewTest/auth.dart';
import 'package:dsc_glbajaj/NewTest/auth_provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final auth = Auth();

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  String mytxt = '';

  Future<void> validateAndSubmit() async {
    setState(() {
      showIndicator = true;
    });
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          final String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          final String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print('Registered user: $userId');
        }

        widget.onSignedIn();
      } catch (e) {
        setState(() {
          showIndicator = false;
          mytxt = e.toString().substring(18, 44);
        });
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    mytxt = '';
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    mytxt = '';
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  bool showIndicator = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showIndicator,
      child: Scaffold(
        backgroundColor: Color(0xFFFF3E3F),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Image.asset('images/webdevelopment.png'),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(60))),
                      height: 470,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 22),
                                  child: Text(
                                    'Welcome!',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  bottom: 5,
                                ),
                                child: Text('Sign in to continue'),
                              ),
                            ],
                          ),
                          Column(
                            children: buildInputs() + buildSubmitButtons(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: TextFormField(
          key: Key('email'),
          onSaved: (String value) => _email = value,
          keyboardType: TextInputType.emailAddress,
          validator: EmailFieldValidator.validate,
          decoration: InputDecoration(
              hintText: 'E-Mail',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          mytxt,
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          obscureText: true,
          key: Key('password'),
          onSaved: (String value) => _password = value,
          validator: PasswordFieldValidator.validate,
          decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              )),
        ),
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(
                          auth:
                              auth)), // first auth is the key in ResetPasswordPage and second auth is value
                );
              },
              child: Text(
                'FORGOT PASSWORD?',
                style: TextStyle(
                  color: Color(0xFFFF3E3F),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FlatButton(
              key: Key('signIn'),
              onPressed: validateAndSubmit,
              color: Color(0xFFFF3E3F),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New User?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: moveToRegister,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFFFF3E3F),
                ),
              ),
            )
          ],
        ),
      ];
    } else {
      return <Widget>[
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FlatButton(
              onPressed: validateAndSubmit,
              color: Color(0xFFFF3E3F),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already Account?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: moveToLogin,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFFFF3E3F),
                ),
              ),
            )
          ],
        ),
      ];
    }
  }
}

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key, this.auth});
  final BaseAuth auth;
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _email = '';
  TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: _email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool k = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                child: k
                    ? TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            icon: Icon(
                              Icons.mail,
                              color: Colors.red,
                            )),
                        onChanged: (value) {
                          _email = value;
                        },
                        controller: _emailController,
                      )
                    : Center(
                        child: Text('Message Sent Successfully,'
                            '\n Check Your E-mail'),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: k
                    ? RaisedButton(
                        child: Text('Submit',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300)),
                        onPressed: () async {
                          try {
                            await widget.auth.sendPasswordResetEmail(_email);
                            setState(() {
                              k = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      )
                    : Text(''),
              )
            ],
          ),
        ));
  }
}
