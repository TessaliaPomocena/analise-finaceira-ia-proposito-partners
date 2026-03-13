# Arquitetura do Sistema

## Visão Geral
Este projeto tem como objetivo o desenvolvimento de um sistema web inteligente de análise financeira automatizada, capaz de auxiliar empresas na interpretação de dados financeiros a partir de documentos enviados pelos usuários.

A aplicação foi estruturada utilizando uma arquitetura modular, separando as camadas de backend, frontend e banco de dados. Essa organização permite maior escalabilidade, manutenção facilitada e melhor divisão de responsabilidades entre os componentes do sistema.

O sistema irá utilizar tecnologias modernas de desenvolvimento web e bibliotecas de análise de dados para processar informações financeiras, gerar indicadores e produzir relatórios automatizados que auxiliem na tomada de decisão empresarial.

## Estrutura do Projeto

O sistema está organizado nas seguintes pastas:
- **backend** - Responsável pela lógica da aplicação e processamento dos dados.
- **frontend** - Responsável pela interface do usuário.
- **database** - Scripts SQL para criação e inicialização do banco de dados.
- **docs** - Contém documentação do projeto e wireframes das telas.

Essa separação facilita a manutenção do sistema e permite evolução independente das camadas.

## Backend
O backend será desenvolvido utilizando Python e o framework Django.
O backend será responsável pelo processamento dos dados financeiros e pela geração de relatórios.

A aplicação será organizada em módulos (apps), responsáveis por:
- **usuarios** – Gerenciamento de usuários (admin, analista financeiro, contador) e autenticação
- **empresas** – Cadastro e gestão de empresas
- **documentos** – Armazenamento e controle de documentos enviados
- **analise_financeira** – Motor de regras - Cálculo de indicadores financeiros
- **relatorios** – Geração de relatórios financeiros em PDF

## Processamento de Documentos
O sistema irá permitir o envio de documentos em formato PDF
Esses documentos poderão ser processados automaticamente para extração de informações relevantes, que serão utilizadas na geração de indicadores financeiros e relatórios.  
O sistema irá utilizar técnicas de OCR para extração de dados de documentos em formato PDF escaneado (imagem), utilizando OCR Tesseract.
Para PDF Digital será utilizado biblioteca pdfplumber para extrair o texto.

## Geração de Relatórios
Após o processamento dos dados financeiros, o sistema permitirá a geração de relatórios contendo indicadores e análises que auxiliem na tomada de decisão das empresas.

## Frontend
O frontend será estruturado para organizar a interface do usuário de forma modular.

As principais pastas são:

- **components** – Componentes reutilizáveis da interface
- **pages** – Páginas principais da aplicação
- **services** – Responsável pela comunicação com o backend

Essa estrutura permite maior reutilização de código e facilita a evolução da interface do sistema.

## Banco de Dados
O sistema utilizará um banco de dados relacional PostgreSQL para armazenamento das informações das empresas, usuários, documentos e resultados das análises financeiras.

Os scripts SQL para criação da estrutura inicial do banco encontram-se na pasta:
database/scripts_sql.