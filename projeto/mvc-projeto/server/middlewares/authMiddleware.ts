// MIDDLEWARE: authMiddleware
// Verifica se a requisição possui uma sessão válida antes de liberar rotas protegidas.

import type { Request, Response, NextFunction } from "express";
import { COOKIE_NAME } from "../../shared/constants/const";

export function requireAuth(req: Request, res: Response, next: NextFunction) {
  const session = req.cookies?.[COOKIE_NAME];
  if (!session) {
    return res.status(401).json({ message: "Não autorizado" });
  }
  // TODO: validar token/sessão
  next();
}
