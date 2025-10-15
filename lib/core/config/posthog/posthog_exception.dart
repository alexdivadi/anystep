class PostHogException {
  /// Models PostHog's $exception exception object including richer fields.
  const PostHogException({
    required this.type,
    required this.value,
    this.mechanism,
    this.module,
    this.threadId,
    this.stacktrace,
  });

  final String type;
  final String value;
  final PostHogMechanism? mechanism; // now an object instead of simple string
  final String? module;
  final int? threadId;
  final PostHogStacktrace? stacktrace;

  /// Factory: builds from a Dart error + stack. Optional [mechanismType] for mapping to mechanism.type.
  factory PostHogException.fromError(Object error, StackTrace stack,
      {bool? handled, String? module}) {
    final errorType = error.runtimeType.toString();
    final value = error.toString();
    return PostHogException(
      type: errorType.isEmpty ? 'Error' : errorType,
      value: value,
      mechanism: (handled != null)
          ? PostHogMechanism(
              type: 'error',
              handled: handled,
              synthetic: false,
            )
          : null,
      module: module,
      stacktrace: PostHogStacktrace.fromStackTrace(stack),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        if (mechanism != null) 'mechanism': mechanism!.toJson(),
        if (module != null) 'module': module,
        if (threadId != null) 'thread_id': threadId,
        if (stacktrace != null) 'stacktrace': stacktrace!.toJson(),
      };
}

class PostHogMechanism {
  final String? type;
  final bool? handled;
  final bool? synthetic;
  const PostHogMechanism({this.type, this.handled, this.synthetic});

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (handled != null) 'handled': handled,
        if (synthetic != null) 'synthetic': synthetic,
      };
}

class PostHogStacktrace {
  final List<PostHogStackFrame> frames;
  final String? type; // e.g. "resolved"

  const PostHogStacktrace({required this.frames, this.type});

  factory PostHogStacktrace.fromStackTrace(StackTrace stack) {
    final lines = stack.toString().trim().split('\n');
    final frames = <PostHogStackFrame>[];
    final regex = RegExp(r'^#?\d+\s+(.+?) \((.+?):(\d+)(?::(\d+))?\)');
    for (final raw in lines) {
      final line = raw.trim();
      if (line.isEmpty) continue;
      final match = regex.firstMatch(line);
      if (match != null) {
        final fn = match.group(1);
        final file = match.group(2);
        final lineNo = int.tryParse(match.group(3) ?? '');
        final colNo = int.tryParse(match.group(4) ?? '');
        frames.add(PostHogStackFrame(
          rawId: "${stack.hashCode}", // or some other unique ID
          function: fn,
          filename: file,
          lineno: lineNo,
          colno: colNo,
          absPath: file,
          inApp: file != null && (file.startsWith('package:') || file.startsWith('dart:'))
              ? true
              : null,
          resolved: true,
          lang: 'dart',
          resolvedName: fn,
          mangledName: fn,
        ));
      } else {
        frames.add(PostHogStackFrame(
          rawId: "${stack.hashCode}",
          function: line,
          resolved: true,
          lang: 'dart',
          mangledName: line,
        ));
      }
    }
    final ordered = frames.reversed.toList();
    return PostHogStacktrace(frames: ordered, type: 'resolved');
  }

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        'frames': frames.map((f) => f.toJson()).toList(),
      };
}

class PostHogStackFrame {
  final String? function;
  final String? filename;
  final int? lineno;
  final int? colno;
  final String? absPath;
  final bool? inApp;
  final String? module;
  final String? contextLine;
  final List<String>? preContext;
  final List<String>? postContext;
  // Extended fields inspired by provided example schema:
  final String rawId; // hash / unique identifier for frame (optional)
  final String? mangledName; // for languages with symbol mangling; we reuse function name
  final String? resolvedName; // demangled / resolved symbol name
  final String? lang; // 'dart'
  final bool? resolved; // whether symbol resolution occurred

  const PostHogStackFrame({
    this.function,
    this.filename,
    this.lineno,
    this.colno,
    this.absPath,
    this.inApp,
    this.module,
    this.contextLine,
    this.preContext,
    this.postContext,
    required this.rawId,
    this.mangledName,
    this.resolvedName,
    this.lang,
    this.resolved,
  });

  Map<String, dynamic> toJson() => {
        'raw_id': rawId,
        if (mangledName != null) 'mangled_name': mangledName,
        if (resolvedName != null) 'resolved_name': resolvedName,
        if (lang != null) 'lang': lang,
        if (resolved != null) 'resolved': resolved,
        if (function != null) 'function': function,
        if (filename != null) 'filename': filename,
        if (lineno != null) 'lineno': lineno,
        if (colno != null) 'colno': colno,
        if (absPath != null) 'abs_path': absPath,
        if (inApp != null) 'in_app': inApp,
        if (module != null) 'module': module,
        if (contextLine != null) 'context_line': contextLine,
        if (preContext != null) 'pre_context': preContext,
        if (postContext != null) 'post_context': postContext,
      };
}
