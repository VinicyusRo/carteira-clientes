# Carteira de clientes

Painel privado para acompanhar a prospecção de clientes: lista de contato, ficha com entrevista, funil, projetos, pagamentos e financeiro.

- **Site:** https://vinicyusro.github.io/carteira-clientes/
- **Login:** Supabase Auth (e-mail e senha). Cadastro público desligado.
- **Dados:** tabela `carteira` no Supabase, com Row Level Security: cada usuário só lê e altera a própria linha (`supabase.sql`).
- O repositório não guarda nenhum dado de cliente. A chave no `index.html` é a chave pública (publishable) do Supabase, feita para ficar no navegador.

Tudo fica em um único arquivo, `index.html`, sem etapa de build.
