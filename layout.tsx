import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Ecos Universe",
  description: "MVP emocional de Ecos Universe",
  icons: [{ rel: "icon", url: "/favicon.ico" }],
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es" className="h-full">
      <body className="h-full">{children}</body>
    </html>
  );
}
