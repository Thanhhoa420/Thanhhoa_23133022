# Tomcat 10 (Jakarta Servlet) + Java 17
FROM tomcat:10.1-jdk17-temurin

# Xoá app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR đã build, đổi tên thành ROOT.war để chạy ở "/"
COPY ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Sửa server.xml để Connector dùng biến $PORT thay vì cứng 8080
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

# Thiết lập encoding mặc định UTF-8 (tránh lỗi tiếng Việt)
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8"

# Render sẽ tự đặt biến PORT, không cần EXPOSE
CMD ["catalina.sh", "run"]

