FROM alpine_drogon:3.23.0-1.9.11-1.5.24 AS build
WORKDIR /build
COPY CMakeLists.txt .
COPY main.cc .
RUN mkdir /build/release && cd /build/release cmake .. && cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target hello_drogon -j 6

FROM alpine:3.23.0
RUN adduser -h /home/drogon -s sh -D drogon && apk add --no-cache libstdc++ jsoncpp ossp-uuid
COPY --from=build /build/release/hello_drogon /usr/bin/
EXPOSE 5555
WORKDIR /home/drogon
CMD ["/usr/bin/hello_drogon"]
USER drogon
