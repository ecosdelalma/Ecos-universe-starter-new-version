# Ecos Universe — Starter (Next.js + Tailwind + Supabase)

Landing emocional con video, Auth (/auth) con checkbox de T&C, Onboarding de perfil (/profile) y placeholders legales.

## Requisitos
- Node 18+ (recomendado)
- Cuenta en Supabase

## Setup rápido
1. `npm i`
2. Crea `.env.local` desde `.env.example` con tus credenciales de Supabase.
3. En Supabase -> SQL Editor, copia el contenido de `supabase_schema.sql` y ejecútalo.
4. En Supabase -> Authentication -> URL Settings:
   - **Site URL**: tu dominio (Vercel) o `http://localhost:3000`
   - **Redirect URLs**: agrega `http://localhost:3000/profile` y tu dominio `https://tu-dominio/profile`
5. (Opcional) Activa Google OAuth y añade Client ID/Secret. Autoriza los Redirect URLs.
6. `npm run dev` y abre `http://localhost:3000`.

## Archivos de medios
- Coloca tu video en `public/videos/landing.mp4` (H.264, ~1080p). 
- Coloca un poster opcional en `public/images/landing-fallback.jpg`.

## Flujo
- `/` -> Landing con botón **[ be ecos ]**
- `/auth` -> Google / Email (magic link) + Aceptación de T&C
- `/profile` -> Onboarding de perfil (guarda en `profiles`)
- `/universe` -> Placeholder para continuar el recorrido

## Estilo
- Tailwind + plugin de Typography (usado en páginas legales).

---
Hecho con cariño para Leo ✨
