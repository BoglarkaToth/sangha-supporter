# Dharmacloud

Dharmacloud is management application to manage various activities in the Diamond Way Buddhist centers. It is an experimental project built for fun and learning with the intention that after all it will be useful to manage administration and activities transparently in the buddhist centers. 

## Dependencies

* The application uses Ruby 2.4 and Rails 5.0.1

* The application UI used formerly ExtJs 6.0 with Sencha Cmd 6.1.2.15 which is being replaced with React and Redux

## Configuration
Make sure that /config/oauth.yml exist as it is necessary for the SSO login.
The correct formatting of oauth.yml can be found in /config/initializers/load_oauth_config.rb

### Deployment instructions
Use the deployment script deployme.sh located in the main folder. After finishing deployment you will be located in the api_dharmacloud folder where you can lunch the server by *rails s*

## Release notes

#### Version 0.1.0
* Basic user management (with DWB SSO)
* Payment CRUD operations
* TV Content
* Main navigation 

#### Version 0.0.1R

The UI development has changed to React instead of ExtJs so we moved back from 0.1.0 to 0.0.1R as everything has to be reimplemented on the client side. The server side is in working condition and will not be touched. 

___

### Useful resources and links
* create-react-app: https://github.com/facebookincubator/create-react-app
* Introducing JSX: https://reactjs.org/docs/introducing-jsx.html
* Rendering Elements: https://reactjs.org/docs/rendering-elements.html
* Components & Props: https://reactjs.org/docs/components-and-props.html
* Listenable Events: https://reactjs.org/docs/events.html
