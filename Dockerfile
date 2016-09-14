FROM ruby:latest
ADD https://github.com/barockok/skripsi-service-merchant-portal/archive/master.tar.gz ./artifact.tar.gz
RUN mkdir app && tar xf ./artifact.tar.gz -C ./app --strip-components=1 && rm ./artifact.tar.gz
WORKDIR ./app
RUN /usr/local/bin/bundle install
EXPOSE 3000
ENV PORT 3000
ENV PROTOCOL http
RUN echo "#!/bin/sh\nif [ \"\$PROTOCOL\" = \"http\" ]; then /usr/local/bin/bundle exec puma --port=$PORT; else /usr/local/bin/ruby thrift_server.rb; fi" > ./entry.sh \
  && chmod +x ./entry.sh
CMD ["./entry.sh"]