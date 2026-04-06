# ---- Build Stage ----
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

COPY . .

# Debug: verify source file
RUN cat lib/core/constants/api_constants.dart

RUN flutter clean
RUN flutter pub get
RUN dart run build_runner build --delete-conflicting-outputs
RUN flutter build web --release

# Debug: verify built output
RUN grep -r "localhost" build/web/ | head -5 || echo "NO LOCALHOST FOUND"
RUN grep -r "clinic-service.onbtech" build/web/ | head -5 || echo "NO ONBTECH FOUND"

# ---- Runtime Stage ----
FROM nginx:alpine AS runtime

COPY --from=builder /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8092

CMD ["nginx", "-g", "daemon off;"]
