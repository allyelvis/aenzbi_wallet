import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the dashboard or home screen
    } catch (e) {
      print(e);
      // Handle login error
    }
  }

  Future<void> _signup() async {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      print('Passwords do not match');
      return;
    }
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the dashboard or home screen
    } catch (e) {
      print(e);
      // Handle signup error
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      // Navigate to the dashboard or home screen
    } catch (e) {
      print(e);
      // Handle Google login error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              'Welcome to Aenzbi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Please login or create an account to continue.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            TabBar(
              controller: _tabController,
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.teal,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildLogin(),
                  buildSignup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogin() {
    return ListView(
      padding: EdgeInsets.only(top: 30),
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text('Forgot Password?'),
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: _login,
          child: Text('Login'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.teal,
          ),
        ),
        SizedBox(height: 20),
        Center(child: Text('Or login with')),
        SizedBox(height: 20),
        buildSocialButtons(),
      ],
    );
  }

  Widget buildSignup() {
    return ListView(
      padding: EdgeInsets.only(top: 30),
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        TextField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          obscureText: true,
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: _signup,
          child: Text('Signup'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.teal,
          ),
        ),
        SizedBox(height: 20),
        Center(child: Text('Or sign up with')),
        SizedBox(height: 20),
        buildSocialButtons(),
      ],
    );
  }

  Widget buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _loginWithGoogle,
          child: Image.asset('assets/google.png', height: 40),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/apple.png', height: 40),
        ),
      ],
    );
  }
}
