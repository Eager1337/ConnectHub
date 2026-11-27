-- ConnectHub database schema for Supabase (PostgreSQL)
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null default 'Student',
  course text default '',
  year_of_study text default '',
  bio text default '',
  avatar_url text,
  role text not null default 'student' check (role in ('student','moderator','admin')),
  created_at timestamptz not null default now()
);
create table if not exists public.posts (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.post_likes (
  post_id uuid not null references public.posts(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (post_id,user_id)
);
create table if not exists public.comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.posts(id) on delete cascade,
  author_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 1000),
  created_at timestamptz not null default now()
);
create table if not exists public.campus_groups (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text not null default '',
  category text not null default 'General',
  created_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create table if not exists public.group_members (
  group_id uuid not null references public.campus_groups(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  joined_at timestamptz not null default now(),
  primary key (group_id,user_id)
);
create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text not null default '',
  venue text not null default '',
  starts_at timestamptz not null,
  organizer_id uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create table if not exists public.event_rsvps (
  event_id uuid not null references public.events(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (event_id,user_id)
);
create table if not exists public.conversations (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now()
);
create table if not exists public.conversation_members (
  conversation_id uuid not null references public.conversations(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  primary key (conversation_id,user_id)
);
create table if not exists public.messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references public.conversations(id) on delete cascade,
  sender_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 4000),
  created_at timestamptz not null default now()
);
create table if not exists public.notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  actor_id uuid references public.profiles(id) on delete set null,
  kind text not null,
  entity_id uuid,
  body text not null,
  read_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists posts_created_idx on public.posts(created_at desc);
create index if not exists comments_post_idx on public.comments(post_id,created_at);
create index if not exists messages_conversation_idx on public.messages(conversation_id,created_at);
create index if not exists notifications_user_idx on public.notifications(user_id,created_at desc);

alter table public.profiles enable row level security;
alter table public.posts enable row level security;
alter table public.post_likes enable row level security;
alter table public.comments enable row level security;
alter table public.campus_groups enable row level security;
alter table public.group_members enable row level security;
alter table public.events enable row level security;
alter table public.event_rsvps enable row level security;
alter table public.conversations enable row level security;
alter table public.conversation_members enable row level security;
alter table public.messages enable row level security;
alter table public.notifications enable row level security;

create policy "Profiles visible to signed-in users" on public.profiles for select to authenticated using (true);
create policy "Users update own profile" on public.profiles for update to authenticated using (auth.uid()=id) with check (auth.uid()=id);
create policy "Users insert own profile" on public.profiles for insert to authenticated with check (auth.uid()=id);

create policy "Signed-in users read posts" on public.posts for select to authenticated using (true);
create policy "Users create own posts" on public.posts for insert to authenticated with check (auth.uid()=author_id);
create policy "Authors update own posts" on public.posts for update to authenticated using (auth.uid()=author_id) with check (auth.uid()=author_id);
create policy "Authors delete own posts" on public.posts for delete to authenticated using (auth.uid()=author_id);

create policy "Likes visible to signed-in users" on public.post_likes for select to authenticated using (true);
create policy "Users like as themselves" on public.post_likes for insert to authenticated with check (auth.uid()=user_id);
create policy "Users remove own likes" on public.post_likes for delete to authenticated using (auth.uid()=user_id);

create policy "Comments visible to signed-in users" on public.comments for select to authenticated using (true);
create policy "Users comment as themselves" on public.comments for insert to authenticated with check (auth.uid()=author_id);
create policy "Authors delete own comments" on public.comments for delete to authenticated using (auth.uid()=author_id);

create policy "Groups visible to signed-in users" on public.campus_groups for select to authenticated using (true);
create policy "Signed-in users create groups" on public.campus_groups for insert to authenticated with check (auth.uid()=created_by);
create policy "Group creators update groups" on public.campus_groups for update to authenticated using (auth.uid()=created_by) with check (auth.uid()=created_by);
create policy "Memberships visible to signed-in users" on public.group_members for select to authenticated using (true);
create policy "Users join as themselves" on public.group_members for insert to authenticated with check (auth.uid()=user_id);
create policy "Users leave groups" on public.group_members for delete to authenticated using (auth.uid()=user_id);

create policy "Events visible to signed-in users" on public.events for select to authenticated using (true);
create policy "Users create events" on public.events for insert to authenticated with check (auth.uid()=organizer_id);
create policy "Organizers update events" on public.events for update to authenticated using (auth.uid()=organizer_id) with check (auth.uid()=organizer_id);
create policy "RSVPs visible to signed-in users" on public.event_rsvps for select to authenticated using (true);
create policy "Users RSVP themselves" on public.event_rsvps for insert to authenticated with check (auth.uid()=user_id);
create policy "Users cancel own RSVP" on public.event_rsvps for delete to authenticated using (auth.uid()=user_id);

create policy "Members read conversations" on public.conversations for select to authenticated using (exists(select 1 from public.conversation_members m where m.conversation_id=id and m.user_id=auth.uid()));
create policy "Signed-in users create conversations" on public.conversations for insert to authenticated with check (auth.uid() is not null);
create policy "Members see conversation members" on public.conversation_members for select to authenticated using (exists(select 1 from public.conversation_members m where m.conversation_id=conversation_id and m.user_id=auth.uid()));
create policy "Users add themselves to conversations" on public.conversation_members for insert to authenticated with check (auth.uid()=user_id);
create policy "Members read messages" on public.messages for select to authenticated using (exists(select 1 from public.conversation_members m where m.conversation_id=conversation_id and m.user_id=auth.uid()));
create policy "Members send messages as themselves" on public.messages for insert to authenticated with check (auth.uid()=sender_id and exists(select 1 from public.conversation_members m where m.conversation_id=conversation_id and m.user_id=auth.uid()));
create policy "Users read own notifications" on public.notifications for select to authenticated using (auth.uid()=user_id);
create policy "Users update own notifications" on public.notifications for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path=public as $$
begin
  insert into public.profiles(id,full_name) values(new.id,coalesce(new.raw_user_meta_data->>'full_name','Student'));
  return new;
end; $$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users for each row execute procedure public.handle_new_user();

-- Seed starter campus groups and example events. Remove/edit these to match your institution.
insert into public.campus_groups(name,description,category) values
('Tech & Innovation','Projects, coding, technology discussions and new ideas.','Technology'),
('Creative Corner','Design, photography, art and creative collaboration.','Creative'),
('Study Partners','Find classmates, revise together and share learning tips.','Academic')
on conflict do nothing;

-- Enable Realtime for new messages and feed updates from the Supabase dashboard if not already enabled.
