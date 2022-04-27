import 'dart:io';

import 'package:tuple/tuple.dart';

abstract class ProfileInterface {

  Future<String> getImage({String token});

  Future<Tuple2<String, String>> uploadImage({String token, File file});


}