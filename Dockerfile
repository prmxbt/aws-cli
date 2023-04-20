FROM alpine:3.17
RUN apk -v --update add \
        python3 \
        py-pip \
        groff \
        less \
        mailcap \
	curl \
        && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip && \
    rm -rf /var/cache/apk/* /root/.cache/pip/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
