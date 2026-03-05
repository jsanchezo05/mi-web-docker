# ── ETAPA 1: Construcción ──
FROM ubuntu:latest AS constructor
WORKDIR /build
COPY build.sh .
RUN chmod +x build.sh && ./build.sh

# ── ETAPA 2: Producción ──
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=constructor /build/index_final.html index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
