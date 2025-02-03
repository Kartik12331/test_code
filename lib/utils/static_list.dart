import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticList {
  static List<Data> value = [
    Data(
      name: "Parenting", selected: false,
    ),
    Data(
      name: "Business & Real Estate",
      selected: false,
    ),
    Data(
      name: "Fitness & Health",
      selected: false,
    ),
    Data(
      name: "Hotel Review",
      selected: false,
    ),
    Data(
      name: "Comedy",
      selected: false,
    ),
    Data(
      name: "Beauty & Cosmetics",
      selected: false,
    ),
    Data(
      name: "Fashion Apparel",
      selected: false,
    ),
    Data(
      name: "Chief",
      selected: false,
    ),
    Data(
      name: "Rantithesis Review",
      selected: false,
    ),
    Data(
      name: "UGC Creator",
      selected: false,
    ),
    Data(
      name: "Lusury Cars & Watches",
      selected: false,
    ),
    Data(
      name: "Lusury Cars & Watches",
      selected: false,
    ),
    Data(
      name: "Tech & Gadgets",
      selected: false,
    ),
  ];
}

class Data {
   String name;
    bool selected;

  Data({required this.name, required this.selected });
}


