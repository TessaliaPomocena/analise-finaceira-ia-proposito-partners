// MODEL: User
// Representa a entidade de usuário no lado do cliente.
// Tipos e interfaces relacionados à autenticação e perfis de acesso.

export type UserRole = "ADM" | "ANALISTA" | "CLIENTE";

export interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
  empresaId?: string;
  createdAt: string;
}

export interface UserSession {
  user: User | null;
  token: string | null;
  isAuthenticated: boolean;
}
