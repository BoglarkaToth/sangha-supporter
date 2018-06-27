#!/bin/bash
# Build the Sencha App and deploy it to the public directory then run the server.
# //TODO: This has to be modified as ExtJs UI is completely removed
echo "################################################";
echo "#                                              #";
echo "#  Sencha ExtJs - Rails Management Tool v0.2   #";
echo "#        from extjs-ui/ to /public             #";
echo "#                                              #";
echo "#  What would you like to build today?         #";
echo "#                                              #";
echo "#      1) Rails+Sencha                         #";
echo "#                                              #";
echo "#      2) Run Sencha Watch only                #";
echo "#                                              #";
echo "################################################";
echo "                                                ";
select yn in "1" "2"; do
    case $yn in
        1)
            cd extjs-ui/
            sencha-6.2.1.29 app build
            cd ..
            echo "Move to the public folder.";
            cp -rf extjs-ui/build/production/DharmaCloud/* public/
            echo "Rails taking the stage...";
            rails s
            break;;
        2)
            echo "ExtJs is taking the stage";
            cd extjs-ui/
            sencha-6.2.1.29 app watch
            cd ..
            break;;
    esac
done
