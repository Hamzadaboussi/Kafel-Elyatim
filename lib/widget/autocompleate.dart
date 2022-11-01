import 'package:flutter/material.dart';

String? ff1; // variable type
String? ff2; // variable niveaux
String? ff3;
String? ff4;

const List<String> _SOptions = <String>[
  '1ere années primaire',
  '2eme années primaire',
  '3eme années primaire',
  '4eme années primaire',
  '5eme années primaire',
  '6eme années primaire',
  '7eme années de base',
  '8eme années de base',
  '9eme années de base',
  '1ere années secondaire',
  '2eme années secondaire section scientifique',
  '2eme années secondaire section lettre',
  '2eme années secondaire section eco gestion',
  '2eme années secondaire section informatique',
  '3eme années secondaire section science',
  '3eme années secondaire section mathematique',
  '3eme années secondaire section technique',
  '3eme années secondaire section lettre',
  '3eme années secondaire section eco gestion',
  '3eme années secondaire section informatique',
  '4eme années secondaire section science',
  '4eme années secondaire section mathematique',
  '4eme années secondaire section technique',
  '4eme années secondaire section lettre',
  '4eme années secondaire section eco gestion',
  '4eme années secondaire section informatique',
];

class d2 extends StatelessWidget {
  const d2({Key? key}) : super(key: key);
  static const List<String> _kOptions = <String>[];
  static const List<String> _pOptions = <String>[
    '1-2 Primaire',
    '3-4 Primaire',
    '5-6 Primaire',
    '7-8-9 College',
    '1-2-3-4 Secondaire',
  ];
  static const List<String> _sOptions = <String>[
    '1-2-3 primaire',
    '4-5-6 primaire ',
    '7-8-9 College',
    '1-2-3-4 Secondaire',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff2 = selection;
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (ff1 == 'Livre') {
          return _SOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;
        if (ff1 == 'Fourniture') {
          return _pOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;

        if (ff1 == 'Sac') {
          return _sOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;

        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
}

class AutocompleteB extends StatelessWidget {
  const AutocompleteB({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'Livre',
    'Fourniture',
    'Sac ',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff1 = selection;
        ff2 = '';
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //Type

class AutocompleajoutStock extends StatelessWidget {
  const AutocompleajoutStock({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'Livre',
    'Fourniture',
    'Packet',
    'Sac a dos',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff1 = selection;
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //Type

class f2 extends StatelessWidget {
  const f2({Key? key}) : super(key: key);
  static const List<String> _kOptions = <String>[];
  static const List<String> _LOptions = <String>[
    '1ere années primaire',
    '2eme années primaire',
    '3eme années primaire',
    '4eme années primaire',
    '5eme années primaire',
    '6eme années primaire',
    '7eme années de base',
    '8eme années de base',
    '9eme années de base',
    '1ere années secondaire',
    '2eme années secondaire section scientifique',
    '2eme années secondaire section lettre',
    '2eme années secondaire section eco gestion',
    '2eme années secondaire section informatique',
    '3eme années secondaire section science',
    '3eme années secondaire section mathematique',
    '3eme années secondaire section technique',
    '3eme années secondaire section lettre',
    '3eme années secondaire section eco gestion',
    '3eme années secondaire section informatique',
    '4eme années secondaire section science',
    '4eme années secondaire section mathematique',
    '4eme années secondaire section technique',
    '4eme années secondaire section lettre',
    '4eme années secondaire section eco gestion',
    '4eme années secondaire section informatique',
  ];
  static const List<String> _fOptions = <String>[
    'primaire',
    'base',
    'secondaire',
  ];
  static const List<String> _pOptions = <String>[
    'Paquet 1-2 Primaire',
    'Paquet 3-4 Primaire',
    'Paquet 5-6 Primaire1',
    'Paquet 5-6 Primaire2',
  ];
  static const List<String> _sOptions = <String>[
    'primaire garcon',
    'primaire fille',
    'base garcon',
    'base fille',
    'secondaire garcon',
    'secondaire fille',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff2 = selection;
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (ff1 == 'Livre') {
          return _LOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;
        if (ff1 == 'Fourniture') {
          return _fOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;
        if (ff1 == 'Packet') {
          return _LOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;
        if (ff1 == 'Sac a dos') {
          return _sOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        ;

        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //niveau

class f3 extends StatelessWidget {
  const f3({Key? key}) : super(key: key);

  static const List<String> _LOptions = <String>[
    '1ere années primaire',
    '2eme années primaire',
    '3eme années primaire',
    '4eme années primaire',
    '5eme années primaire',
    '6eme années primaire',
    '7eme années de base',
    '8eme années de base',
    '9eme années de base',
    '1ere années secondaire',
    '2eme années secondaire ',
    '3eme années secondaire ',
    '4eme années secondaire ',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff2 = selection;
        if (ff2 == '1ere années primaire') {
          ff2 = ff2! + " Paquet 1-2 Primaire";
        }
        if (ff2 == '2eme années primaire') {
          ff2 = ff2! + " Paquet 1-2 Primaire";
        }
        if (ff2 == '3eme années primaire') {
          ff2 = ff2! + " Paquet 3-4 Primaire";
        }
        if (ff2 == '4eme années primaire') {
          ff2 = ff2! + " Paquet 3-4 Primaire";
        }
        if (ff2 == '5eme années primaire') {
          ff2 = ff2! + " Paquet 5-6 Primaire";
        }
        if (ff2 == '6eme années primaire') {
          ff2 = ff2! + " Paquet 5-6 Primaire";
        }
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _LOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //Type

class f4 extends StatelessWidget {
  const f4({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'Complet',
    'Non complet',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff3 = selection;
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //Type

class f5 extends StatelessWidget {
  const f5({Key? key}) : super(key: key);

  static const List<String> _LOptions = <String>[
    'Mathematique',
    'Lettre',
    'Economie gestion',
    'Science',
    'Informatique',
  ];

  static const List<String> _dOptions = <String>[
    'Lettre',
    'Economie gestion',
    'Science',
    'Informatique',
  ];
  static const List<String> _NOptions = <String>['Null'];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff4 = selection;
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (ff2 == '1ere années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '2eme années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '3eme années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '4eme années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '5eme années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '6eme années primaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '7eme années de base') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '8eme années de base') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '9eme années de base') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '1ere années secondaire') {
          return _NOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }
        if (ff2 == '2ere années secondaire') {
          return _dOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        }

        return _LOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
} //Type

class Autocompleteaddkid extends StatelessWidget {
  const Autocompleteaddkid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      onSelected: (String selection) {
        print('You just selected $selection');
        ff1 = selection;

        if (ff1 == '1ere années primaire' || ff1 == '2eme années primaire') {
          ff2 = "1-2 Primaire";
          ff3 = "1-2-3 primaire";
        } else if (ff1 == '3eme années primaire' ||
            ff1 == '4eme années primaire') {
          ff2 = "3-4 Primaire";
          if (ff1 == '3eme années primaire') {
            ff3 = "1-2-3 primaire";
          }
          if (ff1 == '4eme années primaire') {
            ff3 = "4-5-6 primaire";
          }
        } else if (ff1 == '5eme années primaire' ||
            ff1 == '6eme années primaire') {
          ff2 = "5-6 Primaire";
          ff3 = "4-5-6 primaire";
        } else if (ff1 == '7eme années de base' ||
            ff1 == '8eme années de base' ||
            ff1 == '9eme années de base') {
          ff2 = "7-8-9 College";
          ff3 = "7-8-9 College";
        } else {
          ff2 = "1-2-3-4 Secondaire";
          ff3 = "1-2-3 primaire";
        }
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _SOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
}//Type
