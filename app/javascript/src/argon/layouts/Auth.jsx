import React from "react";
import { Route, Switch } from "react-router-dom";
import AuthNavbar from "../../argon/components/Navbars/AuthNavbar.jsx";
import AuthFooter from "../../argon/components/Footers/AuthFooter.jsx";

import routes from "../../routes";

class Auth extends React.Component {
  componentDidMount() {
    document.body.classList.add("bg-default");
  }
  componentWillUnmount() {
    document.body.classList.remove("bg-default");
  }
  componentDidUpdate(e) {
    if (e.history.pathname !== e.location.pathname) {
      document.documentElement.scrollTop = 0;
      document.scrollingElement.scrollTop = 0;
      this.refs.mainContent.scrollTop = 0;
    }
  }
  getRoutes = routes => {
    return routes.map((prop, key) => {``
      if (prop.collapse) {
        return this.getRoutes(prop.views);
      }
      if (prop.layout === "/auth") {
        return (
          <Route
            path={prop.layout + prop.path}
            component={prop.component}
            key={key}
          />
        );
      } else {
        return null;
      }
    });
  };
  render() {
    return (
      <>
        <div className="main-content" ref="mainContent">
          <AuthNavbar />
          <Switch>{this.getRoutes(routes)}</Switch>
        </div>
        <AuthFooter />
      </>
    );
  }
}

export default Auth;
