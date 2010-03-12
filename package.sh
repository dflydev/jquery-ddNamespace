#!/bin/sh

VERSION=0.1
BUILD_ROOT=build
DIST_NAME=jquery-ddNamespace-$VERSION
DIST_ROOT=$BUILD_ROOT/$DIST_NAME

rm -rf $DIST_ROOT
mkdir -p $DIST_ROOT

./prepareFiles $DIST_ROOT $VERSION jquery-ddNamespace .js
./prepareFiles $DIST_ROOT $VERSION dflydev-namespace .js

cat \
    $DIST_ROOT/dflydev-namespace-$VERSION.js \
    $DIST_ROOT/jquery-ddNamespace-$VERSION.js \
    > $DIST_ROOT/jquery-ddNamespace-full-$VERSION.js

$MINIFY \
    $DIST_ROOT/dflydev-namespace-$VERSION.js \
    -o $DIST_ROOT/dflydev-namespace-$VERSION.min.js.tmp

cat \
    $DIST_ROOT/dflydev-namespace-header.js \
    $DIST_ROOT/dflydev-namespace-$VERSION.min.js.tmp \
    > $DIST_ROOT/dflydev-namespace-$VERSION.min.js
rm $DIST_ROOT/dflydev-namespace-$VERSION.min.js.tmp


$MINIFY \
    $DIST_ROOT/jquery-ddNamespace-$VERSION.js \
    -o $DIST_ROOT/jquery-ddNamespace-$VERSION.min.js.tmp

cat \
    $DIST_ROOT/jquery-ddNamespace-header.js \
    $DIST_ROOT/jquery-ddNamespace-$VERSION.min.js.tmp \
    > $DIST_ROOT/jquery-ddNamespace-$VERSION.min.js
rm $DIST_ROOT/jquery-ddNamespace-$VERSION.min.js.tmp

$MINIFY \
    $DIST_ROOT/jquery-ddNamespace-full-$VERSION.js \
    -o $DIST_ROOT/jquery-ddNamespace-full-$VERSION.min.js.tmp

cat \
    $DIST_ROOT/jquery-ddNamespace-header.js \
    $DIST_ROOT/jquery-ddNamespace-full-$VERSION.min.js.tmp \
    > $DIST_ROOT/jquery-ddNamespace-full-$VERSION.min.js
rm $DIST_ROOT/jquery-ddNamespace-full-$VERSION.min.js.tmp

rm $DIST_ROOT/*-header.js
rm $DIST_ROOT/*-code.js
chdir $BUILD_ROOT
tar czvf $DIST_NAME.tgz $DIST_NAME
zip -r $DIST_NAME.zip $DIST_NAME
