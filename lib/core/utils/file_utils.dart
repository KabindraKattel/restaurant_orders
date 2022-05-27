import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;

class FileUtils {
  static Future<String> getCacheDirPath() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    return directory.path;
  }
}
