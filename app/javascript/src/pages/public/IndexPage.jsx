import React, { Component } from "react";
import { Container, Row, Col } from "reactstrap";

// Components
import IndexNavbar from "../../argon/components/Navbars/IndexNavbar";
import IndexHeader from "../../argon/components/Headers/IndexHeader";
import AuthFooter from "../../argon/components/Footers/AuthFooter";

class Index extends Component {
  render() {
    return (
      <>
        <IndexNavbar/>
        <div className="main-content">
          <IndexHeader/>
          <section className="py-6 pb-9 bg-default">
            <Container fluid>
              <Row className="justify-content-center text-center">
                <Col md="6">
                  <h2 className="display-3 text-white">
                    A complete First Responders Solution
                  </h2>
                  <p className="lead text-white">
                    Were building tools that will propel your career forward!
                    Powered by a team of software engineers and first responders, we are dedicated to building what you
                    need!
                  </p>
                </Col>
              </Row>
            </Container>
          </section>
        </div>
        <AuthFooter/>
      </>
    );
  }
}





export default Index;
