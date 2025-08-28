# Tomcat 10 (Jakarta Servlet) + Java 17
FROM tomcat:10.1-jdk17-temurin

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR (nhớ đổi đúng tên file WAR đã build ra)
COPY ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Expose cổng
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
