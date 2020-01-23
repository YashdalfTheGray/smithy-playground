FROM amazoncorretto:8

# install some dependencies
RUN yum install -y vim wget unzip

# install gradle
RUN wget -nv https://services.gradle.org/distributions/gradle-5.0-bin.zip -P /tmp && unzip -q -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-5.0
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# set up the app workspace
RUN mkdir -p /usr/playground
WORKDIR /usr/playground

# initialze an empty kotlin project
RUN gradle --no-daemon init --type kotlin-library --dsl kotlin
COPY build.gradle.kts /usr/playground/build.gradle.kts
RUN gradle
