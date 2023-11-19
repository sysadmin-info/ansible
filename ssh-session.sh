#!/bin/bash
for i in $(cat servers); do ssh -o StrictHostKeyChecking=no ansible@$i "exit"; done
