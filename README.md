# Streaming Activity – yt-extracto.sh

Script en Bash para descargar un vídeo de YouTube, extraer su audio en formato MP3 y generar un vídeo sin sonido comprimido con H.265 (HEVC).

## ¿Qué hace el script?

- Comprueba si tienes instalados `yt-dlp` y `ffmpeg`. Si no, los instala automáticamente.
- Solicita al usuario una URL de YouTube.
- Muestra todos los formatos disponibles del vídeo.
- Permite elegir el formato de vídeo a descargar.
- Descarga el vídeo en el formato elegido.
- Extrae el audio y lo guarda como `audio_extraido.mp3`.
- Crea un vídeo sin audio y lo guarda como `video_sin_audio.mp4` (códec H.265).
- Muestra información técnica de ambos archivos generados.

## Requisitos

- Ubuntu con permisos `sudo`
- `yt-dlp` (instalación automática incluida)
- `ffmpeg` (instalación automática incluida)

## Cómo usarlo en tu servidor Ubuntu

```bash
git clone https://github.com/VelocirautoAdmin/Streaming-activity.git
cd Streaming-activity
chmod +x yt-extracto.sh
./yt-extracto.sh
