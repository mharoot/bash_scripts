# This script if for creating Zend Module directories and empty files.
# How to use this script example:
#                                 
# ./createZendModule.sh Product
#

function createMessage() {
    echo "Creating $1 Module..."
    echo
}

function createDirectory() {
    cd module
    mkdir $1
    cd $1
    mkdir config
    mkdir src 
    mkdir test 
    mkdir view 
}

function createConfig() {
    cd config
    touch module.config.php
    cd ../
}

function createSrc() {
    cd src
    mkdir Model 
    mkdir Form
    mkdir Controller
    touch Module.php
    cd ../
}

function createView() {
    cd view
    
    # make the first letter a lower case by convention
    foo=$1
    foo="$(tr '[:upper:]' '[:lower:]' <<< ${foo:0:1})${foo:1}"

    mkdir $foo
    cd $foo
    mkdir $foo
    cd $foo
    touch index.phtml delete.phtml edit.phtml add.phtml
    cd ../../../
}



function main() {
    createMessage $1
    createDirectory $1
    createConfig
    createSrc
    createView $1

}
main $1
