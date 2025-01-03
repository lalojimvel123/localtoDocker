FROM debian:bookworm-slim

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y wget unzip expect libc6 libstdc++6 libgcc1 libicu-dev libssl-dev libkrb5-3 zlib1g && \
    rm -rf /var/lib/apt/lists/*

# Descargar y extraer Localtonet
WORKDIR /app
RUN wget -O localtonet-linux-x64.zip "https://localtonet.com/download/localtonet-linux-x64.zip" && \
    unzip localtonet-linux-x64.zip && \
    rm localtonet-linux-x64.zip

# Asegurarse de que localtonet es ejecutable
COPY start_debian.sh .
RUN chmod +x localtonet

# Asegurarse de que start_debian.sh es ejecutable
RUN chmod +x start_debian.sh

# Establecer el script como punto de entrada
CMD ["start_debian.sh"]
