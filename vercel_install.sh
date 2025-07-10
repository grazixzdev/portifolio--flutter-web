#!/bin/bash

# Baixar e preparar o Flutter
if cd flutter; then
  git pull && cd ..
else
  git clone https://github.com/flutter/flutter.git
fi

flutter/bin/flutter doctor
flutter/bin/flutter config --enable-web
flutter/bin/flutter pub get
flutter/bin/flutter build web --release --no-tree-shake-icons
