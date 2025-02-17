
import 'package:rxdart/rxdart.dart';
import '../models/things.dart';

class Bloc {
  final Sink<TypeOfThing?> setTypeOfThing;
  final Stream<TypeOfThing?> currentTypeOfThings;
  final Stream<Iterable<Thing>> things;
  void dispose() {
    setTypeOfThing.close();
  }

  Bloc._(
      {required this.setTypeOfThing,
      required this.currentTypeOfThings,
      required this.things});

  factory Bloc({required Iterable<Thing> things}) {
    final typeOfSubject = BehaviorSubject<TypeOfThing?>();

    final filterthing = typeOfSubject
        .debounceTime(Duration(milliseconds: 300))
        .map<Iterable<Thing>>((type) {
      if (type != null) {
        return things.where((thing) => thing.type == type);
      } else {
        return things;
      }
    }).startWith(things);
    return Bloc._(
        setTypeOfThing: typeOfSubject.sink,
        currentTypeOfThings: typeOfSubject.stream,
        things: filterthing);
  }
}