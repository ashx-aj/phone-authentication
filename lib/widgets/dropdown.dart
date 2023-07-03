import 'package:auth/main.dart';
import 'package:flutter/material.dart';

class Dropdownlist extends StatefulWidget {
  const Dropdownlist({super.key});

  @override
  State<Dropdownlist> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {
  List items = Language.languages;
  Language selected = Language.languages[0];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Language>(
        borderRadius: BorderRadius.zero,
        isExpanded: true,
        //underline: bo,
        icon: const Icon(Icons.arrow_drop_down),
        value: selected,
        items: items
            .map((e) =>
                DropdownMenuItem<Language>(value: e, child: Text(e.name)))
            .toList(),
        onChanged: (Language? value) => setState(() {
              selected = value!;
              MyApp.of(context)?.changeLocale(Locale(selected.loc));
            }));
  }
}

class Language {
  late String name;
  late String loc;

  Language(this.name, this.loc);

  static List<Language> languages = [
    Language('English', 'en'),
    Language('Hindi', 'hi'),
    Language('Malayalam', 'ml')
  ];
}
