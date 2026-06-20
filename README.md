# Excelerate-mobile-app
**EduVantage**

**App Objective:**
EduVantage is a student-focused learning and internship management platform designed to bridge the gap between education, skill development, and career opportunities. The application provides a centralized environment where students can discover learning programs, apply for internships, track progress, access study materials, complete assignments, and collaborate with peers through dedicated communication channels.

The primary objective of EduVantage is to simplify the learning journey by integrating educational resources and internship opportunities into a single platform. Instead of using multiple applications for learning, assignment tracking, internship management, and communication, students can access all essential features from one dashboard.


**Key Objectives:**

**1. Student Learning Management:**
Provide structured learning resources through notes and study materials.
Allow students to access course content based on their enrolled programs.
Support self-paced learning through organized educational modules.

**2. Internship Discovery and Management:**
Display available internship opportunities.
Allow students to explore internship details and requirements.
Enable application tracking and monitoring of internship progress.
Help students stay informed about upcoming sessions and deadlines.

**3. Assignment and Deliverable Tracking:**
Present all assigned tasks and deliverables in one place.
Display assignment requirements and due dates.
Reduce missed deadlines through organized task management.
Improve student productivity and accountability.

**4. Personalized Progress Monitoring:**
Track completion percentages for courses and internships.
Visualize learning progress through progress indicators.
Encourage continuous engagement and goal achievement.
Help students identify pending activities and milestones.

**5. Student Profile and Achievement Management:**
Maintain student information in a dedicated profile section.
Store applied programs and internship records.
Showcase earned certificates and accomplishments.
Create a digital portfolio of student achievements.

**6. Interactive Learning Experience:**
Introduce challenges and activities to increase engagement.
Reward students with points and credits for participation.
Encourage consistent learning through gamification elements.
Foster motivation and skill development.

**7. Communication and Collaboration:**
Provide main group chats for program-wide discussions.
Support subgroup chats for project teams and internship groups.
Enable knowledge sharing among students and mentors.
Improve collaboration during learning and internship activities.

**8. Unified Educational Ecosystem:**
Integrate learning, internships, assignments, communication, and progress tracking into one application.
Eliminate the need to switch between multiple platforms.
Create a seamless educational and professional development experience.

## UI Design Approach
The interface was designed with a student-first approach, focusing on simplicity, accessibility, and ease of navigation.


SCREENSHOTS OF EDUVANTAGE
week 2 
<img width="1920" height="1080" alt="splachscreen" src="https://github.com/user-attachments/assets/7b3e225e-9ecd-4862-85de-c6bb810187a6" />
<img width="1907" height="1006" alt="login" src="https://github.com/user-attachments/assets/d4f69e6a-ca75-4144-a573-b4ea27288816" />
<img width="1875" height="957" alt="signup" src="https://github.com/user-attachments/assets/9b4da0f2-46b2-4c52-92b1-3dae125aa51f" />
<img width="1920" height="1021" alt="home" src="https://github.com/user-attachments/assets/110c39f2-673d-4ab7-baad-580ee4cf7e6d" />
<img width="1920" height="1024" alt="programdetail1" src="https://github.com/user-attachments/assets/6fec6a08-6573-47b0-9e03-096d286456be" />
<img width="1920" height="1016" alt="programdetail2" src="https://github.com/user-attachments/assets/dd0ed19b-71eb-4651-ac4c-c027e6f16705" />
<img width="1920" height="1028" alt="profile" src="https://github.com/user-attachments/assets/5e2cc9f4-93dc-46aa-b479-078c93627de1" />

Core Screens — Six fully designed screens built in Flutter — Splash, Login, Sign Up, Home, Program Details, and Profile — each following a consistent teal-and-white theme with Poppins typography and smooth navigation flow.
Firebase Integration — Firebase Authentication and Cloud Firestore wired up to the Login and Sign Up screens, enabling real user account creation and session-based routing through the AuthGate.

week 3 
<img width="1080" height="603" alt="feedback_form" src="https://github.com/user-attachments/assets/35b6cb6a-72b4-4122-ac1b-f262e32e732f" />
<img width="1080" height="616" alt="buffering" src="https://github.com/user-attachments/assets/8da2c076-8e40-4a9e-aba6-a9cada8f66f4" />
<img width="1080" height="612" alt="feedback_submitted " src="https://github.com/user-attachments/assets/4d0d6428-05ef-4115-ac86-bfdcff08c683" />
<img width="1917" height="977" alt="auth_backend" src="https://github.com/user-attachments/assets/d35031f9-7d26-4f4d-b09f-10f030b00f58" />
<img width="1080" height="586" alt="feedback_backend" src="https://github.com/user-attachments/assets/c38f551c-0580-4cd5-8120-9a978f42bb35" />
Feedback Form — A fully functional feedback modal built into the Learn Screen, featuring three validated fields (name, email, and comments) with real-time error handling and a smooth loading-to-success state transition. Submitted responses are stored directly to Firebase Firestore.
Backend (Firestore Console) — The Firebase Firestore dashboard showing live feedback documents written by the app, confirming successful end-to-end data flow from the Flutter frontend to the cloud backend.
