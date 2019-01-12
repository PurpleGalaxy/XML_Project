#!/usr/bin/env bash

XML_FILE='mountain_huts.xml'
DTD_FILE='mountain_huts.dtd'
XSL_FILE='mountain_huts.xsl'
PDF_FILE='mountain_huts.pdf'
FOP_CONFIG='config.xconf'

case $1 in
    -x|--validate-xml)
        xmllint --noout $XML_FILE && echo "$XML_FILE is valid"
        ;;
    -d|--validate-with-dtd)
        xmllint --noout $XML_FILE --dtdvalid $DTD_FILE && echo "$XML_FILE is valid against $DTD_FILE"
        ;;
    -p|--generate-pdf)
        fop -xml $XML_FILE -xsl $XSL_FILE -pdf $PDF_FILE -c $FOP_CONFIG 2>/dev/null && echo "$PDF_FILE was generated"
        ;;
    *)
        echo "Usage: $0 options"
        echo "    -x, --validate-xml : Validate xml file"
        echo "    -d, --validate-with-dtd : Validate xml file using dtd"
        ;;
esac
