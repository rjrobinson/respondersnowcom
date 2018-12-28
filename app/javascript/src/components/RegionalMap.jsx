import React, {Component} from 'react';
import './../style/style.css';

import IncidentList from './Incidents/IncidentList';
import IncidentMap from './Incidents/IncidentMap';

import {GET_INCIDENTS} from "../queries";
import Spinner from "react-spinkit";
import {Query} from "react-apollo";
import {Col, Row} from 'react-bootstrap';

const pollIntervalTime = 10000;

class RegionalMap extends Component {

    render() {
        return (
            <Query
                query={GET_INCIDENTS}
                pollInterval={pollIntervalTime}>
                {
                    ({loading, error, data}) => {
                        if (loading) return <Spinner name="line-scale-pulse-out-rapid" color="coral"/>;
                        if (error) return `Error! ${error.message}`;
                        return (
                            <Row>
                                <Col lg={5} md={5} className="tabs-container">
                                    <IncidentList data={data}/>
                                </Col>
                                <Col lg={7} md={5}>
                                    <IncidentMap data={data}/>
                                </Col>
                            </Row>
                        );
                    }
                }
            </Query>
        );
    }
}

export default RegionalMap;