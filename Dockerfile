FROM node:20-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy the rest of the application files
COPY . .

# Expose the Vite dev server port
EXPOSE 8080

# Start Vite dev server binding to 0.0.0.0 and preventing browser auto-open inside container
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--no-open"]
