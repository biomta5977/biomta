FROM ubuntu:latest

WORKDIR /app

ENV APP_NAME=Biomta

RUN printf 'Hello Biomta Docker!\n' > /app/hello.txt \
    && chmod 644 /app/hello.txt

CMD ["bash"]
