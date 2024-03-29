#FROM openjdk:16-slim AS build-env
FROM openjdk:16-slim

ARG VERSION

RUN mkdir /app

WORKDIR /tmp

RUN apt update && apt -y upgrade && apt -y install wget git

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

RUN java -jar BuildTools.jar --rev ${VERSION}

RUN cp /tmp/spigot-*.jar /app/server.jar

# FROM gcr.io/distroless/java:16
# COPY --from=build-env /app /app

RUN rm -rf /tmp/*

WORKDIR /data

ENTRYPOINT ["java", "-Xms512M", "-Xmx2G", "-XX:+UseG1GC", "-XX:+UnlockExperimentalVMOptions", "-XX:MaxGCPauseMillis=100", "-XX:+DisableExplicitGC", "-XX:TargetSurvivorRatio=90", "-XX:G1NewSizePercent=50", "-XX:G1MaxNewSizePercent=80", "-XX:G1MixedGCLiveThresholdPercent=35", "-XX:+AlwaysPreTouch", "-XX:+ParallelRefProcEnabled", "-Dcom.mojang.eula.agree=true", "-XX:+UseStringDeduplication", "-jar", "/app/server.jar"]
