FROM mcr.microsoft.com/java/jdk:8-zulu-alpine

# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]

# Install OpenSSH and set the password for root to "Docker!".
RUN apk add openssh \
     && echo "root:Docker!" | chpasswd

# Copy the sshd_config file to the /etc/ssh/ directory
COPY sshd_config /etc/ssh/

# Copy and configure the ssh_setup file
RUN mkdir -p /tmp
COPY ssh_setup.sh /tmp
RUN chmod +x /tmp/ssh_setup.sh \
    && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null)

# Open port 2222 for SSH access
EXPOSE 80 2222

COPY start_container.sh /start_container.sh
RUN chmod u+x /start_container.sh

ENTRYPOINT ["sh", "/start_container.sh"]
