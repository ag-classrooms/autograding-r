FROM agarbuno/env-simulacion
MAINTAINER Alfredo Garbuno Iñigo "alfredo.garbuno@itam.mx"

# Declaramos al usuario, y las carpetas de trabajo
ENV RSTUDIO_USER rstudio
ENV TARGET_DIR ./

RUN adduser $RSTUDIO_USER sudo

# Declaramos ruta de trabajo
WORKDIR /home/$RSTUDIO_USER/
VOLUME [ "/home/$RSTUDIO_USER/$TARGET_DIR" ]

# CMD ["/init"]
