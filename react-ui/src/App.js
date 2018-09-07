import React, { Component } from 'react';
import './App.css';
import './dwb.css'
import TopNavigation from './components/navigation/TopNavigation';

class App extends Component {
  state = {
    persons : [
      { name: 'Max', age: 28},
      { name: 'Maximilian', age: 30}
    ]
  }
  render() {
    return (
      <div className="App">
        <TopNavigation />
        <p>Hi I'm a React App!</p>
        <button onClick={this.switchHandler.bind(this, 'Max')}>Switch Handler</button>
        <ul>
          <li onClick={this.switchHandler.bind(this, 'Joe')} >{this.state.persons[0].name} - {this.state.persons[0].age}</li>
          <li onClick={this.switchHandler.bind(this, 'Joe')} >{this.state.persons[1].name} - {this.state.persons[1].age}</li>
        </ul>
      </div>
    );
    //return React.createElement('div',{className: 'App'},React.createElement('h1',null, 'Hi I\'m a React App!!!'));
  }

  switchHandler = (newName) => {
    this.setState({
      persons : [
        { name: newName, age: 31 },
        { name: 'Gerhard', age: 41 }
      ]
    });
  }
}

export default App;
