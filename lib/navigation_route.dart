import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_flutter/widgets/custom_scaffold.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation & routing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreen');
                },
                child: const Text('Go to Second Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondScreenWithData',
                      arguments: 'Hello from First Screen');
                },
                child: const Text('Navigation With Data')),
            ElevatedButton(
                onPressed: () async {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  final result =
                      await Navigator.pushNamed(context, '/returnDataScreen');
                  SnackBar snackBar = SnackBar(content: Text('$result'));
                  scaffoldMessenger.showSnackBar(snackBar);
                },
                child: const Text('Return Data from Another Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/replacementScreen');
                },
                child: const Text('Replace Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/designUi');
                },
                child: Text('Design Ui')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/kalkulator');
                },
                child: Text('Kalkulator')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/newsapp');
                },
                child: Text('News App')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/animasi');
                },
                child: Text('Animation')),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class SecondScreenWithData extends StatelessWidget {
  final String data;
  const SecondScreenWithData(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}

class ReturnDataScreen extends StatefulWidget {
  const ReturnDataScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReturnDataScreenState();
}

class _ReturnDataScreenState extends State<ReturnDataScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/anotherScreen');
          },
          child: const Text('Open Another Screen'),
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Back to First Screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}
