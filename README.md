# Primeira Memória — Landing Page

Landing oficial de [primeiramemoria.com.br](https://primeiramemoria.com.br).

Marca de quadros maternidade artesanais, feitos à mão pela Cilene em São Paulo.
> Onde o amor encontra a memória.

## Stack

- HTML estático puro (sem build, sem framework)
- Google Fonts (Cormorant Garamond + Manrope)
- Hospedado em Cloudflare Pages
- Vídeos em H.264 otimizados (~5MB total) com `<video autoplay muted loop playsinline>`

## Estrutura

```
.
├── index.html               página completa
├── README.md                este arquivo
├── README-DEPLOY.md         passo-a-passo de deploy
├── optimize-videos.sh       regen dos vídeos otimizados (opcional)
└── assets/
    ├── logos/               wordmark + favicon
    ├── images/              fotos dos quadros + cilene
    └── videos/              hero + atelier + lifestyle
```

## Deploy

Cada `git push` na branch `main` dispara redeploy automático no Cloudflare Pages.
Detalhes em [README-DEPLOY.md](README-DEPLOY.md).

## Update local

```bash
# editar index.html, ajustar copy ou trocar asset
git add .
git commit -m "update: ..."
git push
# Cloudflare publica em ~30s
```
