// CONTROLLER: UploadController
// Gerencia o fluxo de upload de documentos: validação, envio e acompanhamento de status.

import type { Documento } from "../models/Documento";

export async function uploadDocumento(file: File, empresaId: string): Promise<Documento | null> {
  // TODO: validar tipo/tamanho, chamar UploadService
  console.log("uploadDocumento", { fileName: file.name, empresaId });
  return null;
}

export async function fetchDocumentos(empresaId: string): Promise<Documento[]> {
  // TODO: buscar lista de documentos via API
  console.log("fetchDocumentos", { empresaId });
  return [];
}
