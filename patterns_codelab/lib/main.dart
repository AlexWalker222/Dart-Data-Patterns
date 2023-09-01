import 'data/export.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatefulWidget {
  const DocumentApp({super.key});

  @override
  State<DocumentApp> createState() => _DocumentAppState();
}

class _DocumentAppState extends State<DocumentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}
