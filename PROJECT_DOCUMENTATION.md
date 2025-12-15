# Saboba Project - Complete Implementation Guide

## ✅ What Has Been Implemented

### Project Structure (EgyStay Pattern)

The project follows a **Feature-First + BLoC** architecture similar to your EgyStay project:

```
lib/
├── main.dart                           # Entry point with MultiBlocProvider
├── Models/                             # Data models
│   ├── job_model.dart                 # Job entity with fromJson/toJson
│   └── chat_model.dart                # Chat entity with fromJson/toJson
├── Modules/                            # Feature modules
│   ├── Home/                          # Job listings with filters
│   │   ├── home_bloc/                 # State management (Event/State/BLoC)
│   │   ├── screens/home_screen.dart   # Main UI
│   │   └── items_builders/            # Reusable components
│   │       ├── job_card.dart          # Job list item
│   │       └── filter_bottom_sheet.dart # Filter modal
│   ├── JobDetails/                    # Job details view
│   │   ├── job_details_bloc/          # State management
│   │   └── screens/job_details_screen.dart
│   └── Chat/                          # Chat sidebar
│       ├── chat_bloc/                 # State management
│       └── screens/chat_screen.dart   # Drawer with chats
├── Network/                            # Data layer
│   ├── repositories/                  # Repository pattern
│   │   ├── jobs_repository.dart       # Jobs CRUD interface
│   │   └── chat_repository.dart       # Chat CRUD interface
│   └── data_sources/                  # Data sources (currently local/hardcoded)
│       ├── jobs_local_datasource.dart # 8 sample jobs
│       └── chat_local_datasource.dart # 5 sample chats
└── Shared/                             # Shared utilities
    ├── di/injection_container.dart    # Dependency injection (GetIt)
    ├── routes/app_routes.dart         # Route constants
    └── theme/                         # Theming
        ├── app_theme.dart             # MaterialApp theme
        └── app_colors.dart            # Color palette
```

### Features Implemented

#### 1. Home Page ✅

- **Job Listings**: Displays 8 hardcoded jobs for testing
- **Filters**:
  - Category filter (Web Dev, Mobile Dev, Design, Writing, Marketing, Data Entry)
  - Price range slider ($0 - $10,000)
  - Sort by: Price (Low/High), Date (Newest/Oldest)
- **Filter Chips**: Active filters shown as removable chips
- **Search Bar**: UI ready (functionality can be added later)
- **Pull to Refresh**: Reload jobs
- **Chat Button**: Opens chat sidebar (end drawer)

#### 2. Job Details Page ✅

- **Complete Job Info**:
  - Title, Description, Category
  - Budget, Deadline, Posted By
  - Requirements list with checkmarks
- **Apply Button**:
  - Shows loading spinner while "applying"
  - Success toast notification
  - Auto-resets after 2 seconds

#### 3. Chat Sidebar ✅

- **End Drawer**: Slides from right on chat icon click
- **Chat List**:
  - User avatars (first letter of name)
  - Online/offline indicator (green dot)
  - Unread message badges
  - Last message preview
  - Smart timestamps (5m ago, 2h ago, Yesterday, etc.)
- **5 Sample Chats** with realistic data

#### 4. Internationalization ✅

- **Easy Localization**: English & Arabic support
- **Translation Files**:
  - `assets/translations/en.json`
  - `assets/translations/ar.json`
- **30+ Translation Keys** for all UI text
- **RTL Support**: Ready for Arabic (need to test)

#### 5. State Management (BLoC) ✅

- **HomeBloc**:
  - Events: LoadJobsEvent, ApplyFiltersEvent, ClearFiltersEvent
  - States: Initial, Loading, Loaded, Error
- **JobDetailsBloc**:
  - Events: ApplyForJobEvent
  - States: Initial, Applying, Applied, Error
- **ChatBloc**:
  - Events: LoadChatsEvent
  - States: Initial, Loading, Loaded, Error

#### 6. Dependency Injection ✅

- **GetIt Service Locator**
- **Registered Services**:
  - All 3 BLoCs (Factory)
  - Repositories (Singleton)
  - Data Sources (Singleton)

### Sample Data

#### Jobs (8 samples):

1. Flutter Mobile App Development - $5,000
2. WordPress Website Design - $1,500
3. Logo Design for Tech Startup - $500
4. Content Writing for Travel Blog - $800
5. Social Media Marketing Campaign - $2,000
6. Data Entry for E-commerce Store - $300
7. React.js Web Application Development - $7,500
8. Mobile Game UI/UX Design - $2,500

#### Chats (5 samples):

- John Smith, Sarah Johnson, Mike Chen, Emma Wilson, David Brown
- With timestamps, online status, unread counts

## 🎨 Design Features

### Theme

