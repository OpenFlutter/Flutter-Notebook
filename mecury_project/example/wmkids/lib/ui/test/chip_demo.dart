import 'package:flutter/material.dart';

const List<String> _defaultMaterials = <String>[
  'poker',
  'tortilla',
  'fish and',
  'micro',
  'wood',
];

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);

  final String label;
  final List<Widget> children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      new Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
        alignment: Alignment.center,
        child: new Text(label, textAlign: TextAlign.start),
      ),
    ];
    if (children.isNotEmpty) {
      cardChildren.add(new Wrap(
          children: children.map((Widget chip) {
        return new Padding(
          padding: const EdgeInsets.all(2.0),
          child: chip,
        );
      }).toList()));
    } else {
      final TextStyle textStyle = Theme
          .of(context)
          .textTheme
          .caption
          .copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(new Semantics(
        container: true,
        child: new Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
          padding: const EdgeInsets.all(8.0),
          child: new Text('None', style: textStyle),
        ),
      ));
    }

    return new Card(
//        semanticContainer: false,
        child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: cardChildren,
    ));
  }
}

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => new _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  _ChipDemoState() {
    _reset();
  }

  final Set<String> _materials = new Set<String>();
  String _selectedMaterial = '';

  // Initialize members with the default data.
  void _reset() {
    _materials.clear();
    _materials.addAll(_defaultMaterials);
    _selectedMaterial = '';
  }

  //处理chip title
  String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  //根据传入String生成颜色
  Color _nameToColor(String name) {
    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return new HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final List<Widget> choiceChips = _materials.map<Widget>((String name) {
      return new ChoiceChip(
        key: new ValueKey<String>(name),
        backgroundColor: _nameToColor(name),
        label: new Text(_capitalize(name)),
        selected: _selectedMaterial == name,
        onSelected: (bool value) {
          setState(() {
            _selectedMaterial = value ? name : '';
          });
          print("value:$value");
          print("name:$name");
          print("_selectedMaterial:$_selectedMaterial");
        },
      );
    }).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Chips'),
      ),
      body: new ChipTheme(
        data: theme.chipTheme,
        child: new _ChipsTile(
            label: 'Choose a Material (ChoiceChip)', children: choiceChips),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => setState(_reset),
        child: const Icon(Icons.refresh, semanticLabel: 'Reset chips'),
      ),
    );
  }
}
