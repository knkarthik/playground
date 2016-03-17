#!/bin/bash
fn=$(find /tmp -type f -cmin -1 | tail -1)
evince "$fn"
mv "$fn" ~/Downloads

