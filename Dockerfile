FROM debian:bookworm-slim

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y wget unzip expect libc6 libstdc++6 libgcc1 libicu-dev libssl-dev libkrb5-3 zlib1g && \
    rm -rf /var/lib/apt/lists/*

# Asegurarse de que localtonet es ejecutable
RUN chmod +x /app/localtonet

# Descargar el script `start_debian.sh` desde GitHub
RUN chmod +x /app/start_debian.sh

# Establecer el script como punto de entrada
CMD ["/app/start_debian.sh"]
