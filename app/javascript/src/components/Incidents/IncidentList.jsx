import React from 'react'
import IncidentCard from './IncidentCard'


const renderIncidents = ({incidents}) => {
    return incidents.map(incident => {
        return <IncidentCard incident={incident} key={incident.id}/>;

    })
}

const IncidentList = ({data}) => (
    <div>
        <div className="tabs-container">
            <div>
                <ul className="nav nav-tabs">
                    <li className="active"><a data-toggle="tab" href="#regional">Regional</a></li>
                    <li><a data-toggle="tab" href="#national">National</a></li>
                </ul>
                <div className="tab-content right-shrink">
                    <div id="regional" className="tab-pane active">
                        <div className="panel-body right-shrink">
                            <div className="ibox-content right-shrink">
                                <div className="feed-activity-list"
                                     style={{height: '75vh', overflowX: 'scroll'}}>
                                    {renderIncidents(data)}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

);


export default IncidentList;