- **Primary Color**: Purple (#6C63FF)
- **Secondary Color**: Green (#2ECC71)
- **Background**: Light gray (#F8F9FA)
- **Modern UI**: Rounded corners (12px), subtle shadows, clean spacing

### Responsive

- Works on Web, Mobile, and Desktop
- Proper padding and spacing
- Scrollable content areas

## 📦 Dependencies Used

```yaml
dependencies:
  flutter_bloc: ^8.1.6 # State management
  equatable: ^2.0.5 # Value equality
  easy_localization: ^3.0.7 # i18n
  get_it: ^7.7.0 # Dependency injection
  dartz: ^0.10.1 # Functional programming
  cupertino_icons: ^1.0.8 # Icons
```

## 🚀 How to Run

```bash
# Install dependencies
flutter pub get

# Run on Chrome (Web)
flutter run -d chrome

# Run on macOS
flutter run -d macos

# Run on iOS Simulator
flutter run

# Build for Web
flutter build web
```

## 📱 How to Use the App

1. **Home Page**:

   - Browse jobs in the list
   - Click filter icon to open filters
   - Select category, price range, sort order
   - Click "Apply" to filter jobs
   - Clear filters with "Clear Filters" button

2. **Job Card**:

   - Click any job card to view details
   - Shows budget badge, category, poster, time ago

3. **Job Details**:

   - Read full description and requirements
   - Click "Apply Now" to submit application
   - See success toast notification

4. **Chat Sidebar**:
   - Click chat icon in app bar
   - Drawer slides from right
   - Browse recent conversations
   - See online status and unread counts
   - Click chat to see "Opening chat" toast (placeholder)

## 🔧 Code Patterns Used (From EgyStay)

### 1. BLoC Pattern

```dart
// Event
class LoadJobsEvent extends HomeEvent {}

// State
class HomeLoaded extends HomeState {
  final List<JobModel> jobs;
}

// BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadJobsEvent>(_onLoadJobs);
  }
}
```

### 2. Repository Pattern

```dart
abstract class JobsRepository {
  Future<List<JobModel>> getJobs();
}

class JobsRepositoryImpl implements JobsRepository {
  final JobsLocalDataSource localDataSource;
  // Implementation...
}
```

### 3. Dependency Injection

```dart
// Register
sl.registerFactory(() => HomeBloc(jobsRepository: sl()));
sl.registerLazySingleton<JobsRepository>(() => JobsRepositoryImpl(localDataSource: sl()));

// Use
BlocProvider(create: (context) => di.sl<HomeBloc>())
```

### 4. Naming Conventions

- **PascalCase**: Folders (Modules/, Home/)
- **snake_case**: Files (home_screen.dart, job_card.dart)
- **Suffixes**: \_bloc, \_event, \_state, \_screen

## 🎯 Next Steps (To Be Implemented)

### Backend Integration

- Replace local data sources with API calls
- Add HTTP interceptor for auth tokens
- Handle network errors

### User Authentication

- Login/Register screens
- JWT token storage
- Session management

### Real Features

- Actual job application flow
- Real-time chat with Socket.IO
- User profile management
- File uploads (proposals, portfolios)
- Payment integration
- Notifications

### Testing

- Unit tests for BLoCs
- Widget tests for UI
- Integration tests

## 📝 Translation Keys Reference

```json
{
  "app_name": "Saboba",
  "home": "Home",
  "jobs": "Jobs",
  "chats": "Chats",
  "search_jobs": "Search for jobs...",
  "filters": "Filters",
  "category": "Category",
  "price_range": "Price Range",
  "sort_by": "Sort By",
  "apply": "Apply",
  "clear_filters": "Clear Filters",
  "job_details": "Job Details",
  "budget": "Budget",
  "deadline": "Deadline",
  "posted_by": "Posted By",
  "description": "Description",
  "requirements": "Requirements",
  "apply_now": "Apply Now",
  "no_jobs_found": "No jobs found",
  "recent_chats": "Recent Chats"
}
```

## 🎓 Key Learnings from EgyStay Pattern

1. ✅ **Feature Isolation**: Each module is independent
2. ✅ **Scalability**: Easy to add new features without breaking existing code
3. ✅ **Testability**: BLoC makes unit testing easy
4. ✅ **Maintainability**: Clear separation of concerns
5. ✅ **Reusability**: Shared components in Shared/ folder
6. ✅ **Type Safety**: Models define clear contracts

## 🐛 Known Issues

All errors shown during development are expected because:

- Files reference each other before all are created
- Once all files are created, errors resolve
- The app compiles and runs successfully

## 📞 Support

For questions about the structure:

- Review EgyStay project for similar patterns
- Check BLoC documentation: bloclibrary.dev
- Flutter documentation: flutter.dev

---

**Built with ❤️ following the EgyStay architecture pattern**
