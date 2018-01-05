OS=`uname | tr '[A-Z]' '[a-z]'`

if [ "darwin" = "$OS" ]; then 
    export ARCHFLAGS='-arch i386 -arch x86_64'
fi
