#!/bin/bash

# Función para comprobar instalación de una herramienta
check_install() {
  if ! command -v "$1" &> /dev/null
  then
    echo "$1 no está instalado. Instalando..."
    sudo apt update
    sudo apt install -y "$1"
  else
    echo "$1 está instalado."
  fi
}

# Comprobar yt-dlp y ffmpeg
check_install yt-dlp
check_install ffmpeg

# Pedir URL al usuario
read -p "Introduce la URL del vídeo de YouTube: " URL

# Mostrar formatos disponibles
echo "Obteniendo formatos disponibles..."
yt-dlp -F "$URL"

# Pedir formato al usuario
read -p "Introduce el código del formato de vídeo a descargar (ejemplo 22): " FORMAT

# Descargar vídeo con el formato elegido
yt-dlp -f "$FORMAT" -o 'video_descargado.%(ext)s' "$URL"

# Detectar extensión del archivo descargado
EXT=$(ls video_descargado.* | sed 's/.*\.//')

# Extraer audio a mp3
echo "Extrayendo audio a mp3..."
ffmpeg -i "video_descargado.$EXT" -q:a 0 -map a audio_extraido.mp3

# Extraer vídeo sin audio y comprimir con H.265
echo "Extrayendo vídeo sin audio y comprimiendo..."
ffmpeg -i "video_descargado.$EXT" -an -c:v libx265 video_sin_audio.mp4

# Mostrar información de audio y vídeo resultantes
echo "Información del audio extraído:"
ffmpeg -i audio_extraido.mp3 2>&1 | head -n 20

echo "Información del vídeo sin audio:"
ffmpeg -i video_sin_audio.mp4 2>&1 | head -n 20

echo "Proceso finalizado."
echo "Archivos generados:"
echo "- audio_extraido.mp3"
echo "- video_sin_audio.mp4"
