FROM node:22-alpine

WORKDIR /app

# Copy dependency files first for better layer caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --production

# Copy source
COPY . .

# Create data directory
RUN mkdir -p data uploads

ENV NODE_ENV=production \
    HOST=0.0.0.0

CMD ["node", "server.js"]
