// MODEL: Documento
// Representa a entidade de documento/upload no lado do cliente.

export type DocumentoStatus = "pendente" | "processando" | "processado" | "erro";

export interface Documento {
  id: string;
  nome: string;
  tipo: string;
  tamanho: number;
  status: DocumentoStatus;
  empresaId: string;
  uploadedBy: string;
  createdAt: string;
}
