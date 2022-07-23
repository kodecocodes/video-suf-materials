import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:today/ui/utils.dart';


typedef VisibilityButtonPressed = void Function(bool);

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginDialogState();
}

class _LoginDialogState extends ConsumerState<Login> {
  late TextEditingController emailTextController;
  late TextEditingController repeatPasswordTextController;
  late TextEditingController passwordTextController;
  var rememberMe = true;
  var useLoginScreen = true;
  var hideFirstPassword = true;
  var hideSecondPassword = true;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController(text: '');
    repeatPasswordTextController = TextEditingController(text: '');
    passwordTextController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    emailTextController.dispose();
    repeatPasswordTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: createGradient(),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Container(
              decoration: createWhiteBorder(),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: useLoginScreen
                        ? createLoginScreen()
                        : createCreateAccountScreen()),
              ),
            // ),
          ),
        ),
      ),
    );
  }

  Widget createLoginScreen() {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 32.0),
          child: Text(
            'Login',
            style: titleBlackText,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 12.0),
          child: Text(
            'Email',
            style: largeBlackText,
          ),
        ),
        createEmailField(),
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 12.0),
          child: Text(
            'Password',
            style: largeBlackText,
          ),
        ),
        createPasswordField(passwordTextController, hideFirstPassword,
            toggleFirstPasswordVisibility),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              value: rememberMe,
              activeColor: Colors.blue,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(
                  () {
                    if (value != null) {
                      rememberMe = value;
                    }
                  },
                );
              },
            ),
            const Text(
              'Remember me',
              style: smallBlackText,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Forgot password?',
              style: smallBlueText,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 20.0),
                    elevation: 0,
                    primary: lightBlueColor,
                    onPrimary: Colors.white,
                    shape: createWhiteRoundedBorder(),
                  ),
                  onPressed: () async {
                    if (emailTextController.text.isNotEmpty &&
                        passwordTextController.text.isNotEmpty) {
                      // TODO Login
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not registered yet?',
              style: smallBlackText,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  useLoginScreen = false;
                });
              },
              child: const Text('Create an account', style: smallBlueText),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
      ),
    );
  }

  void toggleFirstPasswordVisibility(bool visible) {
    hideFirstPassword = visible;
  }

  void toggleSecondPasswordVisibility(bool visible) {
    hideSecondPassword = visible;
  }

  Widget createCreateAccountScreen() {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 10.0, bottom: 32.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      useLoginScreen = true;
                    });
                  },
                  icon: const Icon(Icons.chevron_left)),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  onPressed: () {
                    setState(() {
                      useLoginScreen = true;
                    });
                  },
                  child: const Text(
                    'Create an account',
                    style: titleBlackText,
                  )),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 12.0),
          child: Text(
            'Email',
            style: largeBlackText,
          ),
        ),
        createEmailField(),
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 12.0),
          child: Text(
            'Password',
            style: largeBlackText,
          ),
        ),
        createPasswordField(passwordTextController, hideFirstPassword,
            toggleFirstPasswordVisibility),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 0.0, top: 0.0, bottom: 12.0),
          child: Text(
            'Repeat Password',
            style: largeBlackText,
          ),
        ),
        createPasswordField(repeatPasswordTextController, hideSecondPassword,
            toggleSecondPasswordVisibility),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 10.0, bottom: 12.0, right: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 20.0),
                    elevation: 0,
                    primary: lightBlueColor,
                    onPrimary: Colors.white,
                    shape: createWhiteRoundedBorder(),
                  ),
                  onPressed: () async {
                    final email = emailTextController.text;
                    final password1 = passwordTextController.text;
                    final password2 = repeatPasswordTextController.text;
                    if (email.isEmpty) {
                      showSnackBar(context, 'Email cannot be empty');
                      return;
                    }
                    if (password1.isEmpty || password2.isEmpty) {
                      showSnackBar(context, 'Passwords cannot be empty');
                      return;
                    }
                    if (password1 != password2) {
                      showSnackBar(context, 'Passwords are not equal');
                      return;
                    }
                    // TODO Create User
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
      ),
    );
  }

  Widget createPasswordField(TextEditingController controller, bool showText,
      VisibilityButtonPressed buttonPressed) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: showText,
            enableSuggestions: false,
            autofocus: false,
            onSubmitted: (value) {},
            controller: controller,
            autocorrect: false,
            decoration: createTextBorder(
              'Min. 8 characters',
              IconButton(
                onPressed: () {
                  setState(() {
                    showText = !showText;
                    buttonPressed(showText);
                  });
                },
                icon: Icon(
                  (showText ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget createEmailField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: createTextBorder('bob@example.com', null),
            autofocus: false,
            onSubmitted: (value) {},
            controller: emailTextController,
          ),
        ),
      ],
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
