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


const fontTitle = (icon, title) => (<span><i className={icon}></i>  {title}</span>)

const IncidentList = ({data}) => (

    <Row>
        <IBox>
            <Tabs defaultActiveKey={1} id="tabs">
                <Tab eventKey={1} title={fontTitle("fas fa-map-marked-alt", "Regional")}>
                    <IBoxContent>
                        <ActivityFeed
                            style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </ActivityFeed>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={2} title={fontTitle("fas fa-globe-americas", "National")}>
                    <IBoxContent>
                        <ActivityFeed
                            style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </ActivityFeed>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={3} title={fontTitle("fas fa-edit", "Send Report")}>
                    <IBoxContent>
                        <CreateIncident/>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={4} title={fontTitle("fas fa-cogs", "Settings")}>
                    <IBoxContent>
                        <CreateIncident/>
                    </IBoxContent>
                </Tab>

            </Tabs>
        </IBox>
    </Row>


);


export default IncidentList;