import React from "react";
import TimeAgo from "react-timeago";
import {Button, ButtonGroup, DropdownButton, Form, FormControl, FormGroup, MenuItem, Panel} from "react-bootstrap";
import Moment from "react-moment";
import FeedElement from "../UIComponents/FeedElement";

import {ConfirmButton} from "./ConfirmButton";

import {DownVoteButton, UpVoteButton} from "./VotesButtons";

const getStreetView = (lat, lng) => {
    const GOOGLE_SIG = "oQSdVF4Cp0Cr6oCoK0IC4cW149o=";
    const GOOGLE_API = "AIzaSyCya6eVkasAwZfvsIovC63YcAc3QcGHZqI";
    //      https://maps.googleapis.com/maps/api/streetview?size=100x50&location=${lat},${long}&heading=151.78&pitch=-0.76&key=${GOOGLE_API}&signature=${GOOGLE_SIG}
    return `https://maps.googleapis.com/maps/api/streetview?size=100x50&location=${lat},${lng}&heading=151.78&pitch=-0.76&key=${GOOGLE_API}&signature=${GOOGLE_SIG}`;
};

class IncidentCard extends React.Component {
    state = {open: false};

    render() {
        const {incident} = this.props;

        const {
            message,
            location,
            status,
            createdAt,
            confirms,
            id,
            votes
        } = incident;

        return (
            <div>
                <FeedElement style={{paddingBottom: -25, display: "flex"}}>
                    <ButtonGroup className="pull-right">
                        <DropdownButton
                            id="1"
                            noCaret={true}
                            style={{position: "fixed top"}}
                            bsSize="xsmall"
                            title={<i className="fas fa-ellipsis-h"/>}
                        >
                            <ConfirmButton eventKey="1" id={id} confirms={confirms}/>
                            <MenuItem eventKey="2">
                                <i className="fas fa-volume-mute"/> Mute
                            </MenuItem>
                            <MenuItem eventKey="3">
                                <i className="fas fa-flag"/> Flag Incident
                            </MenuItem>
                        </DropdownButton>

                        <Button disabled bsSize="xsmall" bsStyle="primary">
                            <TimeAgo date={createdAt}/>
                        </Button>
                        <Button disabled bsSize="xsmall" bsStyle="info">
                            {status.name}
                        </Button>
                    </ButtonGroup>
                    <small>
                        <strong>
                            <ol className="breadcrumb">
                                <li>
                                    <DropdownButton
                                        style={{zIndex: 999}}
                                        noCaret={true}
                                        style={{position: "fixed top"}}
                                        bsSize="xsmall"
                                        title={<i className="fas fa-fire"/>}
                                    >
                                        <ConfirmButton eventKey="1" id={id} confirms={confirms}/>
                                        <MenuItem eventKey="2">
                                            <i className="fas fa-volume-mute"/> Mute
                                        </MenuItem>
                                        <MenuItem eventKey="3">
                                            <i className="fas fa-flag"/> Flag Incident
                                        </MenuItem>
                                    </DropdownButton>
                                </li>
                                <li>
                                    <span className="text-navy">{location.state}</span>
                                </li>
                                <li>
                                    <span className="text-navy">{location.county}</span>
                                </li>
                                <li className="active">
                                    <span className="text-danger">{location.city}</span>
                                </li>
                                <li>{location.street}</li>
                            </ol>
                        </strong>
                    </small>

                    <h4 style={{marginTop: 10, marginBottom: 10}}>{message}</h4>
                    <div className="pull-left">
                        <ButtonGroup
                            bsSize={"small"}
                            style={{marginTop: 10, marginBotton: -40}}
                        >
                            <Button className="dead-bottom">
                                <Moment format="HH:mm D MMM YYYY" interval={60000}>
                                    {Date(createdAt).toISOString}
                                </Moment>
                            </Button>
                            <UpVoteButton id={id}/>
                            <Button>{votes}</Button>
                            <DownVoteButton id={id}/>

                            <Button onClick={() => this.setState({open: !this.state.open})}>
                                <i className="fas fa-comments"/>{" "}
                                <i className="far fa-images"/>
                            </Button>
                        </ButtonGroup>
                    </div>
                </FeedElement>
                <Panel
                    id="collapsible-panel-example-1"
                    expanded={this.state.open}
                    onToggle={() => alert("toggled")}
                >
                    <Panel.Collapse>
                        <ul className="list-group list-group-flush">
                            <li className="list-group-item active">
                                12:12 | Confirmed Working Structure Fire
                            </li>
                            <li className="list-group-item">
                                12:22 | Extended to the roof / Stx of another building.
                            </li>
                            <li className="list-group-item">
                                12:32 | Fully envolved. 2 Bells.
                            </li>
                            <li className="list-group-item">
                                12:32 |{" "}
                                <img
                                    src="https://picsum.photos/200/300/?random"
                                    alt="https://picsum.photos/200/300/?random"
                                />
                            </li>
                            <li className="list-group-item">
                                12:52 | MA COmpanies called for cover assignments.
                            </li>
                            <li className="list-group-item">
                                <Form>
                                    <FormGroup>
                                        <FormControl type="text"/>
                                    </FormGroup>
                                    <FormGroup>
                                        <ButtonGroup vertical block>
                                            <Button bsStyle="primary">Send Update</Button>
                                            <Button bsStyle="info">
                                                <i class="fas fa-camera"/>
                                            </Button>
                                        </ButtonGroup>
                                    </FormGroup>
                                </Form>
                            </li>
                        </ul>
                    </Panel.Collapse>
                </Panel>
            </div>
        );
    }
}

export default IncidentCard;
