# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package.json and lock file
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application for production
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy build output to Nginx's html directory
COPY --from=builder /app/.next /usr/share/nginx/html
COPY --from=builder /app/public /usr/share/nginx/html

# Nginx configuration
COPY --from=builder /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]