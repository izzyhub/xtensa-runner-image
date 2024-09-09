ARG BASE_IMAGE_TAG

FROM ghcr.io/catthehacker/ubuntu:${BASE_IMAGE_TAG}

ARG IMAGE_CREATED
ARG IMAGE_VERSION
ARG IMAGE_REVISION

COPY install_rust.sh /bin/
RUN /bin/install_rust.sh
COPY install_xtensa.sh /bin/
RUN /bin/install_xtensa.sh

LABEL org.opencontainers.image.created="${IMAGE_CREATED}" \
  org.opencontainers.image.authors="Gitea" \
  org.opencontainers.image.url="https://gitea.izzys.place/gitea/xtensa-runner-images" \
  org.opencontainers.image.documentation="https://gitea.izzys.place/gitea/runner-images/src/branch/main/README.md" \
  org.opencontainers.image.source="https://gitea.izzys.place/gitea/xtensa-runner-images" \
  org.opencontainers.image.version="${IMAGE_VERSION}" \
  org.opencontainers.image.revision="${IMAGE_REVISION}" \
  org.opencontainers.image.vendor="Gitea" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.title="Gitea Actions runner images with the xtensa tool chain installed" \
  org.opencontainers.image.description="Gitea action images with xtensa toolchain installed images used by act_runner to run workflows."
