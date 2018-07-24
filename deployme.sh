#!/bin/bash
# Build the Sencha App and deploy it to the public directory then run the server.
# //TODO: This has to be modified as ExtJs UI is completely removed
echo "################################################";
echo "#                                              #";
echo "#  React - Rails Management Tool v0.2          #";
echo "#        from react-ui/ to /public             #";
echo "#                                              #";
echo "#  What would you like to build today?         #";
echo "#                                              #";
echo "#      1) Rails+React (not working)            #";
echo "#                                              #";
echo "#      2) Run Node Server only                 #";
echo "#                                              #";
echo "################################################";
echo "                                                ";
select yn in "1" "2"; do
    case $yn in
        1)
            cd react-ui/
            cd ..
            echo "This functionality is not working yet.";
            #cp -rf extjs-ui/build/production/DharmaCloud/* public/
            echo "Rails taking the stage...";
            rails s
            break;;
        2)
            echo "React is taking the stage";
            cd react-ui/
            npm start
            cd ..
            break;;
    esac
done
