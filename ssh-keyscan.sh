#!/bin/bash
ssh-keyscan -H -f servers -t ed25519,`dig +short -f servers` >> ~/.ssh/known_hosts
ssh-keyscan -H -f servers -t ecdsa,`dig +short -f servers` >> ~/.ssh/known_hosts
