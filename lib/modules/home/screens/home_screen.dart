import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Shared/theme/app_colors.dart';
import '../../../Shared/theme/theme_cubit.dart';
import '../../../Shared/routes/app_routes.dart';
import '../../../Shared/utils/responsive_helper.dart';
import '../../../Modules/Chat/screens/chat_screen.dart';
import '../../../Models/user_model.dart';
import '../home_bloc/home_bloc.dart';
import '../items_builders/job_card.dart';
import '../items_builders/filter_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const LoadJobsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context, isMobile),
      endDrawer: isMobile ? const ChatScreen() : null,
      body: Row(
        children: [
          // Main content
          Expanded(child: _buildMainContent(context)),
          // Chat sidebar for desktop
          if (isDesktop) const SizedBox(width: 380, child: ChatScreen()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isMobile) {
    return AppBar(
      toolbarHeight: 100,
      title: Row(
        children: [
          const SizedBox(width: 18),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Image.asset(
              'assets/icon/saboobaIcon.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          
        ],
      ),
      actions: [
        // Language switcher button
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.language),
          tooltip: 'Switch Language',
          onPressed: () {
            final currentLocale = context.locale;
            if (currentLocale.languageCode == 'en') {
              context.setLocale(const Locale('ar'));
            } else {
              context.setLocale(const Locale('en'));
            }
          },
        ),
        // Theme toggle button
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return IconButton(
              iconSize: 30,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: Icon(
                  themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  key: ValueKey(themeMode),
                  size: 30,
                ),
              ),
              tooltip: themeMode == ThemeMode.dark
                  ? 'Switch to Light Mode'
                  : 'Switch to Dark Mode',
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            );
          },
        ),
        // Profile avatar button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
                arguments: UserModel.mockUser,
              );
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text(
                  'KO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isMobile)
          IconButton(
            iconSize: 30,
            icon: Stack(
              children: [
                const Icon(Icons.chat_bubble_outline, size: 30),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxContentWidth(context),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            _buildFilterChips(context),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is HomeLoaded) {
                    if (state.jobs.isEmpty) {
                      return _buildEmptyState(context);
                    }
                    return _buildJobsList(context, state);
                  } else if (state is HomeError) {
                    return _buildErrorState(context, state.message);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final padding = ResponsiveHelper.getPagePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: padding.left,
        vertical: isMobile ? 16 : 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) ...[
            Text(
              'find_perfect_job'.tr(),
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'browse_opportunities'.tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
          ],
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    decoration: InputDecoration(
                      hintText: 'search_jobs'.tr(),
                      hintStyle: TextStyle(
                        color: AppColors.textHint.withOpacity(0.6),
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        size: 22,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear_rounded,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                                context.read<HomeBloc>().add(
                                  const SearchJobsEvent(''),
                                );
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                      context.read<HomeBloc>().add(SearchJobsEvent(value));
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      _showFilterBottomSheet(context);
                    },
                    child: const Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) return const SizedBox();

        final hasFilters =
            state.selectedCategory != null ||
            state.minPrice != null ||
            state.maxPrice != null ||
            state.sortBy != null;

        if (!hasFilters) return const SizedBox();

        final padding = ResponsiveHelper.getPagePadding(context);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: padding.left, vertical: 12),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (state.selectedCategory != null)
                  _buildChip(
                    context,
                    state.selectedCategory!.tr(),
                    Icons.category,
                    () {
                      context.read<HomeBloc>().add(
                        ApplyFiltersEvent(
                          minPrice: state.minPrice,
                          maxPrice: state.maxPrice,
                          sortBy: state.sortBy,
                        ),
                      );
                    },
                  ),
                if (state.minPrice != null || state.maxPrice != null)
                  _buildChip(
                    context,
                    '\$${state.minPrice ?? 0} - \$${state.maxPrice ?? 10000}',
                    Icons.attach_money,
                    () {
                      context.read<HomeBloc>().add(
                        ApplyFiltersEvent(
                          category: state.selectedCategory,
                          sortBy: state.sortBy,
                        ),
                      );
                    },
                  ),
                if (state.sortBy != null)
                  _buildChip(context, state.sortBy!.tr(), Icons.sort, () {
                    context.read<HomeBloc>().add(
                      ApplyFiltersEvent(
                        category: state.selectedCategory,
                        minPrice: state.minPrice,
                        maxPrice: state.maxPrice,
                      ),
                    );
                  }),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    context.read<HomeBloc>().add(ClearFiltersEvent());
                  },
                  icon: const Icon(Icons.close, size: 18),
                  label: Text('clear_filters'.tr()),
                  style: TextButton.styleFrom(foregroundColor: AppColors.error),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChip(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onDelete,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        avatar: Icon(icon, size: 16, color: AppColors.primary),
        label: Text(label),
        onDeleted: onDelete,
        deleteIcon: const Icon(Icons.close, size: 18),
        backgroundColor: AppColors.primaryLight.withOpacity(0.1),
        labelStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
        side: const BorderSide(color: AppColors.primaryLight, width: 1),
      ),
    );
  }

  Widget _buildJobsList(BuildContext context, HomeLoaded state) {
    final padding = ResponsiveHelper.getPagePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(const LoadJobsEvent());
      },
      color: AppColors.primary,
      child: isMobile
          ? ListView.separated(
              padding: EdgeInsets.all(padding.left),
              itemCount: state.jobs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return JobCard(job: state.jobs[index]);
              },
            )
          : GridView.builder(
              padding: EdgeInsets.all(padding.left),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: screenWidth > 1400
                    ? 350
                    : (screenWidth > 900 ? 400 : 500),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.65,
              ),
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: state.jobs[index]);
              },
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.work_off_outlined, size: 80, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            'no_jobs_found'.tr(),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your filters',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<HomeBloc>().add(ClearFiltersEvent());
            },
            icon: const Icon(Icons.refresh),
            label: Text('clear_filters'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: AppColors.error),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<HomeBloc>().add(const LoadJobsEvent());
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<HomeBloc>(),
        child: const FilterDialog(),
      ),
    );
  }
}
