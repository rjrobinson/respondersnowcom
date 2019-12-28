import React, { Component } from 'react';

class Base extends Component {
  render() {
    return (
      <div>
        { this.props.children }
      </div>
    );
  }
}

export default Base;
