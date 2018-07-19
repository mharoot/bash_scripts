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

    # create module.config.php
    echo "<?php" >> module.config.php
    echo "namespace $1;" >> module.config.php
    echo >> module.config.php
    echo "use Zend\ServiceManager\Factory\InvokableFactory;" >> module.config.php
    echo >> module.config.php
    echo "return [ " >> module.config.php
    echo "    'controllers' => [" >> module.config.php 
    echo "    'factories' => [" >> module.config.php
    printf "            Controller\%sController::class => InvokableFactory::class, \n" $1 >> module.config.php
    echo "        ]," >> module.config.php
    echo "    ]," >> module.config.php
    echo "    'view_manager' => [" >> module.config.php
    echo "        'template_path_stack' => [ " >> module.config.php
    echo "            'album' => __DIR__ . '/../view'," >> module.config.php
    echo " 		]," >> module.config.php
    echo "    ]," >> module.config.php
    echo "];" >> module.config.php
    cd ../
}

function createSrc() {
    cd src
    mkdir Model 
    mkdir Form
    mkdir Controller
    touch Module.php

    # create module
    echo "<?php" >> Module.php
    echo "namespace $1;" >> Module.php
    echo >> Module.php
    echo "use Zend\ModuleManager\Feature\ConfigProviderInterface;" >> Module.php
    echo >> Module.php
    echo "class Module implements ConfigProviderInterface" >> Module.php
    echo "{" >> Module.php
    echo "    public function getConfig()" >> Module.php
    echo "    {" >> Module.php
    echo "        return include __DIR__ . '/../config/module.config.php';" >> Module.php
    echo "    }" >> Module.php
    echo "}" >> Module.php

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

function nextStep() {
    echo "Open \"composer.json\" in your project root, and find the following section:"
    echo 
    echo "\"autoload\": {"
    echo "       \"psr-4\": {" 
    echo "            \"Application\\\\\": \"module/Application/src/\","
    echo "            \"$1\\\\\": \"module/$1/src/\"   // Add the following line"
    echo "         }"
    echo
    printf "Open module/%s/config/modules.config.php \n 
            return [ 
                'Zend\Form', 
                'Zend\Db', 
                'Zend\Router', 
                'Zend\Validator', 
                'Application', 
                '$1', // <-- Add this line 
            ];\n\n" ${DIR} $1
    echo "Once you've made that change, run the following to ensure Composer updates its autoloading rules:"
    echo "$ composer dump-autoload"
    echo
}

function main() {
    createMessage $1
    createDirectory $1
    createConfig $1
    createSrc $1
    createView $1
    nextStep $1

}
main $1
