// MODEL (Server): User
// Esquema e tipagem da entidade User para persistência no servidor.

export type UserRole = "ADM" | "ANALISTA" | "CLIENTE";

export interface UserModel {
  id: string;
  name: string;
  email: string;
  passwordHash: string;
  role: UserRole;
  empresaId?: string;
  createdAt: Date;
  updatedAt: Date;
}
