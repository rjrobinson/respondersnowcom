import "../map_marker.css"
import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faFire} from "@fortawesome/free-solid-svg-icons";
import GoogleMapReact from "google-map-react";

const IncidentMapMarker = ({text}) => (
    <div>

        <FontAwesomeIcon icon={faFire} size="lg" color="red"/>
        <div className='pin bounce'></div>
        <div className='pulse'></div>
        <span className={"label label-danger"}>{text}</span>

    </div>
)

const renderIncidentMarkers = ({incidents}) => {

    return incidents.map(incident => {
        const {lat, long} = incident.location;

        return <IncidentMapMarker
            lat={lat}
            lng={long}
            text={"FIRE"}
            key={incident.id}/>;
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
            <br/><br/>
            <div style={{height: '75vh', width: '100%'}}>
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