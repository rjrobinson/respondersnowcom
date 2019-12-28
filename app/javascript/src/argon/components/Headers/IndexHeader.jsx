import React from "react";
import { Link } from "react-router-dom";
import { Button, Card, CardBody, Container, Row, Col } from "reactstrap";

class IndexHeader extends React.Component {
  render() {
    return (
      <>
        <div className="header bg-info pt-5 pb-7">
          <Container>
            <div className="header-body">
              <Row className="align-items-center">
                <Col lg="6">
                  <div className="pr-5">
                    <h1 className="display-2 text-white font-weight-bold mb-0">
                      First Responder Tools
                    </h1>
                    <h2 className="display-4 text-white font-weight-light">
                      Designed to help you excel in your career.
                    </h2>
                    <p className="text-white mt-4">
                      We wanted tools to help develop our own careers. So, we built them.
                    </p>
                    <div className="mt-5">
                      <Button
                        className="btn-neutral my-2"
                        color="default"
                        to="/admin/dashboard"
                        tag={Link}
                      >
                        Join for Free
                      </Button>
                      <Button
                        className="my-2"
                        color="default"
                        href="https://www.creative-tim.com/product/argon-dashboard-pro-react?ref=adpr-auth-navbar"
                      >
                        Go Pro
                      </Button>
                    </div>
                  </div>
                </Col>
                <Col lg="6">
                  <Row className="pt-5">
                    <Col md="6">
                      <Card>
                        <CardBody>
                          <div className="icon icon-shape bg-gradient-red text-white rounded-circle shadow mb-4">
                            <i className="fas fa-cloud"></i>
                          </div>
                          <h5 className="h3">Secure Storage</h5>
                          <p>
                            Store your Certs in the cloud.
                          </p>
                        </CardBody>
                      </Card>
                      <Card>
                        <CardBody>
                          <div className="icon icon-shape bg-gradient-info text-white rounded-circle shadow mb-4">
                            <i className="fas fa-user-md"></i>
                          </div>
                          <h5 className="h3">Job Listings</h5>
                          <p>
                            See what is available in your area.
                          </p>
                        </CardBody>
                      </Card>
                    </Col>
                    <Col className="pt-lg-5 pt-4" md="6">
                      <Card className="mb-4">
                        <CardBody>
                          <div className="icon icon-shape bg-gradient-success text-white rounded-circle shadow mb-4">
                            <i className="fas fa-graduation-cap"></i>
                          </div>
                          <h5 className="h3">Classes</h5>
                          <p>
                            Let us do the hard work finding CEUs.
                          </p>
                        </CardBody>
                      </Card>
                    </Col>
                  </Row>
                </Col>
              </Row>
            </div>
          </Container>
          <div className="separator separator-bottom separator-skew zindex-100">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              preserveAspectRatio="none"
              version="1.1"
              viewBox="0 0 2560 100"
              x="0"
              y="0"
            >
              <polygon
                className="fill-default"
                points="2560 0 2560 100 0 100"
              />
            </svg>
          </div>
        </div>
      </>
    );
  }
}

export default IndexHeader;
