-- Tabla de perfiles
create table if not exists public.profiles (
  id uuid primary key references auth.users on delete cascade,
  display_name text,
  alias text,
  word text,
  eco_type text,
  color text,
  photo_url text,
  bio text,
  accepted_tos boolean not null default false,
  accepted_tos_version text,
  accepted_tos_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Actualiza updated_at automáticamente
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end; $$;

drop trigger if exists trg_profiles_updated on public.profiles;
create trigger trg_profiles_updated
before update on public.profiles
for each row execute procedure public.set_updated_at();

-- RLS
alter table public.profiles enable row level security;
do $$ begin
  if not exists (select 1 from pg_policies where policyname = 'select own profile' and tablename = 'profiles') then
    create policy "select own profile" on public.profiles for select using (auth.uid() = id);
  end if;
  if not exists (select 1 from pg_policies where policyname = 'update own profile' and tablename = 'profiles') then
    create policy "update own profile" on public.profiles for update using (auth.uid() = id);
  end if;
  if not exists (select 1 from pg_policies where policyname = 'insert own profile' and tablename = 'profiles') then
    create policy "insert own profile" on public.profiles for insert with check (auth.uid() = id);
  end if;
end $$;

-- Trigger: crea perfil vacío al crear usuario
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.profiles(id, accepted_tos, accepted_tos_version, accepted_tos_at)
  values (new.id,
          coalesce((new.raw_user_meta_data->>'accepted_tos')::boolean,false),
          new.raw_user_meta_data->>'accepted_tos_version',
          to_timestamp(coalesce(nullif(new.raw_user_meta_data->>'accepted_tos_at',''), to_char(now(),'YYYY-MM-DD"T"HH24:MI:SS"Z"')), 'YYYY-MM-DD"T"HH24:MI:SS"Z"'))
  on conflict do nothing;
  return new;
end; $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();
