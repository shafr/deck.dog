#!/bin/bash
HOME_DIR="../."

function checkUnderscoreCount(){
    cd "${HOME_DIR}/_devices"
    for file in *.md; do 
        echo "INFO: processing file ${file}"
            
        IFS=_ read -a splits <<< "${file}"

        size=$(echo ${#splits[@]})
        echo "INFO: splits size - ${size}"

        if [[ "${size}" -ne 2 ]]; then
            echo "Please use only one '_' symbol in file name. Failed file: '${file}', number of separators: ${size}"
            exit 1
        fi
    done

    echo "OK - Underscore checks"
}

function checkEachDeviceHasImage(){
    cd "${HOME_DIR}/_devices"
    for file in *.md; do 
        echo "INFO: processing file ${file}"
            
        IFS=. read -a splits <<< "${file}"

        size=$(echo ${#splits[@]})
        echo "INFO: splits size - ${size}"

        IMAGE_NAME="${HOME_DIR}/assets/devices/${splits[0]}.png"

        if [ ! -f "${IMAGE_NAME}" ]; then
            echo "ERROR: missing image. Please add image called ${splits[0]}.png in 'assets/devices' directory"
            exit 1
        fi
    done

    echo "OK - Image match checks"
}