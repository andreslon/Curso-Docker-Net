FROM node
WORKDIR /app
COPY primerApp ./
RUN npm install
EXPOSE 3000
CMD ["node","app.js"]