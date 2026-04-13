
# ETAP 1:
FROM alpine:3.19 AS builder

ARG VERSION="undefined"

WORKDIR /build
COPY app/ .

RUN sed -i "s/BUILD_VERSION_PLACEHOLDER/${VERSION}/g" script.js

# ETAP 2:
FROM nginx:alpine AS runtime

LABEL org.opencontainers.image.authors="Twoje Imię i Nazwisko"
LABEL org.opencontainers.image.version="${VERSION}"

COPY --from=builder /build/ /usr/share/nginx/html/

RUN apk add --no-cache curl

HEALTHCHECK --interval=20s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
