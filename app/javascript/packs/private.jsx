import React from 'react';
import ReactDOM from 'react-dom'
import {
  BrowserRouter as Router,
  Switch,
  Route
} from 'react-router-dom';

import DashboardPage from "../src/pages/private/DashboardPage";

ReactDOM.render(
  (<Router>
    <Switch>
      <Route exact path='/u/dashboard' component={DashboardPage} />
    </Switch>
  </Router>), document.querySelector('#root')
);
