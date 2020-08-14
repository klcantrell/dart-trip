import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Map<String, bool> currentSettings;
  final void Function(Map<String, bool>) save;

  SettingsScreen(this.currentSettings, this.save);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentSettings['gluten'];
    _lactoseFree = widget.currentSettings['lactose'];
    _vegan = widget.currentSettings['vegan'];
    _vegetarian = widget.currentSettings['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool value,
    @required void Function(bool) handleChange,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: handleChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.save({
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            }),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals',
                  value: _glutenFree,
                  handleChange: (newValue) {
                    setState(() => _glutenFree = newValue);
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  value: _vegetarian,
                  handleChange: (newValue) {
                    setState(() => _vegetarian = newValue);
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  value: _vegan,
                  handleChange: (newValue) {
                    setState(() => _vegan = newValue);
                  },
                ),
                buildSwitchListTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals',
                  value: _lactoseFree,
                  handleChange: (newValue) {
                    setState(() => _lactoseFree = newValue);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
