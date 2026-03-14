// CONFIG: env.ts
// Centraliza variáveis de ambiente e configurações do servidor.

export const config = {
  port: Number(process.env.PORT) || 3000,
  nodeEnv: process.env.NODE_ENV ?? "development",
  isProduction: process.env.NODE_ENV === "production",
  // database: process.env.DATABASE_URL,
  // jwtSecret: process.env.JWT_SECRET,
};
