# ConnectHub: Designing a University Community Platform
**Human Computer Interaction — Group Project (DTECH206)**  
**Department:** Information and Communication Technology  
**Semester:** 05 · September 2026–February 2027  
**Group members:** [Insert actual names and student IDs]  
**Lecturer:** Kenneth G. Kampbell  
**Institution:** Limkokwing University of Creative Technology, Sierra Leone

> **Submission note:** This is a structured report draft and prototype documentation. Replace placeholders, verify the references against your library access, and conduct the proposed user evaluation before submitting. No interviews, survey results or usability findings are invented in this report.

## 1. Introduction
University life involves more than attending lectures. Students need to discover campus activities, find classmates with shared interests, coordinate group assignments and keep track of announcements. When these activities are scattered across separate messaging groups, noticeboards and informal networks, students may miss useful information or struggle to identify the right place to participate.

ConnectHub is a proposed university community platform that brings a campus activity feed, discovery of student groups, event information and a simple messaging entry point into one interface. The project focuses on the human-computer interaction (HCI) design of the user interface. It does not attempt to build the complete production infrastructure of a social network.

## 2. Project topic brainstorming
The assignment asks students to generate three feasible ideas and choose the most promising one.

### Idea 1 — ConnectHub: University community platform
A responsive platform where students can view campus announcements, discover interest groups, find study partners and see upcoming events. A unified feed and clear navigation reduce the effort required to find campus information.

### Idea 2 — StudyMate: Peer study matching
A student-facing tool that helps learners find study partners by course, topic, availability and preferred study style. A guided matching flow could help students form study groups.

### Idea 3 — AgriConnect: Farmer–buyer marketplace
An ICT marketplace that helps farmers publish available crops and quantities, connect with buyers, compare current market prices and communicate about potential sales. The interface could also help users keep clearer digital records of listings and enquiries. This concept would need field research with farmers and buyers to validate connectivity, digital-literacy, trust and pricing-information needs.

## 3. Selected idea and justification
ConnectHub is selected because it addresses several connected student activities through a single interface while remaining feasible to prototype and evaluate within the course timeframe. Its core flows—viewing a feed, finding groups, checking events, saving useful posts and composing an update—can be demonstrated without implementing production messaging, authentication or institutional databases. The other concepts are useful but narrower: StudyMate concentrates on matching, while QueueLess concentrates on service queues. ConnectHub offers a broader but still manageable opportunity to apply navigation, information hierarchy, feedback, consistency and responsive interaction design.

## 4. Problem description
Students may receive academic and social information through multiple channels, including class groups, personal messages, printed notices and word of mouth. A student who is not part of the relevant group or who checks a channel late may miss an event, study opportunity or announcement. Discovering classmates with shared academic interests can also require asking several people or searching unrelated channels.

The design problem is therefore: **How might a university community interface help students discover relevant campus information and participate in academic and social activities without requiring them to navigate several disconnected channels?**

This is a design problem statement, not a claim that every student at the institution experiences the same difficulty. The scope and priority of the problem should be validated with actual student participants.

## 5. Goals and objectives
### Overall goal
Design and evaluate an accessible, understandable and responsive interface concept that helps students discover campus information and engage with their university community.

### Specific objectives
1. Identify the information and community tasks students consider most important through a small, documented user-research activity.
2. Create a clear information architecture for the feed, discovery, events, messages, saved posts and notifications.
3. Develop a working front-end prototype that demonstrates the main interaction flows on desktop and mobile-sized screens.
4. Apply HCI principles including visibility of system status, consistency, recognition rather than recall, user control and clear feedback.
5. Evaluate whether representative users can complete selected tasks and identify interface problems for improvement.

## 6. Related research literature
### Reference 1 — Norman (2013)
Norman explains how discoverability, feedback, constraints, mapping and conceptual models influence how people understand and use designed objects. These ideas inform ConnectHub's visible navigation, clear action labels and feedback after actions such as saving a post or responding to an event. The reference supports designing interactions that communicate what happened and what users can do next.

### Reference 2 — Nielsen (1994)
Nielsen discusses usability heuristics such as visibility of system status, match between the system and the real world, consistency, error prevention, recognition rather than recall and user control. ConnectHub applies these as design checks: selected navigation is highlighted, event RSVP actions change their label, common actions use consistent placement, and the interface uses familiar terms such as “Saved posts” and “Notifications”.

## 7. Research methodology
The assignment rubric places substantial weight on methodology. The following plan is intended to be carried out by the group; it is not a record of completed fieldwork.

