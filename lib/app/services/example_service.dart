import 'package:flutter_getx_starter/app/data/models/example.dart';
import 'package:injectable/injectable.dart';

/*
* this is a service that share data pre App like State Management of Data
* between 2 pages or more or like Firebase Push Notificaiton,Firebase Remote Confige,Auth..etc
* */
@lazySingleton
class ExampleService {
  /*
  * this object can share same instance with multible pages
  * */
  List<Example> examples = [];

  ExampleService();
}
