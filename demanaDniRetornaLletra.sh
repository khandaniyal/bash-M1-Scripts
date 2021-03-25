#!/bin/bash

letras=(T R W A G M Y F P D X B N J Z S Q V H L C K E)

echo "Tu DNI sin la letra:"
read dni

resto=$((dni%23))
echo "Tu DNI con letra es: $dni-${letras[$resto]}"
