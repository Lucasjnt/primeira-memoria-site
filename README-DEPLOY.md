# Deploy — Primeira Memória landing

Tudo necessário pra publicar a landing está nesta pasta. **Self-contained** — `assets/` tem todas as imagens, vídeos e logos. Nenhum CDN externo (só Google Fonts).

---

## Passo 1 · Registrar o domínio (paralelo)

1. Acessa **[registro.br](https://registro.br)** (única opção pra `.com.br`)
2. Buscar `primeiramemoria.com.br` — deve estar disponível (verificado em 08/05/2026)
3. CPF da Cilene como titular (recomendado) ou seu CPF
4. Pagar via Pix · **R$ 40/ano**
5. Aguardar ~2h pra ativar

Não bloqueia o passo 2 — Cloudflare Pages já dá um URL `*.pages.dev` pra testar imediatamente.

---

## Passo 2 · Cloudflare Pages (deploy estático)

### Opção A — Drag & drop (mais rápido pra subir agora)

1. Cria conta grátis em [dash.cloudflare.com](https://dash.cloudflare.com)
2. **Workers & Pages** → **Create application** → **Pages** → **Upload assets**
3. Nome do projeto: `primeira-memoria`
4. Arrasta a pasta inteira `06-landing-page/` (ou só seu conteúdo)
5. Deploy → URL `https://primeira-memoria.pages.dev` em ~30s

### Opção B — Via Git (recomendado pra updates futuros)

```bash
cd 06-landing-page
git init
git add .
git commit -m "primeiramemoria.com.br · v1"
gh repo create primeiramemoria-site --public --push --source .
```

No Cloudflare Pages: Connect to Git → escolhe o repo → Build command vazio (HTML estático) → Deploy. Cada `git push` daqui pra frente vira deploy automático.

---

## Passo 3 · Apontar o domínio

Quando o domínio estiver ativo no Registro.br:

1. Cloudflare Pages → seu projeto → **Custom domains** → Add domain → `primeiramemoria.com.br`
2. Cloudflare mostra **2 nameservers** (tipo `xena.ns.cloudflare.com` e `walt.ns.cloudflare.com`)
3. No painel do Registro.br: **DNS** → trocar pros nameservers da Cloudflare
4. Esperar 30min-2h pra propagar (checa em [whatsmydns.net](https://www.whatsmydns.net))
5. SSL ativa automaticamente após propagação

Resultado: `https://primeiramemoria.com.br` vivo, com SSL, CDN global, e bandwidth ilimitado.

---

## Passo 4 · Antes de subir, conferir

- [ ] Substituir `5511999999999` pelo número real da Cilene/atelier (4 ocorrências em `index.html`)
- [ ] Substituir `instagram.com/primeira.memoria` por handle real (se diferente)
- [ ] Substituir `contato@primeiramemoria.com.br` por email real (ou remover se sem e-mail ainda)
- [ ] Trocar `atelier-a-maos.mp4` pelo regen com mãos meia-idade + quadro real (rodar `08-video-comercial/regen-atelier-maos.sh` quando recarregar Higgsfield)
- [ ] Adicionar mais hero/lifestyle Elisa+Maria Eduarda quando Higgsfield voltar

---

## Estrutura final (pra deploy)

```
06-landing-page/
├── index.html                    ← landing
├── README-DEPLOY.md              ← este arquivo
├── optimize-videos.sh            ← regen vídeos otimizados (já rodou)
└── assets/
    ├── logos/
    │   ├── wordmark-trimmed-light.png  (cream bg)
    │   ├── wordmark-trimmed-dark.png   (dark bg)
    │   └── favicon.jpg
    ├── images/
    │   ├── hero-elisa-1.png      (hero gallery + og:image)
    │   ├── pessoa-colando.png    (Cilene section)
    │   ├── quadro-arthur-frontal.jpg
    │   ├── quadro-coroa.jpg
    │   ├── quadro-elisa.jpg
    │   ├── quadro-heitor.jpg
    │   └── quadro-lucca.jpg
    └── videos/
        ├── hero-site.mp4         (1.9MB · 1280x720 · loop hero)
        ├── atelier-a-maos.mp4    (260KB · 960x540 · loop)
        ├── atelier-b-sapatinho.mp4
        ├── atelier-c-embalagem.mp4
        ├── lifestyle-9x16-arthur.mp4   (não usado na v1, reserva)
        ├── lifestyle-9x16-elisa.mp4    (não usado na v1, reserva)
        ├── lifestyle-9x16-pov-caixa.mp4 (não usado na v1, reserva)
        └── promo-9x16-stories.mp4 (não usado na v1, reserva)
```

**Total: ~12MB** (incluindo vídeos não usados — pode podar se quiser ainda mais leve).
**Vídeos usados na v1 atual:** ~3MB. Carrega instantâneo em qualquer conexão.

---

## Por que Cloudflare Pages e não Vercel/Netlify?

| | Cloudflare | Vercel | Netlify |
|---|---|---|---|
| Bandwidth grátis | **Ilimitado** | 100GB/mês | 100GB/mês |
| Builds grátis | 500/mês | 100h/mês | 300min/mês |
| CDN | 300+ pops | 20+ regiões | 20+ regiões |
| SSL | Auto | Auto | Auto |
| Domínio custom | Grátis | Grátis | Grátis |

Pra uma landing que vai ter pico de tráfego no lançamento (Insta + Stories + Meta Ads), o ilimitado da Cloudflare elimina qualquer surpresa.

---

## Atualizações pós-lançamento

Pra atualizar a landing depois de publicada:

```bash
# Edita index.html ou trocou um vídeo
git add .
git commit -m "update: novo hero / preço / etc"
git push
# Cloudflare detecta o push e re-publica em ~30s
```

Sem dor.
