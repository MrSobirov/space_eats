import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


final serviceLocator = GetIt.instance;
late Box<dynamic> hiveBox;

Future<void> init() async {
  await initHive();
  /*serviceLocator
    /// Core
    ..registerFactory(() => SplashBloc())
    ..registerFactory(() => HomeCubit())
    ..registerFactory(() => BookmarkCubit());*/
}

Future<void> initHive() async {
  const boxName = 'dictionary_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  hiveBox = await Hive.openBox<dynamic>(boxName);
}
