@ECHO OFF
REM set 'FFMPEGPATH' to ffmpeg bin path
REM sample: SET FFMPEGPATH="C:\bin\ffmpeg\bin"

SET FFMPEGPATH="D:\Programas\ffmpeg\bin"
SET PALETTE="%TEMP%\ffmpeg-palette.png"
SET FILTERS="fps=%4,scale=-1:%3:flags=lanczos"

SET PATH=%FFMPEGPATH%;%PATH%

ffmpeg -v warning -i %1 -vf "%FILTERS%,palettegen=stats_mode=diff" -y %PALETTE%
ffmpeg -v warning -i %1 -i %PALETTE% -lavfi "%FILTERS% [x]; [x][1:v] paletteuse=dither=none" -y %2

