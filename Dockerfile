# ---- Build Stage ----
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

COPY . .

# Force correct API URL
RUN sed -i "s|http://localhost:8090|https://clinic-service.onbtech.com|g" lib/core/constants/api_constants.dart
RUN cat lib/core/constants/api_constants.dart

RUN flutter clean
RUN flutter pub get
RUN dart run build_runner build --delete-conflicting-outputs
RUN flutter build web --release

# ---- Runtime Stage ----
FROM nginx:alpine AS runtime

COPY --from=builder /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8092

CMD ["nginx", "-g", "daemon off;"]
