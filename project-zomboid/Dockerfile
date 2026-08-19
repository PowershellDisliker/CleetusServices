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

RUN yum update -y && yum install -y rsync && yum clean all

COPY --from=downloader /content /game_files

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["-adminpassword", "ThisIsMyAdminPassword"]