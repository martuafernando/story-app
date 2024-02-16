import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/auth/auth_provider.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';
import 'package:story_app/src/shared/widget/platform_widget.dart';

class RegisterView extends StatefulWidget {
  final Function goToLoginPage;

  const RegisterView({super.key, required this.goToLoginPage});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Widget _buildAndroid(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story App'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildIos(BuildContext contex) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Story App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext contex) {
    return Center(
      child: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 16.0,
              spreadRadius: 4.0,
              offset: Offset(0.0, 16.0),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment
                  .centerLeft, // or Alignment.topLeft, Alignment.bottomLeft, etc.
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Enter your username, email and password to continue',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 36.0),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: const BorderSide(width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: const BorderSide(width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: const BorderSide(width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 36.0),
                  SizedBox(
                    width: double.infinity,
                    child: context.watch<AuthProvider>().isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final user = RegisterRequest(
                                    name: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                                await context
                                    .read<AuthProvider>()
                                    .register(user);
                              }
                            },
                            child: const Text('Sign Up'),
                          ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Already have an account?',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(width: 4.0),
                      TextButton(
                        onPressed: () => widget.goToLoginPage(),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text('Sign In?',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.message!),
          ),
        );
        authProvider.clearMessage();
      });
    }

    return PlatformWidget(
      androidBuilder: (context) => _buildAndroid(context),
      iosBuilder: (context) => _buildIos(context),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
