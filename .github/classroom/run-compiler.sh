#! /bin/bash
docker run -v "local-directory:/home/rstudio/" agarbuno/grader:beta Rscript .tests/compile.R
