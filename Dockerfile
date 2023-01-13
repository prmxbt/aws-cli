FROM alpine:3.17
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
	curl \
        && \
    pip install --upgrade awscli==2.9.14 s3cmd==2.3.0 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
