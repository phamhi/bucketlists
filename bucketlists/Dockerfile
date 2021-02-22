FROM python:3.9.2-alpine3.13

RUN apk update \
    && apk add --no-cache \
        curl

WORKDIR /usr/src/app

COPY . ./

RUN addgroup -S appgroup \
    && adduser -S appuser -G appgroup \
    && chown -R appuser:appgroup .

USER appuser

RUN pip install --no-warn-script-location -r requirements.txt

CMD ./run_web.sh
