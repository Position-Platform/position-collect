/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 09:01:41 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-09 09:01:41 
 */
import 'dart:io';

class NetworkInfoHelper {
  Future<bool> isConnected() async {
    bool? connect;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect!;
  }
}
