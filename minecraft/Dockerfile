FROM docker.io/library/eclipse-temurin:latest

# Install curl and jq needed by entrypoint script
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl jq && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

# Copy the entrypoint script into the image
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run entrypoint script first, then execute java
ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-Xms2G", "-Xmx4G", "-jar", "server.jar", "nogui"]