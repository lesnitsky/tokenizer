import 'dart:async';

class Tokenizer {
  final Set<String> separators;
  late final StreamTransformer<String, String> transformer;
  final StringBuffer _sb = StringBuffer();
  final bool emitSeparators;

  Tokenizer(this.separators, {this.emitSeparators = true}) {
    transformer = StreamTransformer.fromHandlers(
      handleData: handleData,
      handleDone: handleDone,
      handleError: handleError,
    );
  }

  void handleData(String data, EventSink sink) {
    for (int i = 0; i < data.length; i++) {
      final char = data[i];

      if (separators.contains(char)) {
        if (_sb.isNotEmpty) {
          sink.add(_sb.toString());
          _sb.clear();
        }

        if (emitSeparators) {
          sink.add(char);
        }
      } else {
        _sb.write(char);
      }
    }
  }

  void handleDone(EventSink sink) {
    if (_sb.isNotEmpty) {
      sink.add(_sb.toString());
      _sb.clear();
    }
    sink.close();
  }

  void handleError(Object error, StackTrace stackTrace, EventSink sink) {
    sink.addError(error, stackTrace);
  }
}
