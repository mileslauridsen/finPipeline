### Homebrew installs

# Compilers and Core requirements
brew install -v cmake
brew install -v gcc
brew install -v tbb
brew install -v glib
brew install -v bash

# Security

# Utilities
brew install -v curl
brew install -v git
brew install -v wget
brew install -v macvim
brew install -v colordiff
brew install -v coreutils
brew install -v unrar
brew install -v htop
brew install -v nmap
brew install -v ncdu
brew install -v youtube-dl

# Database

# Development
brew install -v qt --with-docs --with-mysql
brew install -v scons
brew install -v boost --with-mpi --with-python --without-single
brew install -v doxygen
brew install -v jsonpp
brew install -v libyaml
brew install -v fltk
brew install -v gdk-pixbuf
brew install -v pixman
brew install -v harfbuzz
brew install -v fontconfig
brew install -v pango
brew install -v sphinx

# Languages
brew install -v python
brew install -v pyqt
brew install -v pyside

# Sys-Admin and Security tools

# Homebrew science
brew tap homebrew/science
brew install -v hdf5
# oiio expects libhdf5.9.dylib. This appears to fix the issue
if [ ! -f /usr/local/lib/libhdf5.9.dylib ];
then
    ln -s /usr/local/lib/libhdf5.10.dylib /usr/local/lib/libhdf5.9.dylib
fi
brew install -v alembic

# Imaging
brew install -v ilmbase
brew install -v openexr
brew install -v opencolorio --with-docs --with-python
brew install -v openimageio # --with-qt and --with-tests currently fail
brew install -v openvdb

# FFmpeg 3.2.2
brew install -v ffmpeg --with-chromaprint --with-fdk-aac --with-fontconfig --with-freetype --with-frei0r --with-libass --with-libbluray --with-libbs2b --with-libcaca --with-libebur128 --with-libgsm --with-libssh --with-libvidstab --with-libvpx --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-sdl2 --with-schroedinger --with-rubberband --with-rtmpdump --with-opus --with-snappy --with-speex --with-tesseract --with-tools --with-theora --with-two-lame --with-wavpack --with-webp --with-x265 --with-xz

# Imagemagick
brew install -v imagemagick --enable-hdri --with-fftw --with-fontconfig --with-jp2 --with-libtiff --with-little-cms --with-liblqr --with-librsvg --with-little-cms2 --with-openexr --with-webp --with-perl --with-quantum-depth-32 --with-x11

# Image processing

# Link apps such as Python and QT Designer
brew linkapps
