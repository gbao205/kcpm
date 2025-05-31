FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist /usr/share/nginx/html
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf # Đảm bảo bạn có tệp frontend/nginx.conf

WORKDIR /app
COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh  # <-- THÊM DÒNG NÀY để cấp quyền thực thi
EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"] # <-- THAY ĐỔI CMD thành ENTRYPOINT
