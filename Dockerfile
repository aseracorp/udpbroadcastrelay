# Use alpine base image
FROM ubuntu


# Install any needed packages
RUN apt-get update \
  && apt-get install -y gcc make git iproute2 bash\
  && mkdir src \
  && cd src \
  && git clone --depth 1 https://github.com/deonvdw/udpbroadcastrelay.git \
  && cd udpbroadcastrelay \
  && make \
  && cp udpbroadcastrelay /udpbroadcastrelay \
  && rm -rf /src/udpbroadcastrelay/ \
  && apt-get remove -y gcc make git \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /
COPY start.sh /start.sh

# Define environment variable
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG=C.UTF-8
ENV TZ=Canada/Pacific

# Run when the container launches
CMD ["/bin/bash", "/start.sh"]
