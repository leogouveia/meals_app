import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterCategories extends StatefulWidget {
  const FilterCategories(
      {Key? key, required this.filters, required this.onChooseFilter})
      : super(key: key);

  final Map<Filter, bool> filters;
  final Function(Map<Filter, bool>) onChooseFilter;

  @override
  _FilterCategoriesState createState() => _FilterCategoriesState();
}

class _FilterCategoriesState extends State<FilterCategories> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.filters[Filter.glutenFree] ?? false;
    _lactoseFree = widget.filters[Filter.lactoseFree] ?? false;
    _vegetarian = widget.filters[Filter.vegetarian] ?? false;
    _vegan = widget.filters[Filter.vegan] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const SizedBox(height: 20, width: 10),
        SwitchListTile(
          visualDensity: VisualDensity.compact,
          value: _glutenFree,
          onChanged: (isSelected) {
            setState(() {
              _glutenFree = isSelected;
            });
          },
          title: Text(
            'Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include gluten-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          visualDensity: VisualDensity.compact,
          value: _lactoseFree,
          onChanged: (isSelected) {
            setState(() {
              _lactoseFree = isSelected;
            });
          },
          title: Text(
            'Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include lactose-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          visualDensity: VisualDensity.compact,
          value: _vegetarian,
          onChanged: (isSelected) {
            setState(() {
              _vegetarian = isSelected;
            });
          },
          title: Text(
            'Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include vegetarian meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          visualDensity: VisualDensity.compact,
          value: _vegan,
          onChanged: (isSelected) {
            setState(() {
              _vegan = isSelected;
            });
          },
          title: Text(
            'Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include vegan meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
              child: FilledButton.tonal(
                onPressed: () {
                  widget.onChooseFilter({
                    Filter.glutenFree: _glutenFree,
                    Filter.lactoseFree: _lactoseFree,
                    Filter.vegetarian: _vegetarian,
                    Filter.vegan: _vegan,
                  });
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ))
      ],
    );
  }
}
