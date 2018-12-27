import React from "react";
import TimeAgo from "react-timeago";
import { Button, ButtonGroup, DropdownButton, Form, FormControl, FormGroup, Panel, ListGroup, ListGroupItem } from "react-bootstrap";
import Moment from "react-moment";
import FeedElement from "../UIComponents/FeedElement";

import { ConfirmButton } from "./ConfirmButton";

import { DownVoteButton, UpVoteButton } from "./VotesButtons";

const getStreetView = (lat, long) => {
	const GOOGLE_SIG = "oQSdVF4Cp0Cr6oCoK0IC4cW149o=";
	const GOOGLE_API = "AIzaSyCya6eVkasAwZfvsIovC63YcAc3QcGHZqI";

	return `https://maps.googleapis.com/maps/api/streetview?size=100x50&location=${lat},${long}&heading=151.78&pitch=-0.76&key=${GOOGLE_API}&signature=${GOOGLE_SIG}`;
};

class IncidentCard extends React.Component {
	state = { open: false, options: false };


	render() {
		const { incident } = this.props;

		const {
			message,
			location,
			status,
			createdAt,
			confirms,
			id,
			votes
		} = incident;

		return <div style={{ margin: 0, padding: 0 }}>
        <FeedElement style={{ paddingBottom: -25, display: "flex" }}>
          <ButtonGroup className="pull-right">
            <Button disabled bsSize="xsmall" bsStyle="primary">
              <TimeAgo date={createdAt} />
            </Button>
            <Button disabled bsSize="xsmall" bsStyle="info">
              {status.name}
            </Button>
          </ButtonGroup>
          <small>
            <strong>
              <ol className="breadcrumb">
                <li>
                  <span className="red">
                    <i className="fas fa-fire" />
                  </span>
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

          <h4 style={{ marginTop: 10, marginBottom: 10 }}>{message}</h4>
          <div className="pull-left">
            <ButtonGroup bsSize={"small"} style={{ marginTop: 10, marginBotton: -40 }}>
              <Button className="dead-bottom">
                <Moment format="HH:mm D MMM YYYY" interval={60000}>
                  {Date(createdAt).toISOString}
                </Moment>
              </Button>
              <UpVoteButton id={id} />
              <Button>{votes}</Button>
              <DownVoteButton id={id} />

              <Button onClick={() => this.setState({
                    open: !this.state.open,
                    options: false
                  })}>
                <i className="fas fa-comments" /> <i className="far fa-images" />
              </Button>
              <Button onClick={() => this.setState({
                    open: false,
                    options: !this.state.options
                  })}>
                <i className="fas fa-ellipsis-h" />
              </Button>
            </ButtonGroup>
          </div>
        </FeedElement>

        <Panel id="collapsible-panel-example-1" expanded={this.state.open} onToggle={() => console.log("toggled")}>
          <Panel.Collapse>
            <ListGroup>
              <ListGroupItem bsStyle="info">
                <ButtonGroup>
                  <ConfirmButton id={id} confirms={confirms} />
                  <Button>
                    <i className="fas fa-volume-mute" /> Mute
                  </Button>
                  <Button>
                    <i className="fas fa-flag" /> Flag Incident
                  </Button>
                </ButtonGroup>
              </ListGroupItem>
              <ListGroupItem active>
                12:12 | {message}
                <small className="blue pull-right">
                  <i className="fas fa-user" /> R0312
                </small>
              </ListGroupItem>
              <ListGroupItem bsStyle="info">
                12:22 | Extended to the roof / Stx of another building.
                <small className="blue pull-right">
                  {" "}
                  <i className="fas fa-user" /> C0322
                </small>
              </ListGroupItem>

              <ListGroupItem bsStyle="warning">
				  <small className="blue pull-right">
                  <i className="fas fa-user" /> R0312
                </small>
                <div>
                  12:32 | <img src="https://picsum.photos/500/300/?random" alt="https://picsum.photos/500/300/?random" />
                </div>
              </ListGroupItem>
              <ListGroupItem bsStyle="info">
                12:52 | MA COmpanies called for cover assignments.
                <small className="blue pull-right">
                  <i className="fas fa-user" /> R0312
                </small>
              </ListGroupItem>
              <ListGroupItem>
                <Form>
                  <FormGroup>
                    <FormControl type="text" placeholder="send an update . . ." />
                  </FormGroup>
                  <FormGroup>
                    <ButtonGroup vertical block>
                      <Button bsStyle="primary">Send Update</Button>
                      <Button bsStyle="info">
                        <i className="fas fa-camera" />
                      </Button>
                    </ButtonGroup>
                  </FormGroup>
                </Form>
              </ListGroupItem>
            </ListGroup>
          </Panel.Collapse>
        </Panel>
      </div>;
	}
}

export default IncidentCard;
