// CONTROLLER: DashboardController
// Orquestra a lógica de negócio da tela de Dashboard.
// Busca KPIs, gráficos e alertas conforme o perfil do usuário.

import type { UserRole } from "../models/User";

export async function fetchDashboardData(role: UserRole) {
  // TODO: chamar DashboardService e retornar dados por perfil
  console.log("fetchDashboardData", { role });
  return null;
}

export async function fetchKPIs(role: UserRole) {
  // TODO: buscar indicadores financeiros via API
  console.log("fetchKPIs", { role });
  return [];
}
