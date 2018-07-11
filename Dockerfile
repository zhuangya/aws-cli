FROM alpine:3.6
RUN apk -v --update add \
        git \
        openssh \
        tar \
        gzip \
        ca-certificates \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade pip awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
