-- 1) Supabase SQL Editor에서 전체 실행하세요.
create extension if not exists pgcrypto;

create table if not exists public.posts (
  id uuid primary key default gen_random_uuid(),
  board text not null check (board in ('discussion','free')),
  nickname text not null check (char_length(nickname) between 1 and 20),
  title text not null check (char_length(title) between 1 and 100),
  body text not null check (char_length(body) between 1 and 5000),
  created_at timestamptz not null default now()
);

create table if not exists public.comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.posts(id) on delete cascade,
  nickname text not null check (char_length(nickname) between 1 and 20),
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now()
);

alter table public.posts enable row level security;
alter table public.comments enable row level security;

create policy "public can read posts" on public.posts for select using (true);
create policy "public can create posts" on public.posts for insert with check (true);
create policy "public can read comments" on public.comments for select using (true);
create policy "public can create comments" on public.comments for insert with check (true);

-- Supabase Storage에서 'magazines'라는 Public bucket을 만든 뒤
-- PDF 파일을 업로드하면 사이트의 과지 메뉴에서 자동으로 목록을 불러옵니다.
-- 운영 단계에서는 스팸 방지를 위해 CAPTCHA/Rate Limit/관리자 삭제 기능을 추가하는 것을 권장합니다.
