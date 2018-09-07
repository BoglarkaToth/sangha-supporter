import React, { Component } from 'react';

class TopNavigation extends Component {

    state = {
        menuItems : [
             {title: 'Home', link: '#'},
             {title: 'Users', link: '/users'},
             {title: 'Payments', link: '/payments'}
        ]
    }
    render() {
        let items = '';
        this.state.menuItems.forEach(element => {
            items += '<li><a href="{element.link}">{element.title}</a></li>';
        })
        return (
            <div>
                <h1>Logo</h1>
                <ul>
                    {items}
                </ul>
            </div>
        );
    };
}
export default TopNavigation;