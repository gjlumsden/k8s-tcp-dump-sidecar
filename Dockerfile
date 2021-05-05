FROM alpine

# If an alternative base image is used, update this line to use the appropriate installation method
RUN apk add --no-cache tcpdump coreutils
WORKDIR /var/tmp
RUN echo '#!/bin/sh' > cleanup.sh
RUN echo 'ls -tp trace*| tail -n +24 | xargs -I{} sh -c "echo \"Removing {}\"; rm {}"' >> cleanup.sh && chmod a+x cleanup.sh
WORKDIR /mnt/dmp
CMD [ "-i", "any", "-U", "-K", "-w", "/mnt/dmp/trace_%Y-%m-%d_%H%M%S", "-G", "3600", "-z", "/var/tmp/cleanup.sh" ]
ENTRYPOINT [ "tcpdump" ]
