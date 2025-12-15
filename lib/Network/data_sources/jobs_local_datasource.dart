import '../../Models/job_model.dart';
import '../repositories/jobs_repository.dart';

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  @override
  Future<List<JobModel>> getJobs() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Hardcoded 50 jobs data with variety
    final now = DateTime.now();
    return [
      // Web Development Jobs (10)
      JobModel(
        id: '1',
        title: 'Full Stack Developer for SaaS Platform',
        description:
            'Build a complete SaaS platform with React frontend and Node.js backend. Need experience with AWS, MongoDB, and microservices architecture.',
        category: 'Web Development',
        budget: 8500.0,
        postedBy: 'Tech Innovations Inc',
        deadline: now.add(const Duration(days: 45)),
        postedDate: now.subtract(const Duration(hours: 2)),
        requirements: [
          'React & Node.js',
          'AWS expertise',
          'MongoDB',
          'Microservices',
        ],
      ),
      JobModel(
        id: '2',
        title: 'WordPress Website for Restaurant',
        description:
            'Create a beautiful WordPress site with online ordering, menu management, and reservation system.',
        category: 'Web Development',
        budget: 1800.0,
        postedBy: 'Bella Cucina',
        deadline: now.add(const Duration(days: 15)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: ['WordPress', 'WooCommerce', 'Responsive Design', 'SEO'],
      ),
      JobModel(
        id: '3',
        title: 'E-commerce Website with Shopify',
        description:
            'Set up a professional Shopify store for fashion brand with custom theme and payment integration.',
        category: 'Web Development',
        budget: 2200.0,
        postedBy: 'Urban Fashion Co',
        deadline: now.add(const Duration(days: 20)),
        postedDate: now.subtract(const Duration(hours: 5)),
        requirements: [
          'Shopify Expert',
          'Custom Themes',
          'Payment Gateways',
          'SEO',
        ],
      ),
      JobModel(
        id: '4',
        title: 'Landing Page for Marketing Campaign',
        description:
            'Design and develop a high-converting landing page with animations and form integration.',
        category: 'Web Development',
        budget: 950.0,
        postedBy: 'Growth Marketing Agency',
        deadline: now.add(const Duration(days: 7)),
        postedDate: now.subtract(const Duration(hours: 18)),
        requirements: [
          'HTML/CSS/JS',
          'Animation',
          'Form Integration',
          'Mobile First',
        ],
      ),
      JobModel(
        id: '5',
        title: 'Django Web Application Development',
        description:
            'Build a custom CRM system using Django and PostgreSQL with user authentication and reporting.',
        category: 'Web Development',
        budget: 6500.0,
        postedBy: 'Enterprise Solutions Ltd',
        deadline: now.add(const Duration(days: 60)),
        postedDate: now.subtract(const Duration(days: 3)),
        requirements: [
          'Django',
          'PostgreSQL',
          'RESTful APIs',
          'Authentication',
        ],
      ),
      JobModel(
        id: '6',
        title: 'React Dashboard for Analytics',
        description:
            'Create an interactive dashboard with charts, graphs, and real-time data visualization.',
        category: 'Web Development',
        budget: 4200.0,
        postedBy: 'DataViz Pro',
        deadline: now.add(const Duration(days: 30)),
        postedDate: now.subtract(const Duration(hours: 8)),
        requirements: ['React', 'D3.js', 'Chart Libraries', 'API Integration'],
      ),
      JobModel(
        id: '7',
        title: 'Portfolio Website for Photographer',
        description:
            'Design a stunning portfolio website with image galleries and contact form.',
        category: 'Web Development',
        budget: 1200.0,
        postedBy: 'Alex Photography',
        deadline: now.add(const Duration(days: 14)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: [
          'Modern Design',
          'Image Optimization',
          'Mobile Responsive',
          'Fast Loading',
        ],
      ),
      JobModel(
        id: '8',
        title: 'Angular Enterprise Application',
        description:
            'Develop a complex enterprise application using Angular with role-based access control.',
        category: 'Web Development',
        budget: 9500.0,
        postedBy: 'Global Corp',
        deadline: now.add(const Duration(days: 90)),
        postedDate: now.subtract(const Duration(days: 4)),
        requirements: [
          'Angular',
          'TypeScript',
          'RBAC',
          'Enterprise Experience',
        ],
      ),
      JobModel(
        id: '9',
        title: 'Vue.js Single Page Application',
        description:
            'Build a modern SPA for project management with Vuex state management.',
        category: 'Web Development',
        budget: 3800.0,
        postedBy: 'Startup Hub',
        deadline: now.add(const Duration(days: 35)),
        postedDate: now.subtract(const Duration(hours: 12)),
        requirements: ['Vue.js', 'Vuex', 'RESTful APIs', 'Modern UI'],
      ),
      JobModel(
        id: '10',
        title: 'Next.js Blog Platform',
        description:
            'Create a blog platform with SSR, SEO optimization, and content management.',
        category: 'Web Development',
        budget: 3200.0,
        postedBy: 'Content Creators Network',
        deadline: now.add(const Duration(days: 25)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: ['Next.js', 'SSR/SSG', 'SEO', 'CMS Integration'],
      ),

      // Mobile Development Jobs (10)
      JobModel(
        id: '11',
        title: 'Flutter Fitness Tracking App',
        description:
            'Build a comprehensive fitness app with workout tracking, meal planning, and progress analytics.',
        category: 'Mobile Development',
        budget: 7200.0,
        postedBy: 'FitLife Technologies',
        deadline: now.add(const Duration(days: 50)),
        postedDate: now.subtract(const Duration(hours: 3)),
        requirements: ['Flutter', 'Firebase', 'Health APIs', 'Charts'],
      ),
      JobModel(
        id: '12',
        title: 'React Native Social Media App',
        description:
            'Create a social networking app with posts, comments, likes, and real-time chat.',
        category: 'Mobile Development',
        budget: 9800.0,
        postedBy: 'Social Connect Inc',
        deadline: now.add(const Duration(days: 70)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: [
          'React Native',
          'Real-time Chat',
          'Push Notifications',
          'Social Features',
        ],
      ),
      JobModel(
        id: '13',
        title: 'iOS Food Delivery App',
        description:
            'Develop a native iOS app for food delivery with map integration and payment gateway.',
        category: 'Mobile Development',
        budget: 8500.0,
        postedBy: 'QuickEats',
        deadline: now.add(const Duration(days: 55)),
        postedDate: now.subtract(const Duration(hours: 6)),
        requirements: [
          'Swift',
          'MapKit',
          'Payment Integration',
          'Push Notifications',
        ],
      ),
      JobModel(
        id: '14',
        title: 'Android E-learning Platform',
        description:
            'Build an educational app with video streaming, quizzes, and progress tracking.',
        category: 'Mobile Development',
        budget: 6800.0,
        postedBy: 'EduTech Solutions',
        deadline: now.add(const Duration(days: 60)),
        postedDate: now.subtract(const Duration(days: 3)),
        requirements: [
          'Kotlin',
          'Video Streaming',
          'Offline Mode',
          'Analytics',
        ],
      ),
      JobModel(
        id: '15',
        title: 'Flutter E-commerce Shopping App',
        description:
            'Create a feature-rich shopping app with product catalogs, cart, and secure checkout.',
        category: 'Mobile Development',
        budget: 5500.0,
        postedBy: 'ShopSmart',
        deadline: now.add(const Duration(days: 40)),
        postedDate: now.subtract(const Duration(hours: 15)),
        requirements: [
          'Flutter',
          'Payment Gateways',
          'Push Notifications',
          'Firebase',
        ],
      ),
      JobModel(
        id: '16',
        title: 'React Native Weather Application',
        description:
            'Develop a beautiful weather app with forecasts, maps, and location services.',
        category: 'Mobile Development',
        budget: 2800.0,
        postedBy: 'WeatherNow',
        deadline: now.add(const Duration(days: 20)),
        postedDate: now.subtract(const Duration(hours: 10)),
        requirements: ['React Native', 'Weather APIs', 'Maps', 'Animations'],
      ),
      JobModel(
        id: '17',
        title: 'iOS Banking App',
        description:
            'Build a secure banking application with biometric authentication and transaction history.',
        category: 'Mobile Development',
        budget: 12000.0,
        postedBy: 'SecureBank',
        deadline: now.add(const Duration(days: 90)),
        postedDate: now.subtract(const Duration(days: 5)),
        requirements: ['Swift', 'Security', 'Biometric Auth', 'Banking APIs'],
      ),
      JobModel(
        id: '18',
        title: 'Flutter Music Streaming App',
        description:
            'Create a music streaming platform with playlists, offline mode, and social features.',
        category: 'Mobile Development',
        budget: 8900.0,
        postedBy: 'MusicStream Pro',
        deadline: now.add(const Duration(days: 65)),
        postedDate: now.subtract(const Duration(hours: 24)),
        requirements: [
          'Flutter',
          'Audio Streaming',
          'Offline Storage',
          'Social Features',
        ],
      ),
      JobModel(
        id: '19',
        title: 'Android Task Management App',
        description:
            'Develop a productivity app with tasks, reminders, and team collaboration features.',
        category: 'Mobile Development',
        budget: 4200.0,
        postedBy: 'ProductivityHub',
        deadline: now.add(const Duration(days: 35)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: ['Kotlin', 'Local Storage', 'Notifications', 'Sync'],
      ),
      JobModel(
        id: '20',
        title: 'React Native Travel Booking App',
        description:
            'Build a travel booking platform with flight search, hotel bookings, and itinerary management.',
        category: 'Mobile Development',
        budget: 7500.0,
        postedBy: 'TravelEasy',
        deadline: now.add(const Duration(days: 55)),
        postedDate: now.subtract(const Duration(hours: 8)),
        requirements: [
          'React Native',
          'Booking APIs',
          'Payment Integration',
          'Maps',
        ],
      ),

      // Graphic Design Jobs (10)
      JobModel(
        id: '21',
        title: 'Brand Identity Design Package',
        description:
            'Create complete brand identity including logo, color palette, typography, and brand guidelines.',
        category: 'Graphic Design',
        budget: 1800.0,
        postedBy: 'Startup Ventures',
        deadline: now.add(const Duration(days: 21)),
        postedDate: now.subtract(const Duration(hours: 4)),
        requirements: [
          'Brand Design',
          'Logo Design',
          'Style Guide',
          'Print Ready',
        ],
      ),
      JobModel(
        id: '22',
        title: 'Social Media Graphics Pack',
        description:
            'Design 50 social media posts for Instagram, Facebook, and LinkedIn.',
        category: 'Graphic Design',
        budget: 850.0,
        postedBy: 'Digital Marketing Pro',
        deadline: now.add(const Duration(days: 14)),
        postedDate: now.subtract(const Duration(hours: 12)),
        requirements: [
          'Social Media Design',
          'Brand Consistency',
          'Templates',
          'Multiple Formats',
        ],
      ),
      JobModel(
        id: '23',
        title: 'UI/UX Design for Mobile App',
        description:
            'Design complete user interface and experience for a health and wellness mobile application.',
        category: 'Graphic Design',
        budget: 3500.0,
        postedBy: 'HealthTech Inc',
        deadline: now.add(const Duration(days: 30)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: ['UI/UX', 'Figma/Sketch', 'Prototyping', 'User Research'],
      ),
      JobModel(
        id: '24',
        title: 'Product Packaging Design',
        description:
            'Create eye-catching packaging design for organic skincare product line.',
        category: 'Graphic Design',
        budget: 1200.0,
        postedBy: 'Natural Beauty Co',
        deadline: now.add(const Duration(days: 18)),
        postedDate: now.subtract(const Duration(hours: 20)),
        requirements: [
          'Packaging Design',
          '3D Mockups',
          'Print Ready',
          'Creative Concepts',
        ],
      ),
      JobModel(
        id: '25',
        title: 'Infographic Design Series',
        description:
            'Design 10 informative infographics for educational content about climate change.',
        category: 'Graphic Design',
        budget: 950.0,
        postedBy: 'Green Earth Foundation',
        deadline: now.add(const Duration(days: 15)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Infographic Design',
          'Data Visualization',
          'Illustration',
          'Typography',
        ],
      ),
      JobModel(
        id: '26',
        title: 'Website Redesign UI/UX',
        description:
            'Redesign existing website with modern UI/UX principles and improved user flow.',
        category: 'Graphic Design',
        budget: 2800.0,
        postedBy: 'E-commerce Platform',
        deadline: now.add(const Duration(days: 25)),
        postedDate: now.subtract(const Duration(hours: 16)),
        requirements: ['Web Design', 'UI/UX', 'Responsive Design', 'Figma'],
      ),
      JobModel(
        id: '27',
        title: 'Book Cover Design',
        description:
            'Design compelling book cover for mystery thriller novel with print and ebook versions.',
        category: 'Graphic Design',
        budget: 650.0,
        postedBy: 'Independent Author',
        deadline: now.add(const Duration(days: 10)),
        postedDate: now.subtract(const Duration(hours: 6)),
        requirements: [
          'Book Design',
          'Illustration',
          'Typography',
          'Print Ready',
        ],
      ),
      JobModel(
        id: '28',
        title: 'Motion Graphics for Video',
        description:
            'Create animated motion graphics for 5-minute promotional video.',
        category: 'Graphic Design',
        budget: 2200.0,
        postedBy: 'Marketing Agency',
        deadline: now.add(const Duration(days: 20)),
        postedDate: now.subtract(const Duration(days: 3)),
        requirements: [
          'Motion Graphics',
          'After Effects',
          'Animation',
          'Video Editing',
        ],
      ),
      JobModel(
        id: '29',
        title: 'Restaurant Menu Design',
        description:
            'Design elegant menu for upscale restaurant with food photography layout.',
        category: 'Graphic Design',
        budget: 580.0,
        postedBy: 'Fine Dining Restaurant',
        deadline: now.add(const Duration(days: 8)),
        postedDate: now.subtract(const Duration(hours: 14)),
        requirements: ['Menu Design', 'Print Design', 'Typography', 'Layout'],
      ),
      JobModel(
        id: '30',
        title: 'App Icon and Logo Design',
        description:
            'Create modern app icon and accompanying logo for productivity application.',
        category: 'Graphic Design',
        budget: 750.0,
        postedBy: 'App Developer',
        deadline: now.add(const Duration(days: 12)),
        postedDate: now.subtract(const Duration(hours: 9)),
        requirements: [
          'Icon Design',
          'Logo Design',
          'Brand Identity',
          'Multiple Variants',
        ],
      ),

      // Writing & Content Jobs (10)
      JobModel(
        id: '31',
        title: 'Technical Blog Writing',
        description:
            'Write 20 technical blog posts about software development topics (1500 words each).',
        category: 'Writing & Content',
        budget: 1600.0,
        postedBy: 'Tech Blog Network',
        deadline: now.add(const Duration(days: 40)),
        postedDate: now.subtract(const Duration(hours: 5)),
        requirements: [
          'Technical Writing',
          'SEO',
          'Research Skills',
          'Programming Knowledge',
        ],
      ),
      JobModel(
        id: '32',
        title: 'Product Description Writing',
        description:
            'Create compelling product descriptions for 100 e-commerce items.',
        category: 'Writing & Content',
        budget: 950.0,
        postedBy: 'Online Store',
        deadline: now.add(const Duration(days: 15)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Copywriting',
          'SEO',
          'Product Knowledge',
          'Persuasive Writing',
        ],
      ),
      JobModel(
        id: '33',
        title: 'Email Marketing Campaign Copy',
        description:
            'Write email sequences for lead nurturing campaign (10 emails).',
        category: 'Writing & Content',
        budget: 720.0,
        postedBy: 'Marketing Automation Co',
        deadline: now.add(const Duration(days: 12)),
        postedDate: now.subtract(const Duration(hours: 18)),
        requirements: [
          'Email Marketing',
          'Copywriting',
          'Conversion Focus',
          'A/B Testing Knowledge',
        ],
      ),
      JobModel(
        id: '34',
        title: 'White Paper Writing',
        description:
            'Research and write comprehensive white paper on blockchain technology.',
        category: 'Writing & Content',
        budget: 2500.0,
        postedBy: 'Blockchain Startup',
        deadline: now.add(const Duration(days: 30)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: [
          'Technical Writing',
          'Research',
          'Blockchain Knowledge',
          'Professional Tone',
        ],
      ),
      JobModel(
        id: '35',
        title: 'Website Content Writing',
        description:
            'Write content for all pages of corporate website (About, Services, FAQ, etc.).',
        category: 'Writing & Content',
        budget: 1100.0,
        postedBy: 'Consulting Firm',
        deadline: now.add(const Duration(days: 18)),
        postedDate: now.subtract(const Duration(hours: 10)),
        requirements: [
          'Web Content',
          'SEO',
          'Professional Tone',
          'Brand Voice',
        ],
      ),
      JobModel(
        id: '36',
        title: 'Social Media Captions',
        description:
            'Create engaging captions for 60 social media posts across platforms.',
        category: 'Writing & Content',
        budget: 580.0,
        postedBy: 'Fashion Brand',
        deadline: now.add(const Duration(days: 10)),
        postedDate: now.subtract(const Duration(hours: 22)),
        requirements: [
          'Social Media Writing',
          'Brand Voice',
          'Hashtag Strategy',
          'Engagement Focus',
        ],
      ),
      JobModel(
        id: '37',
        title: 'Press Release Writing',
        description:
            'Write professional press releases for company product launches (5 releases).',
        category: 'Writing & Content',
        budget: 850.0,
        postedBy: 'PR Agency',
        deadline: now.add(const Duration(days: 14)),
        postedDate: now.subtract(const Duration(days: 3)),
        requirements: [
          'Press Release',
          'Professional Writing',
          'Media Relations',
          'SEO',
        ],
      ),
      JobModel(
        id: '38',
        title: 'Video Script Writing',
        description:
            'Write scripts for 15 YouTube videos about personal finance (10 minutes each).',
        category: 'Writing & Content',
        budget: 1200.0,
        postedBy: 'Finance YouTuber',
        deadline: now.add(const Duration(days: 25)),
        postedDate: now.subtract(const Duration(hours: 7)),
        requirements: [
          'Script Writing',
          'Finance Knowledge',
          'Engaging Style',
          'Research',
        ],
      ),
      JobModel(
        id: '39',
        title: 'Case Study Writing',
        description:
            'Write detailed case studies for 5 successful client projects.',
        category: 'Writing & Content',
        budget: 1400.0,
        postedBy: 'Marketing Agency',
        deadline: now.add(const Duration(days: 20)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Case Study Writing',
          'Data Analysis',
          'Storytelling',
          'Professional Tone',
        ],
      ),
      JobModel(
        id: '40',
        title: 'SEO Article Writing',
        description:
            'Write 30 SEO-optimized articles for various niches (1200 words each).',
        category: 'Writing & Content',
        budget: 1800.0,
        postedBy: 'Content Marketing Agency',
        deadline: now.add(const Duration(days: 45)),
        postedDate: now.subtract(const Duration(hours: 12)),
        requirements: [
          'SEO Writing',
          'Keyword Research',
          'Multiple Niches',
          'High Quality',
        ],
      ),

      // Marketing Jobs (5)
      JobModel(
        id: '41',
        title: 'Instagram Growth Campaign',
        description:
            'Grow Instagram account from 5K to 50K followers organically in 3 months.',
        category: 'Marketing',
        budget: 3500.0,
        postedBy: 'Lifestyle Brand',
        deadline: now.add(const Duration(days: 90)),
        postedDate: now.subtract(const Duration(hours: 8)),
        requirements: [
          'Instagram Marketing',
          'Content Strategy',
          'Engagement',
          'Analytics',
        ],
      ),
      JobModel(
        id: '42',
        title: 'Google Ads Campaign Management',
        description:
            'Set up and manage Google Ads campaign for lead generation (3-month contract).',
        category: 'Marketing',
        budget: 2800.0,
        postedBy: 'B2B Software Company',
        deadline: now.add(const Duration(days: 90)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: [
          'Google Ads',
          'PPC',
          'Conversion Optimization',
          'Reporting',
        ],
      ),
      JobModel(
        id: '43',
        title: 'Influencer Marketing Campaign',
        description:
            'Identify and manage influencer partnerships for beauty product launch.',
        category: 'Marketing',
        budget: 4200.0,
        postedBy: 'Beauty Brand',
        deadline: now.add(const Duration(days: 60)),
        postedDate: now.subtract(const Duration(hours: 15)),
        requirements: [
          'Influencer Marketing',
          'Negotiation',
          'Campaign Management',
          'ROI Tracking',
        ],
      ),
      JobModel(
        id: '44',
        title: 'Email Marketing Strategy',
        description:
            'Develop and implement email marketing strategy for e-commerce store.',
        category: 'Marketing',
        budget: 1900.0,
        postedBy: 'Online Retailer',
        deadline: now.add(const Duration(days: 30)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Email Marketing',
          'Automation',
          'Segmentation',
          'A/B Testing',
        ],
      ),
      JobModel(
        id: '45',
        title: 'SEO Audit and Optimization',
        description:
            'Complete SEO audit and implement optimization strategies for website.',
        category: 'Marketing',
        budget: 2200.0,
        postedBy: 'SaaS Startup',
        deadline: now.add(const Duration(days: 45)),
        postedDate: now.subtract(const Duration(hours: 20)),
        requirements: [
          'SEO',
          'Technical SEO',
          'Content Strategy',
          'Link Building',
        ],
      ),

      // Data Entry Jobs (5)
      JobModel(
        id: '46',
        title: 'Product Data Entry',
        description:
            'Enter product information for 500 items into e-commerce database.',
        category: 'Data Entry',
        budget: 450.0,
        postedBy: 'E-commerce Store',
        deadline: now.add(const Duration(days: 10)),
        postedDate: now.subtract(const Duration(hours: 6)),
        requirements: [
          'Data Entry',
          'Attention to Detail',
          'Excel',
          'Fast Typing',
        ],
      ),
      JobModel(
        id: '47',
        title: 'Lead Generation Data Collection',
        description:
            'Research and compile contact information for 1000 potential B2B leads.',
        category: 'Data Entry',
        budget: 680.0,
        postedBy: 'Sales Agency',
        deadline: now.add(const Duration(days: 15)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Web Research',
          'Data Collection',
          'LinkedIn',
          'CRM Systems',
        ],
      ),
      JobModel(
        id: '48',
        title: 'Transcription Services',
        description:
            'Transcribe 10 hours of audio interviews into written documents.',
        category: 'Data Entry',
        budget: 520.0,
        postedBy: 'Research Company',
        deadline: now.add(const Duration(days: 12)),
        postedDate: now.subtract(const Duration(hours: 14)),
        requirements: [
          'Transcription',
          'Fast Typing',
          'Accuracy',
          'English Proficiency',
        ],
      ),
      JobModel(
        id: '49',
        title: 'Database Cleanup',
        description: 'Clean and organize customer database with 5000+ entries.',
        category: 'Data Entry',
        budget: 580.0,
        postedBy: 'CRM Platform',
        deadline: now.add(const Duration(days: 14)),
        postedDate: now.subtract(const Duration(hours: 10)),
        requirements: [
          'Data Cleaning',
          'Excel',
          'Database Management',
          'Attention to Detail',
        ],
      ),
      JobModel(
        id: '50',
        title: 'Survey Data Processing',
        description:
            'Process and organize data from 2000 survey responses into spreadsheet.',
        category: 'Data Entry',
        budget: 420.0,
        postedBy: 'Market Research Firm',
        deadline: now.add(const Duration(days: 8)),
        postedDate: now.subtract(const Duration(hours: 4)),
        requirements: [
          'Data Processing',
          'Excel',
          'Statistical Analysis',
          'Accuracy',
        ],
      ),
    ];
  }
}
