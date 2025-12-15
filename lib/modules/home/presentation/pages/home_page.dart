import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../chat/presentation/pages/chat_page.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..loadJobs(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('app_name'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const ChatPage(),
      body: Column(
        children: [
          _buildSearchBar(context),
          _buildFilterChips(context),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  if (state.jobs.isEmpty) {
                    return Center(
                      child: Text(
                        'no_jobs_found'.tr(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<HomeCubit>().loadJobs();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.jobs.length,
                      itemBuilder: (context, index) {
                        return JobCard(job: state.jobs[index]);
                      },
                    ),
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                          style: const TextStyle(color: AppColors.error),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HomeCubit>().loadJobs();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'search_jobs'.tr(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ),
        onChanged: (value) {
          // Implement search functionality if needed
        },
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) return const SizedBox();

        final hasFilters =
            state.selectedCategory != null ||
            state.minPrice != null ||
            state.maxPrice != null ||
            state.sortBy != null;

        if (!hasFilters) return const SizedBox();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.white,
          child: Wrap(
            spacing: 8,
            children: [
              if (state.selectedCategory != null)
                _buildChip(context, state.selectedCategory!, () {
                  context.read<HomeCubit>().applyFilters(
                    minPrice: state.minPrice,
                    maxPrice: state.maxPrice,
                    sortBy: state.sortBy,
                  );
                }),
              if (state.minPrice != null || state.maxPrice != null)
                _buildChip(
                  context,
                  '\$${state.minPrice ?? 0} - \$${state.maxPrice ?? 10000}',
                  () {
                    context.read<HomeCubit>().applyFilters(
                      category: state.selectedCategory,
                      sortBy: state.sortBy,
                    );
                  },
                ),
              if (state.sortBy != null)
                _buildChip(context, state.sortBy!, () {
                  context.read<HomeCubit>().applyFilters(
                    category: state.selectedCategory,
                    minPrice: state.minPrice,
                    maxPrice: state.maxPrice,
                  );
                }),
              TextButton(
                onPressed: () {
                  context.read<HomeCubit>().clearFilters();
                },
                child: Text('clear_filters'.tr()),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChip(BuildContext context, String label, VoidCallback onDelete) {
    return Chip(
      label: Text(label),
      onDeleted: onDelete,
      deleteIcon: const Icon(Icons.close, size: 18),
      backgroundColor: AppColors.primary.withOpacity(0.1),
      labelStyle: const TextStyle(color: AppColors.primary),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: const FilterBottomSheet(),
      ),
    );
  }
}
