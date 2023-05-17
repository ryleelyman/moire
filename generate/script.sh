#!/bin/sh
convert -size 96x96 canvas:transparent -fill "#090912" -draw "circle 47.5,47.5 47.5,0" moire-00.png
convert -size 96x96 canvas:transparent -fill "#1a1e28" -draw "circle 47.5,47.5 47.5,0" moire-01.png
convert -size 96x96 canvas:transparent -fill "#221f2a" -draw "circle 47.5,47.5 47.5,0" moire-02.png
convert -size 96x96 canvas:transparent -fill "#1d1b26" -draw "circle 47.5,47.5 47.5,0" moire-03.png
convert -size 96x96 canvas:transparent -fill "#2d2834" -draw "circle 47.5,47.5 47.5,0" moire-04.png
convert -size 96x96 canvas:transparent -fill "#312e39" -draw "circle 47.5,47.5 47.5,0" moire-05.png
convert -size 96x96 canvas:transparent -fill "#4c4552" -draw "circle 47.5,47.5 47.5,0" moire-06.png
convert -size 96x96 canvas:transparent -fill "#605765" -draw "circle 47.5,47.5 47.5,0" moire-07.png
convert -size 96x96 canvas:transparent -fill "#6a5f6e" -draw "circle 47.5,47.5 47.5,0" moire-08.png
convert -size 96x96 canvas:transparent -fill "#a5899a" -draw "circle 47.5,47.5 47.5,0" moire-09.png
convert -size 96x96 canvas:transparent -fill "#bfa1b5" -draw "circle 47.5,47.5 47.5,0" moire-10.png
convert -size 96x96 canvas:transparent -fill "#eecde4" -draw "circle 47.5,47.5 47.5,0" moire-11.png
convert -size 96x96 canvas:transparent -fill "#e45385" -draw "circle 47.5,47.5 47.5,0" moire-12.png
convert -size 96x96 canvas:transparent -fill "#d463d0" -draw "circle 47.5,47.5 47.5,0" moire-13.png
convert -size 96x96 canvas:transparent -fill "#f48ad4" -draw "circle 47.5,47.5 47.5,0" moire-14.png
convert -size 96x96 canvas:transparent -fill "#e99569" -draw "circle 47.5,47.5 47.5,0" moire-15.png
convert -size 96x96 canvas:transparent -fill "#d9a292" -draw "circle 47.5,47.5 47.5,0" moire-16.png
convert -size 96x96 canvas:transparent -fill "#e7c16b" -draw "circle 47.5,47.5 47.5,0" moire-17.png
convert -size 96x96 canvas:transparent -fill "#bcbe60" -draw "circle 47.5,47.5 47.5,0" moire-18.png
convert -size 96x96 canvas:transparent -fill "#97b664" -draw "circle 47.5,47.5 47.5,0" moire-19.png
convert -size 96x96 canvas:transparent -fill "#6ec6a9" -draw "circle 47.5,47.5 47.5,0" moire-20.png
convert -size 96x96 canvas:transparent -fill "#a6e5ef" -draw "circle 47.5,47.5 47.5,0" moire-21.png
convert -size 96x96 canvas:transparent -fill "#758fc6" -draw "circle 47.5,47.5 47.5,0" moire-22.png
convert -size 96x96 canvas:transparent -fill "#8994c1" -draw "circle 47.5,47.5 47.5,0" moire-23.png
convert -size 96x96 canvas:transparent -fill "#ae8cd3" -draw "circle 47.5,47.5 47.5,0" moire-24.png
convert -size 96x96 canvas:transparent -fill "#8e52ad" -draw "circle 47.5,47.5 47.5,0" moire-25.png
convert -append moire-*.png layout.png
