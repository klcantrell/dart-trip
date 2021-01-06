import 'package:flutter/material.dart';
import 'package:places/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/places_provider.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<PlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, data) => data.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<PlacesProvider>(
                  child: Center(
                      child: Text('Got no places yet, start adding some!')),
                  builder: (ctx, placesProvider, child) =>
                      placesProvider.items.length <= 0
                          ? child
                          : ListView.builder(
                              itemCount: placesProvider.items.length,
                              itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(placesProvider.items[i].image),
                                ),
                                title: Text(placesProvider.items[i].title),
                                subtitle: Text(
                                    placesProvider.items[i].location.address),
                                onTap: () => Navigator.of(context).pushNamed(
                                  PlaceDetailScreen.routeName,
                                  arguments: placesProvider.items[i].id,
                                ),
                              ),
                            ),
                ),
        ),
      ),
    );
  }
}
