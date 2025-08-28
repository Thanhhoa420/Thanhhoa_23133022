# Tomcat 10 (Jakarta Servlet) + JDK 17
FROM tomcat:10.1-jdk17-temurin

# Dọn app mặc định
RUN rm -rf "$CATALINA_HOME/webapps"/*

# Copy WAR của bạn -> chạy ở context root "/"
# ĐỔI tên file cho đúng nếu khác
COPY ch04_ex1_survey.war "$CATALINA_HOME/webapps/ROOT.war"

# Render cấp biến PORT động -> sửa server.xml để Tomcat lắng nghe ${PORT}
RUN sed -i 's/port="8080"/port="${PORT}"/' "$CATALINA_HOME/conf/server.xml" \
 && sed -i 's/redirectPort="8443"/redirectPort="8443" URIEncoding="UTF-8"/' "$CATALINA_HOME/conf/server.xml"

# Đảm bảo UTF-8
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8"

# Chạy Tomcat
CMD ["catalina.sh", "run"]
