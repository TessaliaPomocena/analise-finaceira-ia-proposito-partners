# 📊 Análise Financeira com IA

Sistema web para automatização de extração e análise de dados financeiros (DRE, Balanço Patrimonial, Balancete) com OCR e IA.

---

## 🗂️ Arquitetura do Projeto

O projeto segue o padrão **MVC (Model-View-Controller)** dividido em três camadas principais: `client`, `server` e `shared`.

```
mvc-projeto/
├── client/                         # Frontend (React + Vite)
│   └── src/
│       ├── models/                 # M — Entidades e tipos do domínio (cliente)
│       │   ├── User.ts
│       │   ├── Empresa.ts
│       │   └── Documento.ts
│       ├── views/                  # V — Interface do usuário
│       │   ├── pages/              #     Telas da aplicação
│       │   │   ├── Home.tsx
│       │   │   ├── Login.tsx
│       │   │   ├── Dashboard.tsx
│       │   │   ├── Cadastro.tsx
│       │   │   ├── Listagem.tsx
│       │   │   ├── Upload.tsx
│       │   │   └── NotFound.tsx
│       │   └── components/
│       │       ├── ui/             #     Componentes base (shadcn/ui)
│       │       ├── layout/         #     Estrutura de layout (AppLayout, ErrorBoundary)
│       │       └── shared/         #     Componentes reutilizáveis do domínio
│       ├── controllers/            # C — Lógica de negócio do cliente
│       │   ├── AuthController.ts
│       │   ├── DashboardController.ts
│       │   └── UploadController.ts
│       ├── services/               #     Comunicação com a API
│       │   └── ApiService.ts
│       ├── contexts/               #     Estado global (React Context)
│       │   ├── AuthContext.tsx
│       │   ├── NotificationContext.tsx
│       │   └── ThemeContext.tsx
│       ├── hooks/                  #     Hooks reutilizáveis
│       ├── lib/                    #     Utilitários internos
│       ├── App.tsx                 #     Roteamento principal
│       └── main.tsx                #     Ponto de entrada
│
├── server/                         # Backend (Node.js + Express)
│   ├── models/                     # M — Esquemas de entidades (servidor)
│   │   └── User.ts
│   ├── controllers/                # C — Handlers das requisições HTTP
│   │   └── AuthController.ts
│   ├── routes/                     #     Definição de rotas Express
│   │   └── index.ts
│   ├── middlewares/                #     Middlewares (autenticação, etc.)
│   │   └── authMiddleware.ts
│   ├── services/                   #     Lógica de negócio do servidor
│   ├── config/                     #     Variáveis de ambiente e configurações
│   │   └── env.ts
│   └── index.ts                    #     Inicialização do servidor
│
├── shared/                         # Código compartilhado entre client e server
│   ├── constants/                  #     Constantes globais
│   │   └── const.ts
│   ├── models/                     #     Tipos/interfaces compartilhados
│   └── utils/                      #     Funções utilitárias (formatters, etc.)
│       └── formatters.ts
│
├── package.json
├── vite.config.ts
└── tsconfig.json
```

---

## 👥 Perfis de Usuário

| Perfil    | Descrição                                                  |
|-----------|------------------------------------------------------------|
| `ADM`     | Administrador — acesso total, gerencia usuários e empresas |
| `ANALISTA`| Analista — processa documentos e gera relatórios           |
| `CLIENTE` | Contador/Cliente — envia documentos e acompanha status     |

---

## 🖥️ Telas da Aplicação

| Rota             | Componente        | Descrição                          |
|------------------|-------------------|------------------------------------|
| `/`              | `Home`            | Página inicial / índice            |
| `/login`         | `Login`           | Autenticação de usuários           |
| `/dashboard`     | `Dashboard`       | Painel principal com KPIs          |
| `/cadastro`      | `Cadastro`        | Cadastro multi-step de empresa/usuário |
| `/empresas`      | `Listagem`        | Listagem e consulta de empresas    |
| `/usuarios`      | `Listagem`        | Listagem de usuários               |
| `/relatorios`    | `Listagem`        | Listagem de relatórios             |
| `/upload`        | `Upload`          | Upload de documentos financeiros   |
| `/configuracoes` | `Dashboard`       | Configurações do sistema           |

---

## 🎨 Design System — "Precision Finance"

Estilo **Corporate Minimalism** com acento técnico, inspirado em ferramentas financeiras profissionais.

| Token            | Valor       | Uso                          |
|------------------|-------------|------------------------------|
| Azul-Marinho     | `#0F1C2E`   | Fundo da sidebar             |
| Branco-Gelo      | `#F7F9FC`   | Fundo do conteúdo            |
| Azul-Cobalto     | `#1A56DB`   | Ação primária                |
| Verde-Esmeralda  | `#059669`   | Indicadores positivos        |
| Vermelho-Coral   | `#DC2626`   | Alertas e erros              |
| Âmbar            | `#D97706`   | Avisos e pendências          |

**Tipografia:** IBM Plex Sans (UI) + IBM Plex Mono (valores numéricos)

---

## 🚀 Como Executar

### Pré-requisitos

- [Node.js](https://nodejs.org/) >= 18
- [pnpm](https://pnpm.io/) >= 10

### Instalação

```bash
pnpm install
```

### Desenvolvimento

```bash
pnpm dev
```

Acesse: [http://localhost:3000](http://localhost:3000)

### Build para Produção

```bash
pnpm build
pnpm start
```

### Outros Scripts

```bash
pnpm check     # Verificação de tipos TypeScript
pnpm format    # Formatação com Prettier
```

---

## 🧩 Principais Dependências

| Pacote            | Finalidade                              |
|-------------------|-----------------------------------------|
| `react` 19        | Framework UI                            |
| `vite` 7          | Build tool e dev server                 |
| `express` 4       | Servidor HTTP                           |
| `wouter`          | Roteamento client-side                  |
| `tailwindcss` 4   | Estilização                             |
| `shadcn/ui`       | Componentes base (Radix UI)             |
| `recharts`        | Gráficos e visualizações               |
| `react-hook-form` | Gerenciamento de formulários            |
| `zod`             | Validação de schemas                    |
| `framer-motion`   | Animações                               |
| `lucide-react`    | Ícones                                  |

---

## 📐 Convenções de Código

- **Componentes React:** PascalCase (`Dashboard.tsx`)
- **Hooks:** prefixo `use` (`useAuth`, `useMobile`)
- **Controllers:** sufixo `Controller` (`AuthController.ts`)
- **Services:** sufixo `Service` (`ApiService.ts`)
- **Models:** PascalCase singular (`User.ts`, `Empresa.ts`)
- **Formatação:** Prettier com configuração em `.prettierrc`

---

## 📄 Licença

MIT
