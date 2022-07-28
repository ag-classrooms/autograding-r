#! /bin/bash
docker run -v "local-directory:/home/rstudio/" agarbuno:gh-grader:4.2.1 Rscript .tests/grade.R
