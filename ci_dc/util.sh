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

        IMAGE_NAME="${HOME_DIR}/assets/devices/${splits[0]}.webp"

        if [ ! -f "${IMAGE_NAME}" ]; then
            echo "ERROR: missing image. Please add image called ${splits[0]}.webp in 'assets/devices' directory"
            exit 1
        fi

        FILE_TYPE=$(file ${IMAGE_NAME})
        if [[ ${FILE_TYPE} != *"Web/P image"* ]]; then
            echo "ERROR: file ${IMAGE_NAME} is not image, actual type is:"
            echo "${FILE_TYPE}"
            exit 1
        fi
    done

    echo "OK - Image match checks"
}

function checkNameIsLowercase(){
    cd "${HOME_DIR}/_devices"
    for file in *.md; do 
        pattern="[a-z0-9\-\_\.]+"
        if [[ ! $file =~ $pattern ]]; then 
            echo "ERROR: file ${file} is not correct - please check correct format in readme "
            exit 1
        fi
    done

    echo "OK - File format check"
}