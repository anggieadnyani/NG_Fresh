import 'package:app_anggie/main.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  @override
  State<login_screen> createState() => _InstaLoginState();
}

class _InstaLoginState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _topWidget(),
              SizedBox(height: 24), // Tambahkan SizedBox untuk memberikan ruang di antara widget
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _centerWidget(),
              ),
              const SizedBox(height: 24), // Tambahkan SizedBox untuk memberikan ruang di antara widget
              const Divider(thickness: 2),
              const SizedBox(height: 12), // Tambahkan SizedBox untuk memberikan ruang di antara widget
              _bottomWidget(),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Tambahkan SizedBox untuk memberikan ruang di bawah untuk keyboard
            ],
          ),
        ),
      ),
    );
  }

  Widget _topWidget() {
    return DropdownButton(
      value: "English (United States)",
      items: const [
        DropdownMenuItem(
          child: Text("English (United States)"),
          value: "English (United States)",
        ),
      ],
      onChanged: (v) {},
    );
  }

  Widget _centerWidget() {
    return Column(
      children: [
        Image.asset(
          "assets/images/fresh_ng.png",
          height: 150,
        ),
        const SizedBox(height: 24),
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: Divider.createBorderSide(context),
            ),
            filled: true,
            suffixIcon: const Icon(Icons.remove_red_eye),
            contentPadding: const EdgeInsets.all(8),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'anggie'),
              ),
            ),
            child: const Text("Log in"),
          ),
        ),
        const SizedBox(height: 12), // Tambahkan SizedBox untuk memberikan ruang di antara widget
        SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
            child: const Text("Sign Up"),
          ),
        ),
        const SizedBox(height: 24), // Tambahkan SizedBox untuk memberikan ruang di antara widget
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Forgot your login details?"),
            Text(" Get help logging in",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 24), // Tambahkan SizedBox untuk memberikan ruang di antara widget
        const Divider(thickness: 2),
        const SizedBox(height: 24), // Tambahkan SizedBox untuk memberikan ruang di antara widget
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google.png", height: 32),
            const Text(" Log in with Google"),
          ],
        )
      ],
    );
  }

  Widget _bottomWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Don't have an account"),
        ],
      ),
    );
  }
}
