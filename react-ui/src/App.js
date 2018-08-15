import React, { Component } from 'react';
import './App.css';
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
        <button onClick={this.switchHandler}>Switch Handler</button>
        <ul>
          <li>{this.state.persons[0].name} - {this.state.persons[0].age}</li>
          <li>{this.state.persons[1].name} - {this.state.persons[1].age}</li>
        </ul>
      </div>
    );
    //return React.createElement('div',{className: 'App'},React.createElement('h1',null, 'Hi I\'m a React App!!!'));
  }

  switchHandler = () => {
    this.setState({
      persons : [
        { name: 'New Maxi', age: 31 },
        { name: 'Gerhard', age: 41 }
      ]
    });
  }
}

export default App;
