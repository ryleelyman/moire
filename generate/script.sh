#!/bin/sh
convert -size 96x96 canvas:transparent -fill "#191922" -draw "circle 47.5,47.5 47.5,0" moire-00dark6.png
convert -size 96x96 canvas:transparent -fill "#1a1e28" -draw "circle 47.5,47.5 47.5,0" moire-01dark5.png
convert -size 96x96 canvas:transparent -fill "#23242f" -draw "circle 47.5,47.5 47.5,0" moire-02dark4.png
convert -size 96x96 canvas:transparent -fill "#2f2c28" -draw "circle 47.5,47.5 47.5,0" moire-03dark3.png
convert -size 96x96 canvas:transparent -fill "#35332d" -draw "circle 47.5,47.5 47.5,0" moire-04dark2.png
convert -size 96x96 canvas:transparent -fill "#47413b" -draw "circle 47.5,47.5 47.5,0" moire-05dark1.png
convert -size 96x96 canvas:transparent -fill "#786569" -draw "circle 47.5,47.5 47.5,0" moire-06light1.png
convert -size 96x96 canvas:transparent -fill "#6c5a5f" -draw "circle 47.5,47.5 47.5,0" moire-07light2.png
convert -size 96x96 canvas:transparent -fill "#86727a" -draw "circle 47.5,47.5 47.5,0" moire-08light3.png
convert -size 96x96 canvas:transparent -fill "#a5899a" -draw "circle 47.5,47.5 47.5,0" moire-09light4.png
convert -size 96x96 canvas:transparent -fill "#bfa1b5" -draw "circle 47.5,47.5 47.5,0" moire-10light5.png
convert -size 96x96 canvas:transparent -fill "#eecde4" -draw "circle 47.5,47.5 47.5,0" moire-11light6.png
convert -size 96x96 canvas:transparent -fill "#e1346d" -draw "circle 47.5,47.5 47.5,0" moire-12red.png
convert -size 96x96 canvas:transparent -fill "#cf50cc" -draw "circle 47.5,47.5 47.5,0" moire-13mauve.png
convert -size 96x96 canvas:transparent -fill "#f57ed1" -draw "circle 47.5,47.5 47.5,0" moire-14pink.png
convert -size 96x96 canvas:transparent -fill "#e88b53" -draw "circle 47.5,47.5 47.5,0" moire-15peach.png
convert -size 96x96 canvas:transparent -fill "#d59b84" -draw "circle 47.5,47.5 47.5,0" moire-16clay.png
convert -size 96x96 canvas:transparent -fill "#e6bf56" -draw "circle 47.5,47.5 47.5,0" moire-17yellow.png
convert -size 96x96 canvas:transparent -fill "#90ba56" -draw "circle 47.5,47.5 47.5,0" moire-18green.png
convert -size 96x96 canvas:transparent -fill "#60cca7" -draw "circle 47.5,47.5 47.5,0" moire-19teal.png
convert -size 96x96 canvas:transparent -fill "#a2f1f9" -draw "circle 47.5,47.5 47.5,0" moire-20denim.png
convert -size 96x96 canvas:transparent -fill "#758fc6" -draw "circle 47.5,47.5 47.5,0" moire-21royal.png
convert -size 96x96 canvas:transparent -fill "#8070fd" -draw "circle 47.5,47.5 47.5,0" moire-22blue.png
convert -size 96x96 canvas:transparent -fill "#615dbb" -draw "circle 47.5,47.5 47.5,0" moire-23indigo.png
convert -size 96x96 canvas:transparent -fill "#ab88d8" -draw "circle 47.5,47.5 47.5,0" moire-24lavender.png
convert -size 96x96 canvas:transparent -fill "#8544ac" -draw "circle 47.5,47.5 47.5,0" moire-25purple.png
convert -append moire-*.png layout.png
