import React, {Component} from 'react';
import ReactDOM from 'react-dom'

import GoogleMapReact from "google-map-react";

const AnyReactComponent = ({text}) => <div>{text}</div>;

class RegionalMap extends Component {
    static defaultProps = {
        center: {
            lat: 40.4670342,
            lng: -74.4662781
        },
        zoom: 15
    };

    render() {
        return (
            <div className="row">
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
                                            <div className="feed-activity-list" style={{height: '75vh'}}>

                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right text-navy">1m ago</small>
                                                        <strong>
                                                            <i className="fas fa-fire" style={{color: "red"}}></i> NJ \\
                                                            MIDDLESEX \\ North Brunswick</strong>
                                                        <div>Working Structure Fire Reported
                                                        </div>
                                                        <small className="text-danger pull-right">unconfirmed</small>
                                                        <small className="text-muted">Today 5:60 pm - 12.06.2014</small>
                                                    </div>
                                                </div>

                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">2m ago</small>
                                                        <strong>
                                                            <i className="fas fa-car-crash"></i>
                                                            <i className="fas fa-car-crash" style={{color: "blue"}}></i>
                                                            NJ \\ Middlesex \\ North Brunswick
                                                        </strong>
                                                        <div>Rt. 130 SB and Georges Road for the Pin</div>
                                                        <small className="text-info pull-right">2 confirmations</small>
                                                        <small className="text-muted">Today 2:23 pm - 11.06.2014</small>
                                                    </div>
                                                </div>

                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">5m ago</small>
                                                        <strong>GSP - MVA w/ Car Fire</strong>
                                                        <div>No Injuries. FD and EMS On Scene working</div>
                                                        <small className="text-muted">NJ - Middlesex - Wall Township
                                                        </small>
                                                        <br/>
                                                        <small className="text-success pull-right">confirmed</small>
                                                        <small className="text-muted">Today 1:00 pm - 08.06.2014</small>
                                                    </div>
                                                </div>

                                                <div className="feed-element">
                                                    <div>
                                                        <div className={"text-muted pull-right"}>
                                                            <small className="pull-right">8m ago</small>
                                                            {/*<br/>*/}
                                                            {/*<i className="fas fa-bell"></i> 4*/}
                                                            {/*<br/>*/}
                                                            {/*<i className="far fa-thumbs-up"></i> 18*/}
                                                        </div>
                                                        <strong>NJ - Middlesex - Wall Township </strong>
                                                        <div>1422 Schoolhouse Road</div>
                                                        <div>WORKING FIRE</div>
                                                        <small className="text-success pull-right">confirmed</small>
                                                        <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                        </small>
                                                    </div>
                                                </div>


                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">12m ago</small>
                                                        <strong>NJ MONMOUTH PATERSON</strong>
                                                        <div>Ped Struck</div>
                                                        <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                        </small>
                                                    </div>
                                                </div>
                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">15m ago</small>
                                                        <strong>NY >> New York >> New York </strong>
                                                        <div>Bank Robbery</div>
                                                        <div>Police are looking for a male wearing all pink, looks like
                                                            a "clown"
                                                        </div>
                                                        <small className="text-success pull-right">confirmed</small>
                                                        <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                        </small>
                                                    </div>
                                                </div>
                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">5m ago</small>
                                                        <strong>NJ |> Middlesex |> North Brunswick</strong>
                                                        <div>Reported Batman sighting. Units urged to proceed with
                                                            caution
                                                        </div>
                                                        <small className="text-success pull-right">confirmed</small>
                                                        <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                        </small>
                                                    </div>
                                                </div>
                                                <div className="feed-element">
                                                    <div>
                                                        <small className="pull-right">5m ago</small>
                                                        <strong>NJ |> MIDDLESEX |> NORTH BRUNSWICK</strong>
                                                        <div>Water Rescue. FD and EMS Rescue On Scene. 602 Has
                                                            Command.
                                                        </div>
                                                        <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                        </small>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div id="national" className="tab-pane">
                                        <div className="panel-body">
                                            <div className="ibox-content">
                                                <div className="feed-activity-list" style={{height: '75vh'}}>

                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right text-navy">1m ago</small>
                                                            <strong>NJ \\ MIDDLESEX \\ North Brunswick</strong>
                                                            <div>Working Structure Fire Reported
                                                            </div>
                                                            <small className="text-muted">Today 5:60 pm - 12.06.2014
                                                            </small>
                                                        </div>
                                                    </div>

                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">2m ago</small>
                                                            <strong>MVA - Reported Entrapment</strong>
                                                            <div>Rt. 130 SB and Georges Road for the Pin</div>
                                                            <small className="text-muted">Today 2:23 pm - 11.06.2014
                                                            </small>
                                                        </div>
                                                    </div>

                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">5m ago</small>
                                                            <strong>GSP - MVA w/ Car Fire</strong>
                                                            <div>No Injuries. FD and EMS On Scene working</div>
                                                            <small className="text-muted">NJ - Middlesex - Wall Township
                                                            </small>
                                                            <br/>
                                                            <small className="text-muted">Today 1:00 pm - 08.06.2014
                                                            </small>
                                                        </div>
                                                    </div>

                                                    <div className="feed-element">
                                                        <div>
                                                            <div className={"text-muted pull-right"}>
                                                                <small className="pull-right">8m ago</small>
                                                                {/*<br/>*/}
                                                                {/*<i className="fas fa-bell"></i> 4*/}
                                                                {/*<br/>*/}
                                                                {/*<i className="far fa-thumbs-up"></i> 18*/}
                                                            </div>
                                                            <strong>NJ - Middlesex - Wall Township </strong>
                                                            <div>1422 Schoolhouse Road</div>
                                                            <div>WORKING FIRE</div>

                                                            <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                            </small>
                                                        </div>
                                                    </div>


                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">12m ago</small>
                                                            <strong>NJ MONMOUTH PATERSON</strong>
                                                            <div>Ped Struck</div>
                                                            <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">15m ago</small>
                                                            <strong>NY >> New York >> New York </strong>
                                                            <div>Bank Robbery</div>
                                                            <div>Police are looking for a male wearing all pink, looks
                                                                like
                                                                a "clown"
                                                            </div>
                                                            <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">5m ago</small>
                                                            <strong>NJ |> Middlesex |> North Brunswick</strong>
                                                            <div>Reported Batman sighting. Units urged to proceed with
                                                                caution
                                                            </div>
                                                            <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div className="feed-element">
                                                        <div>
                                                            <small className="pull-right">5m ago</small>
                                                            <strong>NJ |> MIDDLESEX |> NORTH BRUNSWICK</strong>
                                                            <div>Water Rescue. FD and EMS Rescue On Scene. 602 Has
                                                                Command.
                                                            </div>
                                                            <small className="text-muted">Yesterday 8:48 pm - 10.06.2014
                                                            </small>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-lg-8">
                    <div className="tabs-container">
                        <br/><br/>
                        {/*// Important! Always set the container height explicitly*/}
                        <div style={{height: '75vh', width: '100%'}}>
                            <GoogleMapReact
                                bootstrapURLKeys={{key: 'AIzaSyB1ZUug1hdyRxGcoGoQoAOVJjnqkWGBQ-I'}}
                                defaultCenter={this.props.center}
                                defaultZoom={this.props.zoom}
                            >
                                <AnyReactComponent
                                    lat={40.4670342}
                                    lng={-74.4662781}
                                    text={"SAMPLE MARKER"}

                                />
                            </GoogleMapReact>
                        </div>
                    </div>
                </div>
            </div>

        );
    }
}

export default RegionalMap;

ReactDOM.render(
    < RegionalMap/>,
    document.querySelector('#live-map')
);

