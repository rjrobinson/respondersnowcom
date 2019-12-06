import React, { Component } from 'react'
import './../style/style.css'

import { GET_CERTIFICATIONS } from '../queries'
import Spinner from 'react-spinkit'
import { Query } from 'react-apollo'
import { Col, Row } from 'react-bootstrap'

const pollIntervalTime = 10000

class CertificationsApp extends Component {

  render () {
    return (
      <Query
        query={GET_CERTIFICATIONS}
        pollInterval={pollIntervalTime}>
        {
          ({ loading, error, data }) => {
            if (loading) return <Spinner name="line-scale-pulse-out-rapid"
                                         color="coral"/>
            if (error) return `Error! ${error.message}`

            return (
              <Row>
                <Col lg={5} md={5} className="tabs-container">

                </Col>
                <Col lg={7} md={5}>
                </Col>
              </Row>
            )
          }
        }
      </Query>
    )
  }
}

export default CertificationsApp