import React from "react";
import { Link } from "react-router-dom";
import {
  UncontrolledCollapse,
  NavbarBrand,
  Navbar,
  NavItem,
  NavLink,
  Nav,
  Container,
  Row,
  Col,
  UncontrolledTooltip,
  Button
} from "reactstrap";

class IndexNavbar extends React.Component {
  render() {
    return (
      <>
        <Navbar
          className="navbar-horizontal navbar-main navbar-dark bg-info"
          expand="lg"
          id="navbar-main"
        >
          <Container>
            <NavbarBrand to="/" tag={Link}>
              RespondersNOW
            </NavbarBrand>
            <button
              aria-controls="navbar-collapse"
              aria-expanded={false}
              aria-label="Toggle navigation"
              className="navbar-toggler"
              data-target="#navbar-collapse"
              data-toggle="collapse"
              id="navbar-collapse"
              type="button"
            >
              <span className="navbar-toggler-icon" />
            </button>
            <UncontrolledCollapse
              className="navbar-custom-collapse"
              navbar
              toggler="#navbar-collapse"
            >
              <div className="navbar-collapse-header">
                <Row>
                  <Col className="collapse-brand" xs="6">
                    <Link to="/admin/dashboard">
                      <img alt="..." src={require("../../assets/img/brand/blue.png")} />
                    </Link>
                  </Col>
                  <Col className="collapse-close" xs="6">
                    <button
                      aria-controls="navbar-collapse"
                      aria-expanded={false}
                      aria-label="Toggle navigation"
                      className="navbar-toggler"
                      data-target="#navbar-collapse"
                      data-toggle="collapse"
                      id="navbar-collapse"
                      type="button"
                    >
                      <span />
                      <span />
                    </button>
                  </Col>
                </Row>
              </div>
              <Nav className="mr-auto" navbar>
                <NavItem>
                  <NavLink to="/login" tag={Link}>
                    <span className="nav-link-inner--text">Login</span>
                  </NavLink>
                </NavItem>
                <NavItem>
                  <NavLink to="/register" tag={Link}>
                    <span className="nav-link-inner--text">Register</span>
                  </NavLink>
                </NavItem>
              </Nav>
              <hr className="d-lg-none" />
              <Nav className="align-items-lg-center ml-lg-auto" navbar>
                <NavItem>
                  <NavLink
                    className="nav-link-icon"
                    href="https://www.facebook.com/RespondersNow"
                    id="facebook_message"
                    target="_blank"
                  >
                    <i className="fab fa-facebook-square" />
                    <span className="nav-link-inner--text d-lg-none">
                      Facebook
                    </span>
                  </NavLink>
                  <UncontrolledTooltip delay={0} target="facebook_message">
                    Like us on Facebook
                  </UncontrolledTooltip>
                </NavItem>
                <NavItem>
                  <NavLink
                    className="nav-link-icon"
                    href="https://www.instagram.com/respondersnow"
                    id="instagram_message"
                    target="_blank"
                  >
                    <i className="fab fa-instagram" />
                    <span className="nav-link-inner--text d-lg-none">
                      Instagram
                    </span>
                  </NavLink>
                  <UncontrolledTooltip delay={0} target="instagram_message">
                    Follow us on Instagram
                  </UncontrolledTooltip>
                </NavItem>
                <NavItem>
                  <NavLink
                    className="nav-link-icon"
                    href="https://twitter.com/respondersnow"
                    id="twitter_message"
                    target="_blank"
                  >
                    <i className="fab fa-twitter-square" />
                    <span className="nav-link-inner--text d-lg-none">
                      Twitter
                    </span>
                  </NavLink>
                  <UncontrolledTooltip delay={0} target="twitter_message">
                    Follow us on Twitter
                  </UncontrolledTooltip>
                </NavItem>
                <NavItem className="d-none d-lg-block ml-lg-4">
                  <Button
                    className="btn-neutral btn-icon"
                    color="default"
                    to="/pro-features"
                  >
                    <span className="btn-inner--icon">
                      <i className="fas fa-shopping-cart mr-2" />
                    </span>
                    <span className="nav-link-inner--text">Go Pro</span>
                  </Button>
                </NavItem>
              </Nav>
            </UncontrolledCollapse>
          </Container>
        </Navbar>
      </>
    );
  }
}

export default IndexNavbar;
