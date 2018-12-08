import React, {Component} from 'react';
import GoogleMapReact from 'google-map-react'
import IncidentList from './IncidentList'

import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'
import {faFire} from '@fortawesome/free-solid-svg-icons'

const AnyReactComponent = ({text}) => (
    <div><FontAwesomeIcon icon={faFire} size="lg" color="red"/>{text}</div>
)

class RegionalMap extends Component {

    constructor(props) {
        super(props)

        this.state = {
            center: {
                lat: 40.4670342,
                lng: -74.4662781
            },
            zoom: 15,
            activeTab: '1'
        }
    }

    toggle(tab) {
        if (this.state.activeTab !== tab) {
            this.setState({
                activeTab: tab
            });
        }
    }

    static defaultProps = {
        center: {
            lat: 40.4670342,
            lng: -74.4662781
        },
        zoom: 15
    };

    render() {
        return (
            <div>
                <div className="col-lg-4">
                    <div className="tabs-container">

                        <div>
                            <ul className="nav nav-tabs">
                                <li className="active"><a data-toggle="tab" href="#regional">Regional</a></li>
                                <li className=""><a data-toggle="tab" href="#national">National</a></li>
                            </ul>
                            <div className="tab-content ">
                                <div id="regional" className="tab-pane active">
                                    <div className="panel-body">
                                        <div className="ibox-content">
                                            <div className="feed-activity-list"
                                                 style={{height: '75vh', overflowX: 'scroll'}}>
                                                <IncidentList/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-lg-8">
                    <br/><br/>
                    <div style={{height: '75vh', width: '100%'}}>
                        <GoogleMapReact
                            bootstrapURLKeys={{key: 'AIzaSyB1ZUug1hdyRxGcoGoQoAOVJjnqkWGBQ-I'}}
                            defaultCenter={this.props.center}
                            defaultZoom={this.props.zoom}
                        >
                            <AnyReactComponent
                                lat={40.4671416}
                                lng={-74.4664551}
                                text={"RJ's House"}

                            />
                        </GoogleMapReact>
                    </div>
                </div>
            </div>
        );
    }
}

export default RegionalMap;
