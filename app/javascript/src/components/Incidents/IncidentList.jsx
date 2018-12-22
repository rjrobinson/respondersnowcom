import React from 'react';
import IncidentCard from './IncidentCard';
import {Row, Tab, Tabs} from 'react-bootstrap';
import {CreateIncident} from "./CreateIncidentForm";
import {IBox, IBoxContent} from "../UIComponents/Ibox/Ibox";
import {ActivityFeed} from "../UIComponents/ActivityFeedComponent";

const renderIncidents = ({incidents}) => {
    return incidents.map(incident => {
        return <IncidentCard incident={incident} key={incident.id}/>;

    })
}

const IncidentList = ({data}) => (

    <Row>
        <IBox>
            <Tabs defaultActiveKey={1} id="uncontrolled-tab-example">
                <Tab eventKey={1} title="Regional">
                    <IBoxContent>
                        <ActivityFeed
                            style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </ActivityFeed>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={2} title="National">
                    <IBoxContent>
                        <ActivityFeed
                            style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </ActivityFeed>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={3} title="Send Report">
                    <IBoxContent>
                        <CreateIncident/>
                    </IBoxContent>
                </Tab>

            </Tabs>
        </IBox>
    </Row>


);


export default IncidentList;