// CONTROLLER: AuthController
// Gerencia a lógica de autenticação: login, logout, verificação de sessão.
// Consome o AuthContext e o serviço de autenticação.

import type { User } from "../models/User";

export async function loginController(
  email: string,
  password: string
): Promise<{ user: User; token: string } | null> {
  // TODO: integrar com AuthService / API
  console.log("loginController called", { email });
  return null;
}

export function logoutController(): void {
  // TODO: limpar sessão e redirecionar
  console.log("logoutController called");
}

export function getSessionController(): { user: User | null; token: string | null } {
  // TODO: recuperar sessão do cookie/localStorage
  return { user: null, token: null };
}
