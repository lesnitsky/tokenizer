# tokenizer

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/tokenizer.svg?style=social)](https://github.com/lesnitsky/tokenizer)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Converts a stream of strings into stream of tokens splitted by delimiters

## Installation

```sh
dart pub add tokenizer
```

or

```sh
flutter pub add tokenizer
```

## Example

```dart
import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

void main(List<String> args) async {
  final string = 'Hello, world';
  final tokenizer = Tokenizer({',', ' '});
  final c = StreamController<String>();

  c.add(string);
  c.close();

  final tokens = await c.stream.transform(tokenizer.transformer).toList();
  print(tokens); // ["Hello", ",", " ", "world"]
}
```

## License

MIT
