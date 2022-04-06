# Step 1
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


# Step 2
FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app ./
CMD ["npm", "run", "start:prod"]
