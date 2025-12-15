import '../models/job_model.dart';

abstract class JobsLocalDataSource {
  Future<List<JobModel>> getJobs();
}

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  @override
  Future<List<JobModel>> getJobs() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Hardcoded jobs data for testing
    final now = DateTime.now();
    return [
      JobModel(
        id: '1',
        title: 'Flutter Mobile App Development',
        description:
            'We are looking for an experienced Flutter developer to build a cross-platform mobile application for our e-commerce business. The app should have user authentication, product catalog, shopping cart, and payment integration.',
        category: 'Mobile Development',
        budget: 5000.0,
        postedBy: 'John Smith',
        deadline: now.add(const Duration(days: 30)),
        postedDate: now.subtract(const Duration(days: 2)),
        requirements: [
          'Minimum 3 years of Flutter experience',
          'Knowledge of Firebase',
          'Experience with payment gateways',
          'Clean code and documentation',
        ],
      ),
      JobModel(
        id: '2',
        title: 'WordPress Website Design',
        description:
            'Need a professional WordPress website for a small business. Should include home page, about us, services, blog, and contact page. Mobile responsive and SEO optimized.',
        category: 'Web Development',
        budget: 1500.0,
        postedBy: 'Sarah Johnson',
        deadline: now.add(const Duration(days: 15)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'WordPress expertise',
          'Modern design skills',
          'SEO knowledge',
          'Responsive design',
        ],
      ),
      JobModel(
        id: '3',
        title: 'Logo Design for Tech Startup',
        description:
            'Looking for a creative graphic designer to create a modern and memorable logo for our tech startup. We need multiple concepts and revisions until we find the perfect design.',
        category: 'Graphic Design',
        budget: 500.0,
        postedBy: 'Mike Chen',
        deadline: now.add(const Duration(days: 7)),
        postedDate: now.subtract(const Duration(hours: 12)),
        requirements: [
          'Portfolio of logo designs',
          'Creative and original ideas',
          'Multiple revision rounds',
          'Vector files delivery',
        ],
      ),
      JobModel(
        id: '4',
        title: 'Content Writing for Travel Blog',
        description:
            'Seeking a talented content writer to create engaging travel blog posts. Need 10 articles about different destinations, each 1000-1500 words with SEO optimization.',
        category: 'Writing & Content',
        budget: 800.0,
        postedBy: 'Emma Wilson',
        deadline: now.add(const Duration(days: 20)),
        postedDate: now.subtract(const Duration(days: 3)),
        requirements: [
          'Excellent English writing',
          'Travel writing experience',
          'SEO knowledge',
          'Research skills',
        ],
      ),
      JobModel(
        id: '5',
        title: 'Social Media Marketing Campaign',
        description:
            'Need a social media expert to manage our Instagram and Facebook pages. Create content, engage with followers, and grow our audience organically.',
        category: 'Marketing',
        budget: 2000.0,
        postedBy: 'David Brown',
        deadline: now.add(const Duration(days: 60)),
        postedDate: now.subtract(const Duration(days: 5)),
        requirements: [
          'Social media management experience',
          'Content creation skills',
          'Analytics knowledge',
          'Growth strategy expertise',
        ],
      ),
      JobModel(
        id: '6',
        title: 'Data Entry for E-commerce Store',
        description:
            'Looking for someone to enter product data into our e-commerce platform. Need to input 500 products with descriptions, prices, and images.',
        category: 'Data Entry',
        budget: 300.0,
        postedBy: 'Lisa Anderson',
        deadline: now.add(const Duration(days: 10)),
        postedDate: now.subtract(const Duration(days: 1)),
        requirements: [
          'Attention to detail',
          'Fast typing speed',
          'Excel skills',
          'Reliable and punctual',
        ],
      ),
      JobModel(
        id: '7',
        title: 'React.js Web Application Development',
        description:
            'Build a modern web application using React.js, Node.js, and MongoDB. The application is a task management system with real-time updates and user collaboration features.',
        category: 'Web Development',
        budget: 7500.0,
        postedBy: 'Robert Taylor',
        deadline: now.add(const Duration(days: 45)),
        postedDate: now.subtract(const Duration(hours: 8)),
        requirements: [
          'Expert in React.js and Node.js',
          'MongoDB experience',
          'WebSocket/Socket.io knowledge',
          'REST API development',
        ],
      ),
      JobModel(
        id: '8',
        title: 'Mobile Game UI/UX Design',
        description:
            'Design beautiful and intuitive user interface for a mobile puzzle game. Need complete UI kit, game screens, icons, and animations.',
        category: 'Graphic Design',
        budget: 2500.0,
        postedBy: 'Amanda White',
        deadline: now.add(const Duration(days: 25)),
        postedDate: now.subtract(const Duration(days: 4)),
        requirements: [
          'Game UI/UX experience',
          'Modern design trends',
          'Animation skills',
          'Figma or Adobe XD proficiency',
        ],
      ),
    ];
  }
}
