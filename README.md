# ConnectHub

A university community web app with a static HTML/CSS/JavaScript frontend and a Supabase backend.

## Implemented application areas
- Email/password sign-up, sign-in and sign-out
- Student profiles (name, course, year and bio)
- Campus feed: publish and delete posts, like/unlike, comment
- Saved posts
- Discover, create and join/leave campus groups
- Create campus events and RSVP/cancel RSVP
- Direct student conversations and private messages
- Notifications view (ready for notification records)

## Free setup
1. Create a project at https://supabase.com/.
2. Open Supabase SQL Editor and run all of `supabase/schema.sql`.
3. In Project Settings → API, copy the Project URL and the public anon/publishable key.
4. Copy `config.example.js` to `config.js`; set `supabaseUrl` and `supabaseAnonKey`. Never put a service_role/secret key in browser code.
5. Run locally with `python -m http.server 8000` and open http://localhost:8000.
6. In Supabase Authentication → URL Configuration, add your local URL and deployed site URL to allowed redirect URLs.
7. Deploy the repository to Vercel (Hobby tier where eligible). Add the ignored `config.js` to the deployment using your private deployment workflow; do not commit private credentials.
8. Test using at least two separate student accounts. Check post access, group joins, event RSVPs and that one account cannot read another account's private conversations.

## Database and security
The SQL creates profiles, posts, likes, saved posts, comments, groups, memberships, events, RSVPs, conversations, conversation members, messages and notifications. Row Level Security is enabled and private conversations are restricted to their members. Direct conversation creation uses the `start_conversation` database function.

## Important configuration
- `config.example.js` is a template only. The app will not connect until you create your own `config.js`.
- The public anon/publishable key is intended for browser use with RLS enabled. Never expose the service_role key.
- Configure email confirmation and password policies in Supabase Auth.
- Realtime subscriptions are not yet enabled in the interface; the current app refreshes data after actions. Enable Realtime and add subscriptions before expecting live updates across devices.
- Notifications currently have a display/read interface and database table; automated notification creation is a future integration.
- Use real university privacy rules and moderation requirements before inviting a whole campus.

## HCI documentation
See `docs/project-report.md`, `docs/presentation-script.md`, `docs/personas-and-user-journeys.md` and `docs/usability-test-plan.md`. The research/evaluation sections are plans until genuine participant sessions have been completed.
