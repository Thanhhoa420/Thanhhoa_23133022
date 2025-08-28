# Tomcat 10 (Jakarta Servlet) + Java 17
FROM tomcat:10.1-jdk17-temurin

# Làm sạch webapps mặc định
RUN rm -rf "$CATALINA_HOME/webapps"/*

# Copy WAR vào ROOT để chạy ở "/"
COPY ch04_ex1_survey.war "$CATALINA_HOME/webapps/ROOT.war"

# Thay server.xml để dùng cổng từ biến môi trường $PORT
COPY docker/server.xml "$CATALINA_HOME/conf/server.xml"

# Script khởi động: set system property PORT cho Tomcat
COPY docker/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Không cần EXPOSE vì Render tự set
CMD ["run.sh"]

