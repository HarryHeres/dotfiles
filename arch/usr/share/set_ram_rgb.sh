#!/usr/bin/env bash

kfrgb --ramslots 2,4 --smbus $(i2cdetect -l | grep smbus | grep -oE 'i2c-[0-9]+' | grep -oE '[0-9]+$') --color 255,255,255 --brightness 25 --mode static --nowarn
