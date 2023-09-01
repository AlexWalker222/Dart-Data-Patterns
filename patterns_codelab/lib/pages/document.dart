import 'package:patterns_codelab/data/export.dart';

class DocumentScreen extends StatefulWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    final (title, :modified) = widget.document.metadata;
    final formattedModifiedDate = formatDate(modified);
    final blocks = widget.document.getBlocks();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Column(
        children: [
          Center(child: Text('Last modified: $formattedModifiedDate')),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
