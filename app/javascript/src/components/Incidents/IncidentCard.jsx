import React from "react";
import TimeAgo from "react-timeago";
import { Button, ButtonGroup, DropdownButton, Form, FormControl, FormGroup, Panel, ListGroup, ListGroupItem } from "react-bootstrap";
import Moment from "react-moment";
import FeedElement from "../UIComponents/FeedElement";
import {CreateMessageForm} from '../IncidentReports/CreateMessageForm'
import { ConfirmButton } from "./ConfirmButton";
import { DownVoteButton, UpVoteButton, VoteButtons } from "./VotesButtons";
import IRListItem from '../IncidentReports/IRListItem'

const renderIncidentReportItems  = (incidentReports) => {
	return incidentReports.map(({id, message, user, createdAt}) => {
		return (<IRListItem key={id} message={message} user={user.displayId} createdAt={createdAt}/>)
	})
}

class IncidentCard extends React.Component {
	state = { open: false };


	render() {
		const { incident } = this.props;

		const {
			message,
			location,
			status,
			createdAt,
			confirms,
			id,
			votes,
			incidentReports,
			user
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
                <Moment format="HH:mm D MMM YY">
									{new Date(createdAt).toISOString()}
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
        </ButtonGroup>
          </div>
        </FeedElement>

			<Panel id="collapsible-panel-example-1" expanded={this.state.open} onToggle={() => console.log("toggled")}>
				<Panel.Collapse>
					<ListGroup>
						<ListGroupItem
							bsStyle="info" disabled>
							<ButtonGroup bsSize={"xsmall"}>
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
							<Moment format="HH:mm">{createdAt}</Moment> {" "}| {" "}{message}
							<small className="blue pull-right">
								<i className="fas fa-user" /> {user.displayId}
                			</small>
						</ListGroupItem>
						
						{renderIncidentReportItems(incidentReports)}
					
						<ListGroupItem>
							<CreateMessageForm id={id}/>
						</ListGroupItem>
					</ListGroup>
				</Panel.Collapse>
			</Panel>
      </div>;
	}
}

export default IncidentCard;
