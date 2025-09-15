import React from "react";

export default function Landing() {
  return (
    <main className="relative h-dvh w-dvw overflow-hidden">
      <video
        className="fixed inset-0 h-full w-full object-cover"
        src="/videos/landing.mp4"
        poster="/images/landing-fallback.jpg"
        autoPlay
        loop
        muted
        playsInline
        disablePictureInPicture
        controls={false}
        aria-label="Video emocional de bienvenida"
      />
      <div className="pointer-events-none fixed inset-0 bg-black/30" />
      <div className="relative z-10 h-dvh w-dvw">
        <a
          href="/auth"
          className="group fixed bottom-6 left-1/2 -translate-x-1/2 md:left-auto md:right-6 md:translate-x-0 inline-flex items-center justify-center gap-2 rounded-2xl border border-white/60 bg-white/10 px-6 py-2 backdrop-blur-sm text-white tracking-widest uppercase text-sm transition-all hover:bg-white/20 active:scale-[0.99] focus:outline-none focus-visible:ring-2 focus-visible:ring-white/80"
          aria-label="Entrar o registrarse"
        >
          <span aria-hidden> [ be ecos ] </span>
          <span className="sr-only">Entrar / Registrarse</span>
        </a>
      </div>
      <noscript>
        <style>{`:root,body,#__next{height:100%}body{margin:0} .bg{position:fixed;inset:0;background:#000 url('/images/landing-fallback.jpg') center/cover no-repeat}`}</style>
        <div className="bg" />
      </noscript>
    </main>
  );
}
