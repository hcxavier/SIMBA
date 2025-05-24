# Etapa 1: Build com Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

# Copia apenas os arquivos necessários para evitar cache busting
COPY pom.xml .
COPY src ./src

# Faz o build apenas se algo mudar nos arquivos anteriores (aproveita cache)
RUN mvn clean package -DskipTests

# Etapa 2: Deploy no Tomcat
FROM tomcat:11.0.7

# Remove aplicações padrão
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o WAR gerado no build
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Configuração de healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=15s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

EXPOSE 8080

CMD ["catalina.sh", "run"]
