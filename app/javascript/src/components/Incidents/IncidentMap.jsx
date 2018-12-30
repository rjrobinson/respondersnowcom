import "../map_marker.css"
import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faFire} from "@fortawesome/free-solid-svg-icons";
import GoogleMapReact from "google-map-react";
import Spinner from "react-spinkit";

const IncidentMapMarker = ({text}) => (
    <div>
        <FontAwesomeIcon icon={faFire} size="lg" color="red"/>
        <div className='pin bounce'></div>
        <div className='pulse'></div>
        <span className={"label label-danger"}>{text}</span>
    </div>
)

const isClear = ({name}) => name === "clear"

const renderIncidentMarkers = ({incidents}) => {
    
    if (!incidents) return null;
    return incidents.map(incident => {
        if (isClear(incident.status)) return null

        const {lat, long} = incident.location;
        return ( <IncidentMapMarker lat={lat} lng={long} key={incident.id}/>);
    })
}

const IncidentMap = ({data}) => {


    const defaultProps = {
        center: {
            lat: 40.4670342,
            lng: -74.4662781
        },
        zoom: 10
    };

    
    return (
        <div>
            <div style={{height: '80vh', width: '100%'}}>
                <GoogleMapReact
                    bootstrapURLKeys={{key: 'AIzaSyB1ZUug1hdyRxGcoGoQoAOVJjnqkWGBQ-I'}}
                    defaultCenter={defaultProps.center}
                    defaultZoom={defaultProps.zoom}
                >
                    {renderIncidentMarkers(data)}
                </GoogleMapReact>
            </div>
        </div>
    )
}


export default IncidentMap;