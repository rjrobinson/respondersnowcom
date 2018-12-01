import React, {Component} from 'react';
import ReactDOM from 'react-dom'

import GoogleMapReact from "google-map-react";

const AnyReactComponent = ({text}) => <div>{text}</div>;

class RegionalMap extends Component {
    static defaultProps = {
        center: {
            lat: 40.4671416,
            lng: -74.4664551
        },
        zoom: 15
    };

    render() {
        return (
            <div className="row">
                <div className="col-lg-4">
                    <div className="tabs-container">
                    </div>
                </div>
                <div className="col-lg-8">
                    <div className="tabs-container">

                        {/*// Important! Always set the container height explicitly*/}
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
            </div>

        );
    }
}

export default RegionalMap;

ReactDOM.render(
    < RegionalMap/>,
    document.querySelector('#live-map')
);

