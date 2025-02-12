# Utilisation d'une image Node.js officielle comme base
FROM node:16

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Installer les dépendances de l'application
RUN npm install

# Copier le reste de l'application dans le conteneur
COPY . .

# Construire l'application React
RUN npm run build

# Exposer le port 5000
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["npx", "serve", "-s", "build", "-l", "5000"]
