import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/new_services.dart';
import '../widgets/lista_noticias.dart';

class Tab2Pages extends StatefulWidget {
  @override
  _Tab2PagesState createState() => _Tab2PagesState();
}

class _Tab2PagesState extends State<Tab2Pages>
    with AutomaticKeepAliveClientMixin {
  final List<String> options = ['Technology', 'Sports', 'Entertainment'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsServices>(context).headlines;
    final category = Provider.of<NewsServices>(context).category;
    final categoryChange = Provider.of<NewsServices>(context).changeCategory;

    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: category,
            hint: Text('Selecciona una opción'),
            items:
                options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              categoryChange(newValue);
              /*setState(() {
                selectedValue = newValue;
              });*/
            },
          ),
          Expanded(
            child:
                (headlines.length == 0)
                    ? Center(child: CircularProgressIndicator())
                    : ListaNoticias(headlines),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
