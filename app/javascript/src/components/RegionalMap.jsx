import React, {Component} from 'react';
import './../style/style.css'

import IncidentList from './Incidents/IncidentList';
import IncidentMap from './Incidents/IncidentMap';
import CreateIncident from './Incidents/CreateIncidentForm'
import FormModal from './UIComponents/FormModal'

import {GET_INCIDENTS} from "../queries";
import Spinner from "react-spinkit";
import {Query} from "react-apollo";


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
                            <div className={"row"}>
                                <div className={"row"}>
                                    <div className="col-lg-12">
                                        <FormModal popoverText="Hello World" toolTip="Yes" buttonText="Send Report">
                                            <CreateIncident/>
                                        </FormModal>
                                    </div>
                                </div>
                                <div className={"row"}>
                                    <div className="col-lg-4">
                                        <IncidentList data={data}/>
                                    </div>
                                    <div className="col-lg-8">
                                        <IncidentMap data={data}/>
                                    </div>
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
