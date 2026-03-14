// MODEL: Empresa
// Representa a entidade de empresa no lado do cliente.

export interface Empresa {
  id: string;
  razaoSocial: string;
  cnpj: string;
  responsavelTecnico: string;
  status: "ativa" | "inativa" | "pendente";
  analistaId?: string;
  createdAt: string;
}
