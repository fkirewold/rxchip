import 'package:flutter/material.dart';
import 'package:rxfilterchip/models/thingprovider.dart';
import 'package:rxfilterchip/models/things.dart';
import 'package:rxfilterchip/screen/userdetail.dart';
import '../bloc/bloc.dart';

void main() {
  runApp(FilterChip());
}

class FilterChip extends StatefulWidget {
  const FilterChip({super.key});

  @override
  State<FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChip> {
  TypeOfThing? selectedThing;
  final Bloc bloc = Bloc(things: Provider.things);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Choice Chip',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Wrap(
                runSpacing: 4.0,
                spacing: 5,
                children: TypeOfThing.values.map((thing) {
                  return ChoiceChip(
                    showCheckmark: false,
                    label: Text(thing.name.toString()),
                    selected: selectedThing == thing,
                    selectedColor: Colors.orange.shade200,

                    onSelected: (bool selected) {
                      selected
                          ? bloc.setTypeOfThing.add(thing)
                          : bloc.setTypeOfThing.add(null);
                      setState(() {
                        selectedThing = selected ? thing : null;
                      });
                    },
                    avatar: thing == TypeOfThing.person
                        ? Container(
                            width: 24, // Set a fixed width
                            height: 24, // Set a fixed height
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(Icons.person,
                                size: 16, color: Colors.white),
                          )
                        : Container(
                            width: 24, // Set a fixed width
                            height: 24, // Set a fixed height
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child:
                                Icon(Icons.star, size: 16, color: Colors.white),
                          ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  );
                }).toList()),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: StreamBuilder(
                  stream: bloc.things,
                  builder: (BuildContext context,
                      AsyncSnapshot<Iterable<Thing>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final things = snapshot.data!.toList();

                      return ListView.builder(
                          itemCount: things.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListTile(
                                onTap: (){
                        Navigator.push(
                                    context,
                                     MaterialPageRoute(
                               builder: (context) => DetailPage(name:'Samrawit',perception:
                  '''Lorem ipsum dolor sit amet, 
                  consectetur adipiscing elit. Nullam auctor, justo ut 
                  suscipit fermentum, turpis ligula tincidunt nisi, id
                   viverra magna turpis eu risus. Integer id tincidunt quam. 
                   Proin et sapien nec erat sollicitudin tincidunt. Curabitur
                    vehicula, nunc ut hendrerit accumsan, turpis metus tincidunt
                     dolor, a pretium lorem libero in velit. Fusce non lectus et
                      nisl eleifend tincidunt. Suspendisse potenti. Vestibulum
                       non risus 
                  et felis scelerisque ultricies.'''),
                ));
                                },
                                leading: Icon(Icons.list),
                                title: Text(things[index].name),
                                subtitle: Text(things[index].type.name),
                              ),
                            );
                          });
                    }
                  })),
        ]),
      ),
    );
  }
}


