#!/usr/bin/env sh
# shellcheck disable=SC2039

runner_os="$1"

if command -v curl &> /dev/null; then
  exit 0
fi

if [ "${runner_os}" = "macOS" ]; then
  if command -v brew &> /dev/null; then
    brew install curl
  fi
fi

if [ "${runner_os}" = "Windows" ]; then
  if command -v choco &> /dev/null; then
    choco install curl
  elif command -v conda &> /dev/null; then
    conda install -c conda-forge curl
  elif command -v scoop &> /dev/null; then
    scoop bucket add main
    scoop install main/curl
  elif command -v conan &> /dev/null; then
    touch conan.txt
    {
      echo "[requires]"
      echo "libcurl/8.5.0"
      echo "[generators]"
      echo "CMakeDeps"
      echo "CMakeToolchain"
      echo "[layout]"
      echo "cmake_layout"
    } >> conan.txt
    conan install conanfile.txt --build=missing
    rm -f conan.txt
  fi
fi

if [ "${runner_os}" = "Linux" ]; then
  os=$(grep "^ID=" "/etc/os-release" | cut -d '=' -f 2 | tr -d '"')
  if [ "${os}" = "alpine" ]; then
    apk update
    apk add curl
  elif [ "${os}" = "ubuntu" ]; then
    apt update
    apt install -y curl
  elif [ "${os}" = "rocky" ]; then
    dnf update
    dnf install -y curl
  fi
fi

echo "::error title=Failed to install curl::Try to install it in a separate step"
exit 1
