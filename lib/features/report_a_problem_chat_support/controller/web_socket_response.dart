import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'reverb_options.dart';

class WebsocketResponse {
  final String event;
  final String? channel;
  final Map<String, dynamic>? data;

  WebsocketResponse({required this.event, this.channel, this.data});

  factory WebsocketResponse.fromJson(Map<String, dynamic> json) {
    String event = json['event'] ?? '';
    String? channel = json['channel'];
    Map<String, dynamic>? parsedData;

    try {
      final rawData = json['data'];
      if (rawData is String && rawData.isNotEmpty) {
        parsedData = jsonDecode(rawData);
      } else if (rawData is Map) {
        parsedData = Map<String, dynamic>.from(rawData);
      }
    } catch (e) {
      print('❌ Failed to parse WebSocket data: $e');
    }

    return WebsocketResponse(event: event, channel: channel, data: parsedData);
  }
}

class SimpleFlutterReverb {
  late final WebSocketChannel _channel;
  final ReverbOptions options;
  final Logger _logger = Logger();

  SimpleFlutterReverb({required this.options}) {
    final wsUrl = _constructWebSocketUrl();
    _logger.i('🔌 Connecting to: $wsUrl');
    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
  }

  String _constructWebSocketUrl() {
    final portPart = (options.port == 443 || options.port == 80)
        ? ''
        : ':${options.port}';
    return '${options.scheme}://${options.host}$portPart/app/${options.appKey}';
  }

  void listen(void Function(WebsocketResponse) onData, String channelName) {
    _logger.i('👂 Listening to channel: $channelName (public)');

    // ✅ لا تنتظر "pusher:connection_established" — اشترك مباشرة بعد فتح الاتصال
    _channel.stream.listen(
      (message) async {
        _logger.i('📥 Raw socket message: $message');
        try {
          final Map<String, dynamic> jsonMessage = jsonDecode(message);
          final response = WebsocketResponse.fromJson(jsonMessage);

          // استمع لأي رسائل قادمة
          if (response.event.contains('message')) {
            onData(response);
          } else if (response.event == 'pusher:ping' ||
              response.event == 'reverb:ping') {
            _logger.i('📶 Ping received — sending pong');
            _channel.sink.add(jsonEncode({'event': 'pusher:pong'}));
          } else {
            _logger.i('ℹ️ Other event: ${response.event}');
          }
        } catch (e, s) {
          _logger.e('❌ Error processing socket message: $e');
          _logger.w('🔍 Stack trace: $s');
        }
      },
      onError: (error) => _logger.e('❌ WebSocket error: $error'),
      onDone: () => _logger.i('🔚 WebSocket connection closed'),
    );

    // ✅ اشترك مباشرة بعد الاتصال
    _subscribe(channelName);
  }

  void _subscribe(String channelName) {
    final subscription = {
      "event": "pusher:subscribe",
      "data": {"channel": channelName},
    };
    _logger.i('📡 Sending subscription to channel: $channelName');
    _channel.sink.add(jsonEncode(subscription));
  }

  void close() {
    _logger.i('🔒 Closing WebSocket...');
    _channel.sink.close(status.normalClosure); // هذا الكود = 1000
  }
}
