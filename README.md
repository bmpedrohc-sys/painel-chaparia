# Painel de Produção — Chaparia

Painel de gestão visual por linha (Previsto x Realizado hora a hora). Página única (`index.html`), dados no **Supabase**, código no **GitHub**, hospedagem no **Render**.

## Arquivos

| Arquivo | Para quê |
|---|---|
| `index.html` | O painel |
| `supabase.sql` | Cria a tabela `painel_dados` e as permissões no Supabase |
| `render.yaml` | Configuração do site estático no Render |
| `.nojekyll` | Só usado se publicar também pelo GitHub Pages |

## 1. Supabase (banco)

1. Crie um projeto em supabase.com.
2. **SQL Editor → New query**, cole o conteúdo de `supabase.sql` e clique em **Run**.
3. Em **Project Settings → API**, copie a **Project URL** e a chave **anon public**.
4. No `index.html`, procure `SUPABASE_CONFIG` e preencha:
   ```js
   url: 'https://xxxxxxxx.supabase.co',
   anonKey: 'eyJhbGciOi...',
   ```

## 2. GitHub (código)

Envie todos os arquivos desta pasta para a raiz de um repositório.

## 3. Render (hospedagem)

1. Em render.com: **New → Blueprint**, escolha o repositório (ele lê o `render.yaml`).
   Ou **New → Static Site**, escolha o repositório, Build Command vazio e Publish Directory `.`.
2. A cada push no GitHub o Render publica de novo sozinho.

## Como saber se está salvando no banco

No rodapé do painel:
- 🟢 **Conectado ao banco (Supabase)** — dados compartilhados entre todos.
- 🟠 **Modo local** — `SUPABASE_CONFIG` não preenchido, tabela não criada ou sem internet. Os dados ficam só naquele navegador.

## Segurança

A chave `anon` é pública por natureza (fica visível no código da página). Quem tiver o link do site e a chave consegue ler e gravar na tabela — não consegue apagar. Para uso interno isso costuma bastar; se precisar restringir, o próximo passo é adicionar login (Supabase Auth). A senha `2026` do Previsto/reset também fica visível no código-fonte.
