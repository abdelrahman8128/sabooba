import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedCategory;
  double minPrice = 0;
  double maxPrice = 10000;
  String? selectedSortBy;

  final List<String> categories = [
    'All Categories',
    'Web Development',
    'Mobile Development',
    'Graphic Design',
    'Writing & Content',
    'Marketing',
    'Data Entry',
  ];

  final List<String> sortOptions = [
    'Price: Low to High',
    'Price: High to Low',
    'Newest First',
    'Oldest First',
  ];

  @override
  void initState() {
    super.initState();
    final state = context.read<HomeCubit>().state;
    if (state is HomeLoaded) {
      selectedCategory = state.selectedCategory;
      minPrice = state.minPrice ?? 0;
      maxPrice = state.maxPrice ?? 10000;
      selectedSortBy = state.sortBy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'filters'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'category'.tr(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories.map((category) {
              final isSelected = selectedCategory == category;
              return ChoiceChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    selectedCategory = selected ? category : null;
                  });
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            'price_range'.tr(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('\$${minPrice.toInt()}'),
              Expanded(
                child: RangeSlider(
                  values: RangeValues(minPrice, maxPrice),
                  min: 0,
                  max: 10000,
                  divisions: 100,
                  labels: RangeLabels(
                    '\$${minPrice.toInt()}',
                    '\$${maxPrice.toInt()}',
                  ),
                  onChanged: (values) {
                    setState(() {
                      minPrice = values.start;
                      maxPrice = values.end;
                    });
                  },
                ),
              ),
              Text('\$${maxPrice.toInt()}'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'sort_by'.tr(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: sortOptions.map((option) {
              final isSelected = selectedSortBy == option;
              return ChoiceChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    selectedSortBy = selected ? option : null;
                  });
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.read<HomeCubit>().clearFilters();
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('clear_filters'.tr()),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().applyFilters(
                      category: selectedCategory,
                      minPrice: minPrice,
                      maxPrice: maxPrice,
                      sortBy: selectedSortBy,
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('apply'.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
