#!/bin/bash

if [[ $USER == DAM1 ]]
then
        echo "Hola, DAM1"
else
        echo "No eres DAM1, eres ${USER}."
fi
