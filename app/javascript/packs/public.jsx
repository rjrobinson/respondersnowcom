import React from 'react';
import ReactDOM from 'react-dom'
import {
  BrowserRouter as Router,
  Switch,
  Route
} from 'react-router-dom';

import LandingPage from "../src/components/public/pages/LandingPage";

ReactDOM.render(
  (<Router>
    <Switch>
      <Route exact path='/' component={LandingPage} />
    </Switch>
  </Router>), document.querySelector('#public')
);
