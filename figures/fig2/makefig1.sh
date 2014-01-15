#!/bin/bash

gnuplot script.gnuplot2 && pdflatex text.tex && open text.pdf
