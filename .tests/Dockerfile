FROM rocker/verse:4.2.1
MAINTAINER Alfredo Garbuno Iñigo "alfredo.garbuno@itam.mx"

# Declaramos al usuario, y las carpetas de trabajo
ENV RSTUDIO_USER rstudio
ENV TARGET_DIR ""

RUN adduser $RSTUDIO_USER sudo

# Declaramos ruta de trabajo
WORKDIR /home/$RSTUDIO_USER/

# Instalamos herramientas: htop (monitoreo) y librerias que necesita R para
# compilar paquetes
RUN apt-get install --no-install-recommends -qq wget ca-certificates make g++

RUN apt-get update \
    && apt-get install -y libmagick++-dev htop tree

RUN install2.r -e \
    patchwork \
    scales \ 
    rsample \ 
    R6 \
    testthat \ 
    knitr

# Clean up
RUN rm -rf /tmp/downloaded_packages  \
    && rm -rf /var/lib/apt/lists/*

RUN strip /usr/local/lib/R/site-library/*/libs/*.so

# Aseguramos que podemos trabajar desde ~/rstudio/home
RUN chown -R $RSTUDIO_USER:staff /home/$RSTUDIO_USER/

VOLUME [ "/home/$RSTUDIO_USER/$TARGET_DIR" ]
