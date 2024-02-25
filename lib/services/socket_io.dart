import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIOService {
  late final IO.Socket socket;
  SocketIOService() {
    socket = IO.io('http://localhost:3000');
  }
}