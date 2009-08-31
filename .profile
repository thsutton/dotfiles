
OS=`uname | tr '[A-Z]' '[a-z]'`

if [ "darwin" = "$OS" ]; then 
    export ARCHFLAGS='-arch ppc -arch ppc64 -arch i386 -arch x86_64'
fi

if [ -d "/opt/local/bin" ]; then
    export PATH="/opt/local/bin:$PATH"
fi
