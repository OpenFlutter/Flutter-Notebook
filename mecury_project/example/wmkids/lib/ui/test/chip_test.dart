import 'package:flutter/material.dart';

const List<String> _defaultMaterials = <String>[
  'poker',
  'tortilla',
  'fish and',
  'micro',
  'wood',
];

class ChipTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChipTestState();
}

class ChipTestState extends State<ChipTest> {
  final Set<String> _materials = Set<String>();
  String _selectedMaterial = '';

  ChipTestState() {
    _materials.clear();
    _materials.addAll(_defaultMaterials);
    _selectedMaterial = '';
  }

  Color _nameToColor(String name) {
    if (name.length > 1) {
      final int hash = name.hashCode & 0xffff;
      final double hue = (360.0 * hash / (1 << 15)) % 360.0;
      return new HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
    } else
      return Colors.black26;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chip test'),
      ),
      body: Center(
          child: _ChipsTile(
              label: 'Choose a Material (ChoiceChip)',
              children: _materials.map<Widget>((String name) {
                return ChoiceChip(
                  key: ValueKey<String>(name),
                  backgroundColor: _nameToColor(name),
                  label: Text(name),
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
              }).toList())),
    );
  }
}

//显示chip的集合
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
        child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: cardChildren,
    ));
  }
}
