import React, {Component} from 'react';

import IncidentList from './IncidentList';
import IncidentMap from './IncidentMap';
import {GET_INCIDENTS} from "../queries";
import Spinner from "react-spinkit";
import {Query} from "react-apollo";


const pollIntervalTime = 1000;


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
                            <div>
                                <div className="col-lg-4">
                                    <IncidentList data={data}/>
                                </div>
                                <div className="col-lg-8">
                                    <IncidentMap data={data}/>
                                </div>
                            </div>
                        );
                    }
                }
            </Query>
        );
    }
}

export default RegionalMap;
