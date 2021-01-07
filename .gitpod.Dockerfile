FROM gitpod/workspace-full-vnc
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
USER root
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
&& sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' \
&& rm microsoft.gpg \
&& apt update \
&& apt install -y microsoft-edge-dev
USER gitpod 