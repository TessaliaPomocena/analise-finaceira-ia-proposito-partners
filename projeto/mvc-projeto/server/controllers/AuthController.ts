// CONTROLLER (Server): AuthController
// Lida com requisições de login, logout e verificação de sessão.

import type { Request, Response } from "express";

export async function login(req: Request, res: Response) {
  // TODO: validar credenciais, gerar sessão/token
  const { email, password } = req.body;
  console.log("login", { email });
  res.status(501).json({ message: "Not implemented" });
}

export async function logout(req: Request, res: Response) {
  // TODO: invalidar sessão/cookie
  res.status(501).json({ message: "Not implemented" });
}

export async function me(req: Request, res: Response) {
  // TODO: retornar usuário autenticado da sessão
  res.status(501).json({ message: "Not implemented" });
}
