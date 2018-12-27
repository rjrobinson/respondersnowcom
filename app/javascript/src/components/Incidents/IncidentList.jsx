import React, {Component} from 'react';
import IncidentCard from './IncidentCard';
import {Tab, Tabs} from 'react-bootstrap';
import {CreateIncident} from "./CreateIncidentForm";
import {IBoxContent} from "../UIComponents/Ibox/Ibox";
import {ActivityFeed} from "../UIComponents/ActivityFeedComponent";

const renderIncidents = ({incidents}) => {
    return incidents.map(incident => {
        return <IncidentCard incident={incident} key={incident.id}/>;
    })
}

const fontTitle = (icon, title) => (<span><i className={icon}></i> {title}</span>)

class IncidentList extends Component {
    state = {key: 1};

    handleSelect = (key) => this.setState({key});

    render() {

        const {data} = this.props

        return (
            <Tabs
                activeKey={this.state.key}
                onSelect={this.handleSelect}
                defaultActiveKey={1} id="tabs" bsStyle={"tabs"}>

                <Tab eventKey={1} title={fontTitle("fas fa-map-marked-alt", "Regional")}>

                    <ActivityFeed
                        style={{height: '75vh', overflowX: 'scroll'}}>

                        <IBoxContent>
                            {renderIncidents(data)}
                        </IBoxContent>
                    </ActivityFeed>

                </Tab>
                <Tab eventKey={2} title={fontTitle("fas fa-globe-americas", "National")}>
                    <IBoxContent>
                        <ActivityFeed
                            style={{height: '75vh', overflowX: 'scroll'}}>
                            {renderIncidents(data)}
                        </ActivityFeed>
                    </IBoxContent>
                </Tab>                
                <Tab eventKey={3} title={fontTitle("far fa-hospital", "Hospital Status")}>
                    <IBoxContent>
                        <div>You have no Hospitals Selected. Please add some in Settings -> </div>
                    </IBoxContent>
                </Tab>
                <Tab eventKey={4} title={fontTitle("fas fa-edit", "Send Report")}>
                    <IBoxContent>
                        <CreateIncident handleTabChange={this.handleSelect}/>
                    </IBoxContent>
                </Tab>        
                <Tab eventKey={5} title={fontTitle("fas fa-cogs", "Settings")}>
                    <IBoxContent>
                        <div>Fill me in.</div>
                    </IBoxContent>
                </Tab>
            </Tabs>
        );
    }
}


export default IncidentList;