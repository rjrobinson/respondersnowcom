import React from 'react';
import IncidentCard from './IncidentCard';
import {Row, Tab, Tabs} from 'react-bootstrap';
import {CreateIncident} from "./CreateIncidentForm";

const renderIncidents = ({incidents}) => {
    return incidents.map(incident => {
        return <IncidentCard incident={incident} key={incident.id}/>;

    })
}

const IncidentList = ({data}) => (

    <Row>
        <Tabs defaultActiveKey={1} id="uncontrolled-tab-example">
                <Tab eventKey={1} title="Regional">
                    <div className="ibox-content">
                        <div className="feed-activity-list"
                             style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </div>
                    </div>
                </Tab>
                <Tab eventKey={2} title="National">

                    <div className="feed-activity-list"
                         style={{height: '75vh', overflowX: 'scroll'}}>
                        {renderIncidents(data)}
                    </div>

                </Tab>
                <Tab eventKey={3} title="Send Report">
                    <div className="ibox-content">
                        <CreateIncident/>
                    </div>
                </Tab>
        </Tabs>
    </Row>


);


export default IncidentList;