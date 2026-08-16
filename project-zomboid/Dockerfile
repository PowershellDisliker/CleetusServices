FROM docker.io/steamcmd/steamcmd:latest AS downloader

RUN steamcmd +login anonymous +quit && \
    steamcmd \
    +@sSteamCmdForcePlatformType linux \
    +@sSteamCmdForcePlatformBitness 64 \
    +force_install_dir /content \
    +login anonymous \
    +app_update 380870 validate \
    +quit

FROM docker.io/amazoncorretto:latest

COPY --from=downloader /content /

CMD ["./start-server.sh", "-adminpassword", "ThisIsMyAdminPassword"]