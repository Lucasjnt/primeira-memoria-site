# SEO + GEO Checklist — Primeira Memória

Estado atual da landing após pass de SEO/GEO em 09/05/2026.

---

## SEO técnico (on-page)

### Meta tags
- [x] `<title>` otimizado: "Primeira Memória — Quadros Maternidade Artesanais | Feito à mão em São Paulo"
- [x] `<meta description>` com keywords + diferenciais + CTA implícito
- [x] `<meta keywords>` (8 termos relevantes — peso baixo no Google mas Bing/Yandex usam)
- [x] `<meta robots>` permitindo `max-image-preview:large` (rich results)
- [x] `<link rel="canonical">` apontando pra raiz
- [x] `<html lang="pt-BR">` correto
- [x] `<meta theme-color>` pra mobile chrome
- [x] `<meta viewport>` responsivo
- [x] Heading hierarchy correta: 1 H1 (hero), múltiplos H2 (seções), H3 (steps)

### Open Graph + Twitter Card
- [x] `og:type`, `og:site_name`, `og:locale=pt_BR`, `og:url`, `og:title`, `og:description`
- [x] `og:image` com width 1200 + height 630 + alt
- [x] Twitter: `summary_large_image` + title + description + image + alt

### Performance / Core Web Vitals
- [x] Vídeos otimizados (5.4MB total · era 196MB)
- [x] `loading="lazy"` em 8 imagens (galeria + cilene + quadros)
- [x] `decoding="async"` em todas as imagens
- [x] `fetchpriority="high"` no hero image (LCP otimizado)
- [x] `<link rel="preload">` no hero
- [x] `<link rel="preconnect">` Google Fonts
- [x] CSS inline (sem render-blocking)
- [x] JavaScript no final do body, sem `defer/async` necessário (mínimo)

### Files
- [x] `robots.txt` permitindo bots tradicionais + IA (GPTBot, ClaudeBot, PerplexityBot, Google-Extended)
- [x] `sitemap.xml` com URL principal + 6 imagens dos quadros
- [x] Favicon configurado

---

## GEO (Generative Engine Optimization)

GEO = aparecer em resposta de IA (ChatGPT, Claude, Perplexity, Gemini). Princípios aplicados:

### Structured data (JSON-LD)
- [x] **Organization** — nome, logo, fundadora (Cilene), localização, sameAs (Instagram), contactPoint (WhatsApp)
- [x] **LocalBusiness** — endereço São Paulo SP, telefone, priceRange R$ 320-490, areaServed Brasil
- [x] **Product** — nome, descrição, imagens (3 quadros), brand link, additionalProperty (tamanho 20×20cm, 7 dias, materiais), offers (AggregateOffer com lowPrice 320 + highPrice 490 BRL, InStock)
- [x] **FAQPage** — 6 Q&As que respondem objeções de compra (tempo, personalização, segurança, tamanho, preço, presente)
- [x] **WebSite** — entidade raiz com inLanguage pt-BR

### Conteúdo factual e citável
- [x] Localização clara: "São Paulo, Brasil" em 4+ pontos
- [x] Autoria: "Cilene" mencionada explicitamente (não anônima)
- [x] Specs precisas: 20×20cm, 7 dias, 800+ pérolas, R$ 320-490
- [x] Linguagem assertiva e factual (não promocional vazia)
- [x] Q&A natural pra LLM citar (FAQ section)

### Bots de IA
- [x] `robots.txt` Allow explícito pra: GPTBot, ChatGPT-User, anthropic-ai, ClaudeBot, Claude-Web, PerplexityBot, Google-Extended, CCBot, Applebot-Extended

### Citação cross-canal (sameAs)
- [x] Instagram link no JSON-LD
- [ ] **Pendente:** quando criar Google Business Profile, adicionar URL nele
- [ ] **Pendente:** Wikidata entry (low priority — fazer só se vira marca conhecida)

---

## Pendente — precisa de ação do Lucas

### Google Analytics 4
1. Criar property em [analytics.google.com](https://analytics.google.com)
2. Pegar Measurement ID (formato `G-XXXXXXXXXX`)
3. Me passar o ID que eu plugo no template já preparado em `index.html` (linhas 256-263)

### Google Search Console
1. Após DNS apontar pra Cloudflare, ir em [search.google.com/search-console](https://search.google.com/search-console)
2. Adicionar property: `primeiramemoria.com.br`
3. Verificar via **DNS TXT record** (recomendado) — adicionar TXT no Cloudflare DNS
   - Alternativa: meta tag (template já preparado em `index.html` linha 268)
4. Após verificar, submeter `https://primeiramemoria.com.br/sitemap.xml`
5. Inspecionar URL principal e solicitar indexação

### Bing Webmaster Tools
1. [bing.com/webmasters](https://www.bing.com/webmasters) — importar do GSC (1 clique)
2. Submeter sitemap

### Validação pós-deploy
Quando o site estiver no ar, validar com:
- [Schema Markup Validator](https://validator.schema.org/) — cole a URL
- [Rich Results Test](https://search.google.com/test/rich-results) — espera pegar Product, FAQPage, Organization
- [PageSpeed Insights](https://pagespeed.web.dev/) — alvo 90+ em ambos
- [Meta Tag Inspector](https://metatags.io/) — preview Twitter/Facebook/LinkedIn

---

## Keywords prioritárias (target)

Pra ranquear bem, conteúdo da landing já tem:

**Primárias** (alta intenção comercial):
- `quadro maternidade artesanal`
- `quadro maternidade pérola`
- `porta maternidade luxo`
- `presente chá de bebê personalizado`

**Secundárias** (long-tail):
- `quadro maternidade São Paulo`
- `quadro com nome do bebê`
- `decoração quartinho de bebê premium`

**Long-tail/GEO** (perguntas):
- "quanto custa quadro maternidade artesanal"
- "quadro maternidade quanto tempo demora"
- "presente para chá de bebê que dura"
- "quadro com pérolas para bebê"

A FAQPage estruturada faz o conteúdo aparecer em featured snippets + respostas de IA pra essas perguntas.

---

## Próximos passos pra ranquear (pós-lançamento)

1. **Backlinks orgânicos** — trocar link com blogs de gestantes (lista de 20+ blogs PT-BR no nicho)
2. **Conteúdo programático** — página `/quadro-[nome]` autogerada pra cada peça entregue
3. **Google Business Profile** — abrir registro como artesã (Cilene como titular)
4. **Pinterest** — sourcer de tráfego forte pro nicho, mas precisa cadência. Pinterest Verified Domain após DNS.
5. **Content marketing** — 1 post por mês: "como escolher um quadro maternidade", "diferença entre porta-maternidade industrial e artesanal", etc

Cada um desses puxa o domínio pra cima nos 3-6 meses iniciais.
