FROM rocker/verse:4.2.1
MAINTAINER Alfredo Garbuno Iñigo "alfredo.garbuno@itam.mx"

# Lets declare some user variables =============================================
ENV RSTUDIO_USER rstudio
ENV TARGET_DIR ""

# Lets declare the work directory ==============================================
RUN adduser $RSTUDIO_USER sudo
WORKDIR /home/$RSTUDIO_USER/
RUN ls -lha 

# Setup renv workspace =========================================================
ENV RENV_PATHS_ROOT /home/$RSTUDIO_USER/.renv
RUN mkdir $RENV_PATHS_ROOT
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.dcf renv/settings.dcf
RUN ls -lha

# Install renv specific version ================================================
# ENV RENV_VERSION 0.14.0
# RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
# RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Instalamos herramientas: htop (monitoreo) y librerias que necesita R para
# compilar paquetes
RUN apt-get install --no-install-recommends -qq wget ca-certificates make g++
RUN apt-get update \
    && apt-get install -y libmagick++-dev htop tree

# Clean up =====================================================================
RUN rm -rf /tmp/downloaded_packages  \
    && rm -rf /var/lib/apt/lists/*

RUN strip /usr/local/lib/R/site-library/*/libs/*.so

# Aseguramos que podemos trabajar desde ~/rstudio/home =========================
RUN chown -R $RSTUDIO_USER:staff /home/$RSTUDIO_USER/
VOLUME [ "/home/$RSTUDIO_USER/$TARGET_DIR" ]