### 7.1 Research approach
Use a small formative, user-centred design study combining short semi-structured interviews with task-based usability evaluation. This is appropriate for understanding student needs and then checking whether the proposed interface supports representative tasks.

### 7.2 Participants and sampling
Recruit approximately 5–8 university students using convenience sampling, aiming for variation in year of study and familiarity with digital campus communication. Participation should be voluntary. Do not collect unnecessary personal information. Explain the purpose of the activity and obtain permission before recording notes.

### 7.3 Data collection
**Discovery interviews:** Ask participants how they currently learn about campus events and announcements, how they find study partners or groups, which channels they use, what information is often missed, and what they would want in a single campus platform. Use neutral questions and allow participants to describe their own experience.

**Task-based evaluation:** Ask participants to complete the tasks below using the prototype. Observe without coaching unless they become stuck. Record completion, hesitation, errors, comments and suggestions.

### 7.4 Prototype evaluation tasks
1. Find the upcoming design thinking workshop and identify its time and location.
2. Save a useful post so it can be found later.
3. Publish a short campus update.
4. Find the Discover page and identify a group related to studying.
5. RSVP to the campus culture day event.
6. Open notifications and mark them as read.

### 7.5 Data analysis
Summarise interview notes using simple thematic grouping (for example, information discovery, event awareness, study collaboration and privacy). For usability sessions, calculate task completion as completed tasks divided by attempted tasks, note recurring errors and group comments by severity and theme. Report the number of participants and any limitations. Do not claim statistical generalisability from a small convenience sample.

### 7.6 Ethical considerations
Participation must be voluntary. Explain that the prototype uses sample names and demonstration content. Do not enter real private student information. Store notes securely, anonymise quotations and allow participants to stop at any time.

## 8. Implementation: interface design and prototype
### 8.1 Scope
The prototype is a responsive browser interface built with HTML, CSS and JavaScript. It uses local sample content and client-side state. It does not provide real user accounts, server-side storage, live messaging, institutional authentication, content moderation or push notifications.

### 8.2 Main interface areas
- **Home:** welcome message, community feed, post composer, upcoming events and suggested connections.
- **Discover:** sample interest groups and an entry point for finding campus communities.
- **Campus events:** event cards with dates, locations, descriptions and RSVP controls.
- **Messages:** demonstration conversation list; no real messages are transmitted.
- **Saved posts:** bookmarked items from the feed.
- **Notifications:** sample updates with a mark-as-read action.

### 8.3 Interaction design decisions
- Persistent navigation provides a consistent way to move between major sections.
- Active navigation styling communicates the current location.
- Action labels and visible state changes provide feedback after likes, saves, RSVP and follow actions.
- The feed composer uses a familiar text-entry pattern.
- Search filters sample feed content and gives users a direct way to locate posts.
- Responsive layout adapts to smaller screens and simplifies navigation.

### 8.4 HCI principles applied
**Visibility of system status:** the selected page is highlighted and actions change state.  
**Consistency and standards:** repeated cards, buttons and labels follow shared patterns.  
**Recognition rather than recall:** section names remain visible in navigation.  
**User control:** users can undo likes, remove saved status and cancel an RSVP.  
**Aesthetic and minimalist design:** the interface prioritises key campus tasks and avoids dense menus.  
**Accessibility intentions:** semantic HTML, labelled search and composer controls, focusable buttons and live status feedback are included. Further keyboard and screen-reader testing is still required.

## 9. Evaluation plan and limitations
The prototype should be tested with the tasks in Section 7.4. A completed report should include a table showing each participant's task completion, issues observed and proposed changes. Because no user sessions have been supplied or conducted as part of this draft, this report does not include fabricated findings.

Limitations include the small proposed participant sample, sample-only data, lack of backend services and the fact that visual accessibility has not yet been independently audited. The prototype demonstrates interface behaviour rather than production readiness.

## 10. Conclusion
ConnectHub proposes a unified interface for campus updates, student groups, events and community interaction. The project follows the assignment's emphasis on designing, implementing and evaluating an interface prototype rather than building every supporting technology. The next step is to validate the problem with student participants, conduct the usability tasks, revise the interface based on observed issues and update this report with genuine findings.

## References
Nielsen, J. (1994). Enhancing the explanatory power of usability heuristics. *Proceedings of the SIGCHI Conference on Human Factors in Computing Systems*, 152–158. https://doi.org/10.1145/191666.191729

Norman, D. A. (2013). *The Design of Everyday Things: Revised and Expanded Edition*. Basic Books.
