import 'package:patterns_codelab/data/export.dart';
import 'package:patterns_codelab/components/export_components.dart';

sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  final String text;
  HeaderBlock(this.text);
}

class ParagraphBlock extends Block {
  final String text;
  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block {
  final String text;
  final bool isChecked;
  CheckboxBlock(this.text, this.isChecked);
}

class BackgroundBlock extends StatefulWidget {
  final int numberOfDiscs;

  const BackgroundBlock(this.numberOfDiscs, {super.key});

  @override
  State<BackgroundBlock> createState() => _BackgroundBlockState();
}

class _BackgroundBlockState extends State<BackgroundBlock> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'Example interactiver background state',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
      GestureDetector(
        onTap: () => setState(() {
          _makeDiscs();
        }),
        child: Stack(
          children: [
            for (final disc in _discs)
              Positioned.fill(
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: disc.alignment,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: disc.color,
                      shape: BoxShape.circle,
                    ),
                    height: disc.size,
                    width: disc.size,
                  ),
                ),
              ),
          ],
        ),
      ),
    ]);
  }
}
