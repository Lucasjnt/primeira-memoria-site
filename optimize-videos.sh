#!/usr/bin/env bash
# Otimiza vídeos da landing pra deploy: H.264 baseline + bitrate reduzido + faststart
# Mantém qualidade visível, corta peso pela metade ou mais.
# Output: 06-landing-page/assets/videos/

set -e
cd "$(dirname "$0")/.."

SRC=02-mood-mockups/marketing/videos
DEST=06-landing-page/assets/videos
mkdir -p "$DEST"

# CRF 26 = qualidade bem boa pra web; movflags=faststart deixa começar a tocar antes do download terminar
encode() {
  local IN="$1"
  local OUT="$2"
  local SCALE="$3"  # ex: scale=1280:-2 ou scale=720:-2
  echo "→ $(basename "$IN") → $(basename "$OUT")"
  ffmpeg -y -loglevel error -i "$IN" \
    -vf "$SCALE,format=yuv420p" \
    -c:v libx264 -preset veryslow -crf 26 \
    -c:a aac -b:a 96k \
    -movflags +faststart \
    "$OUT"
}

# Hero: full bg, importante mas não precisa 4K — 1280p basta na web
encode "$SRC/hero-site.mp4"               "$DEST/hero-site.mp4"               "scale=1280:-2"

# Atelier (16:9, mostrados em coluna ~600px): 960px chega
encode "$SRC/atelier-a-maos.mp4"          "$DEST/atelier-a-maos.mp4"          "scale=960:-2"
encode "$SRC/atelier-b-sapatinho.mp4"     "$DEST/atelier-b-sapatinho.mp4"     "scale=960:-2"
encode "$SRC/atelier-c-embalagem.mp4"     "$DEST/atelier-c-embalagem.mp4"     "scale=1280:-2"

# Lifestyle 9:16 e Promo (pra Stories — mantém vertical alta)
encode "$SRC/lifestyle-9x16-arthur.mp4"   "$DEST/lifestyle-9x16-arthur.mp4"   "scale=-2:960"
encode "$SRC/lifestyle-9x16-elisa.mp4"    "$DEST/lifestyle-9x16-elisa.mp4"    "scale=-2:960"
encode "$SRC/lifestyle-9x16-pov-caixa.mp4" "$DEST/lifestyle-9x16-pov-caixa.mp4" "scale=-2:960"
encode "$SRC/promo-9x16-stories.mp4"      "$DEST/promo-9x16-stories.mp4"      "scale=-2:960"

echo ""
echo "─── Antes / Depois ───"
echo "Originais:"
du -sh $SRC/*.mp4 | sort -h
echo ""
echo "Otimizados:"
du -sh $DEST/*.mp4 | sort -h
echo ""
echo "Total original:"; du -ch $SRC/*.mp4 | tail -1
echo "Total otimizado:"; du -ch $DEST/*.mp4 | tail -1
