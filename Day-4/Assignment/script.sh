#!/bin/bash

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 2 > cpu_report.txt