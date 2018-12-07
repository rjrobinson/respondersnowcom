import React, {Component} from 'react';
import {GoogleMapReact} from 'google-map-react'

import IncidentList from './IncidentList'

const AnyReactComponent = ({text}) => <div>{text}</div>;

class RegionalMap extends Component {

    constructor(props) {
        super(props)

        this.state = {
            center: {
                lat: 40.4670342,
                lng: -74.4662781
            },
            zoom: 15
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

                        <div className="">
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
                </div>
            </div>
        )
            ;
    }
}

export default RegionalMap;
