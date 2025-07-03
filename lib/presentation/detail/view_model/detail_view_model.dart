import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(scope: 'detail')
class DetailViewModel extends ChangeNotifier {}
