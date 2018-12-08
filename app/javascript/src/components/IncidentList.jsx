import React from 'react'
import {Query} from "react-apollo";
import {GET_INCIDENTS} from "../queries";
import IncidentCard from './IncidentCard'
import Spinner from './Spinner'


const renderIncidents = ({incidents}) => {
    return incidents.map(incident => {
        return <IncidentCard incident={incident} key={incident.id}/>;

    })
}

const pollIntervalTime = 5000

const IncidentList = () => (
    <Query
        query={GET_INCIDENTS}
        pollInterval={pollIntervalTime}>
        {
            ({loading, error, data}) => {
                if (loading) return <Spinner/>;
                if (error) return `Error! ${error.message}`;

                console.log(data)

                return (
                    <div>
                        {renderIncidents(data)}
                    </div>
                );
            }
        }
    </Query>
);


export default IncidentList
