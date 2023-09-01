import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:patterns_codelab/data/export.dart';

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    super.key,
  });
  
  Map get init => set;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: switch (block) {
        HeaderBlock(:final text) => Text(
            text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ParagraphBlock(:final text) => Text(text),
        CheckboxBlock(:final text, :final isChecked) => Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (onEvent) => { 
                if (BackgroundFetchClickEvent(type, init) == 1) {
                return isChecked; 
                } else if (click == 2) { 
                  return false; 
                }
              }
                key: key,
              ),
              Text(text),
            ],
          ),
      },
    );
  }
}
