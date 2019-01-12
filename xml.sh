#!/usr/bin/env bash

XML_FILE='mountain_huts.xml'
DTD_FILE='mountain_huts.dtd'

case $1 in
    -x|--validate-xml)
        xmllint --noout $XML_FILE && echo "$XML_FILE is valid"
        ;;
    -d|--validate-with-dtd)
        xmllint --noout $XML_FILE --dtdvalid $DTD_FILE && echo "$XML_FILE is valid against $DTD_FILE"
        ;;
    *)
        echo "Usage: $0 options"
        echo "    -x, --validate-xml : Validate xml file"
        echo "    -d, --validate-with-dtd : Validate xml file using dtd"
        ;;
esac
