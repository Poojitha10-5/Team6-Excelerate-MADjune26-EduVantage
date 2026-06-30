Excelerate-mobile-app
EduVantage

A student-focused learning and internship management platform — built with Flutter and Firebase.

week1
App Objective:
EduVantage is a student-focused learning and internship management platform designed to bridge the gap between education, skill development, and career opportunities. The application provides a centralized environment where students can discover learning programs, apply for internships, track progress, access study materials, complete assignments, and collaborate with peers through dedicated communication channels.

The primary objective of EduVantage is to simplify the learning journey by integrating educational resources and internship opportunities into a single platform. Instead of using multiple applications for learning, assignment tracking, internship management, and communication, students can access all essential features from one dashboard.

Key Objectives

1. Student Learning Management:
Provide structured learning resources through notes and study materials.
Allow students to access course content based on their enrolled programs.
Support self-paced learning through organized educational modules.

2. Internship Discovery and Management:
Display available internship opportunities.
Allow students to explore internship details and requirements.
Enable application tracking and monitoring of internship progress.
Help students stay informed about upcoming sessions and deadlines.

3. Assignment and Deliverable Tracking:
Present all assigned tasks and deliverables in one place.
Display assignment requirements and due dates.
Reduce missed deadlines through organized task management.
Improve student productivity and accountability.

4. Personalized Progress Monitoring:
Track completion percentages for courses and internships.
Visualize learning progress through progress indicators.
Encourage continuous engagement and goal achievement.
Help students identify pending activities and milestones.

5. Student Profile and Achievement Management:
Maintain student information in a dedicated profile section.
Store applied programs and internship records.
Showcase earned certificates and accomplishments.
Create a digital portfolio of student achievements.

6. Interactive Learning Experience:
Introduce challenges and activities to increase engagement.
Reward students with points and credits for participation.
Encourage consistent learning through gamification elements.
Foster motivation and skill development.

7. Communication and Collaboration:
Provide main group chats for program-wide discussions.
Support subgroup chats for project teams and internship groups.
Enable knowledge sharing among students and mentors.
Improve collaboration during learning and internship activities.

8. Unified Educational Ecosystem:
Integrate learning, internships, assignments, communication, and progress tracking into one application.
Eliminate the need to switch between multiple platforms.
Create a seamless educational and professional development experience.

Implemented Features

- Authentication — Email/password sign up and login via Firebase Auth, with session-based routing through an AuthGate.
- Home Dashboard — Central hub surfacing programs, internships, and quick access to other sections.
- Learn Screen — Study materials and a feedback form (name, email, comments) with real-time validation, submitted directly to Firestore.
- Program Details — Dedicated view for exploring individual program/internship information.
- Application Tracking — Applications are saved to Firestore with progress, applicant details, and timestamps, and can be retrieved per user.
- Messages — In-app messaging/communication screen for student collaboration.
- Live Group Chat — Real-time class-wide chat ("General Chat") where students can post and reply to each other instantly, with sender names, avatars, and timestamps.
- Certificates of Completion — Auto-generated, downloadable certificates (e.g. *Dart Fundamentals*, *Flutter UI Basics*) issued on completing a learning module, complete with completion date and a unique certificate ID.
- Pop-up Learning Notes — Tappable note cards (e.g. "Dart basics", "Widgets 101") open an in-app modal with a plain-English explanation, so students can learn concepts without leaving the Learning Hub.
- Pop-up Challenges — Gamified coding challenges (e.g. "Build a Custom Widget") presented as a modal with a clear objective, requirements, tech focus, and reward (points, level-up, achievement badge) to drive hands-on practice.
- Gamification / Rewards — Reward points and credits earned from challenges and activities, displayed on the Learning Hub.
- Profile — Stores and displays student name, email, role, and avatar initial.
- Consistent Design System — Teal-and-white theme with Poppins typography applied across all screens.

 Tech Stack
| Layer | Technology |
|---|---|
| Frontend | Flutter (Dart) |
| Authentication | Firebase Auth |
| Database | Cloud Firestore |
| Fonts | Poppins (Light → Bold) |
| Platforms | Android, iOS, Web, macOS, Windows, Linux |

Project Structure
lib/
├── main.dart                  # App entry point
├── firebase_options.dart      # Firebase platform configuration
├── models/
│   ├── user_model.dart        # Student/user data model
│   └── application_model.dart # Program/internship application model
├── services/
│   ├── auth_service.dart        # Sign up, login, auth state
│   ├── user_service.dart        # Fetch/create user profiles
│   ├── application_service.dart # Submit & fetch applications
│   └── feedback_service.dart    # Submit feedback to Firestore
├── screens/
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── learn_screen.dart
│   ├── program_details_screen.dart
│   ├── messages_screen.dart
│   └── profile_screen.dart
└── theme/
    └── app_theme.dart          # Shared colors, typography, styling

Screens Overview

| Screen | Description |
|---|---|
| Splash | App launch screen with branding |
| Login | Email/password authentication |
| Sign Up | New student account creation |
| Home | Central dashboard for programs and internships |
| Learn | Study materials + feedback submission |
| Program Details | In-depth view of a selected program/internship |
| Messages | Communication and collaboration |
| Profile | Student info, applied programs, achievements |

UI Design Approach
The interface was designed with a student-first approach, focusing on simplicity, accessibility, and ease of navigation.


