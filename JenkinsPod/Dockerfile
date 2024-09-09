# Usa la imagen base de Jenkins LTS
FROM jenkins/jenkins:lts

# Instalar los plugins necesarios
RUN jenkins-plugin-cli --plugins \
    terraform \
    amazon-ecs \
    workflow-aggregator

# Exponer los puertos que Jenkins usará
EXPOSE 8090
EXPOSE 51000

# Definir el directorio de trabajo para Jenkins
WORKDIR /var/jenkins_home
