// UTILS (Shared): formatters.ts
// Funções utilitárias compartilhadas entre cliente e servidor.

export function formatCNPJ(cnpj: string): string {
  return cnpj.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, "$1.$2.$3/$4-$5");
}

export function formatCurrency(value: number, locale = "pt-BR", currency = "BRL"): string {
  return new Intl.NumberFormat(locale, { style: "currency", currency }).format(value);
}

export function formatDate(date: string | Date, locale = "pt-BR"): string {
  return new Intl.DateTimeFormat(locale).format(new Date(date));
}
