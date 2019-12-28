import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

// Assets
import "../src/argon/assets/scss/argon-dashboard-pro-react.scss";
import "../src/argon/assets/vendor/nucleo/css/nucleo.css";
import "../src/argon/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css";

// Pages
import IndexPage from "../src/pages/public/IndexPage";
import LoginPage from "../src/pages/public/LoginPage";

ReactDOM.render(
  (<Router>
    <Switch>
      <Route exact path='/' component={IndexPage} />
      <Route exact path='/login' component={LoginPage} />
    </Switch>
  </Router>), document.querySelector('#root')
);