week 2 

<img width="1080" height="2323" alt="Screenshot_2026-06-28-22-32-15-94_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/e89b1d4f-6c52-4c6a-aa9b-64017c6abab3" />
<img width="1080" height="2286" alt="Screenshot_2026-06-28-22-26-19-32_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/1e5d1aee-fe27-40e0-943a-e613b7199fa1" />
<img width="1080" height="2286" alt="Screenshot_2026-06-28-22-26-23-76_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/0915abcf-c635-4a41-ae34-493ee86e7810" />
<img width="1080" height="2307" alt="Screenshot_2026-06-28-23-44-25-87_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/bfbd6b27-8d4c-4275-9d1c-6036e0f634a1" />
<img width="1080" height="2318" alt="Screenshot_2026-06-28-23-44-36-59_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/92ad5dea-36c9-4dce-ba41-4a6c0176fd3e" />
<img width="1080" height="2295" alt="Screenshot_2026-06-28-23-44-40-10_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/34a7cafc-3817-4bef-ac75-9af19c6f58f4" />
<img width="1080" height="2286" alt="Screenshot_2026-06-29-00-03-11-73_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/379b14ce-465c-49d9-b083-0113f3d6ff04" />
<img width="1080" height="2336" alt="Screenshot_2026-06-29-01-13-51-56_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/de47e884-fdb0-48d9-9c04-6096e254cf8d" />
<img width="1078" height="2287" alt="Screenshot_2026-06-29-01-15-21-94_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/e6723f65-c35f-42ba-ad5d-2a51b8c8e652" />
<img width="1080" height="2289" alt="Screenshot_2026-06-29-01-15-36-28_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/17ab7af1-8c55-4c6f-bb04-64599ebfb37c" />

Core Screens — Six fully designed screens built in Flutter — Splash, Login, Sign Up, Home, Program Details, and Profile — each following a consistent teal-and-white theme with Poppins typography and smooth navigation flow.
Firebase Integration — Firebase Authentication and Cloud Firestore wired up to the Login and Sign Up screens, enabling real user account creation and session-based routing through the AuthGate.

week 3 
<img width="1080" height="2297" alt="Screenshot_2026-06-29-01-54-43-57_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/4e6228bd-5a6d-467d-b230-2b35382125a1" />
<img width="1080" height="2297" alt="Screenshot_2026-06-29-01-54-54-00_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/b26f26c4-5ead-40e9-af2a-49e4cb696d56" />
<img width="1080" height="2286" alt="Screenshot_2026-06-29-01-55-21-52_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/bb79cfff-8443-49b5-80bf-56b9555f0dab" />
Feedback Form — A fully functional feedback modal built into the Learn Screen, featuring three validated fields (name, email, and comments) with real-time error handling and a smooth loading-to-success state transition. Submitted responses are stored directly to Firebase Firestore.
Backend (Firestore Console) — The Firebase Firestore dashboard showing live feedback documents written by the app, confirming successful end-to-end data flow from the Flutter frontend to the cloud backend.

week 4 
<img width="1080" height="2307" alt="Screenshot_2026-06-29-01-54-33-23_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/ee9cfa0f-281c-4f5b-87bd-da2e5f956347" />
<img width="1080" height="2270" alt="Screenshot_2026-06-29-01-54-39-14_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/432c3ba9-0952-46c9-8866-1b46de0e70af" />
<img width="1080" height="2324" alt="Screenshot_2026-06-29-01-54-35-76_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/5a62c8a2-e1b2-4776-8c83-9f93db132cc4" />
<img width="1080" height="2286" alt="Screenshot_2026-06-29-01-54-46-10_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/c454e4d8-2778-4371-876f-f34786d42274" />
<img width="1080" height="2286" alt="Screenshot_2026-06-29-01-54-49-38_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/74531e01-ce90-4ff9-b916-05f89df811d2" />
<img width="1080" height="2285" alt="Screenshot_2026-06-29-01-55-37-25_aca56d295c8f3c0c47c69fce5f4d72e3" src="https://github.com/user-attachments/assets/e1952c27-b8dd-4686-a0f5-9eb1e24929ec" />

Certificates of Completion — Students can download a personalized certificate (e.g. *Dart Fundamentals*, *Flutter UI Basics*) once a learning module is finished, complete with completion date and a unique certificate ID for verification.
Pop-up Learning Notes — Tapping a note card like "Dart basics" opens a clean in-app modal explaining the concept in plain English, so students can learn without leaving the Learning Hub.
Pop-up Challenges — Coding challenges like "Build a Custom Widget" open as a modal showing the objective, requirements, tech focus, and reward (points, level-up, achievement badge) to make practice goal-driven and gamified.
Live Chat — The General Chat screen lets all students in the program message each other in real time, with sender names, avatars, and timestamps grouped by day.


 Getting Started

Prerequisites:
- Flutter SDK (3.x) and Dart ≥3.0.0
- A Firebase project with Authentication and Cloud Firestore enabled

Setup:
``bash
Clone the repo :-
git clone https://github.com/Poojitha10-5/Team6-Excelerate-MADjune26-EduVantage.git
cd Team6-Excelerate-MADjune26-EduVantage

Install dependencies :-
flutter pub get

Run the app :-
flutter run
```


## Team

Built by **Team 6** as part of the Excelerate Mobile App Development internship (June 2026).

---
