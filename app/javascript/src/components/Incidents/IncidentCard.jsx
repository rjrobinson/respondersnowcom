import React, {Component} from 'react'
import TimeAgo from 'react-timeago'
import {Button, ButtonGroup, Label, Panel, Form,FormGroup, FormControl } from 'react-bootstrap';
import Moment from 'react-moment';
import FeedElement from '../UIComponents/FeedElement'

import {ConfirmButton} from './ConfirmButton'
import {UpVoteButton} from './UpVoteButton'
import {DownVoteButton} from './DownVoteButton'

class IncidentCard extends React.Component {

    state = {open: false}
    
    render() {
    
    const {incident} = this.props

    const {message, location, status, createdAt, confirms, id, upvotes, downvotes} = incident;

    return (
        <FeedElement style={{paddingBottom: -25, display: "flex"}}>
            <small className="pull-right"><TimeAgo date={createdAt}/>
                <br/><br/>
                <Label bsStyle="success" style={{marginTop: 15}}>{status.name}</Label>
            </small>
            <small>
                <strong>
                    <ol className="breadcrumb">
                        <li><i className="fas fa-fire" style={{color: 'red'}}></i></li>
                        <li><span className="text-navy">{location.state}</span></li>
                        <li><span className="text-navy">{location.county}</span></li>
                        <li className="active"><span className="text-danger">{location.city}</span></li>
                        <li>{location.street}</li>
                    </ol>

                </strong>
            </small>

            <h4 style={{marginTop: 10, marginBottom: 10}}>{message}</h4>

            <div className="pull-left">
                <ButtonGroup bsSize={"small"} style={{marginTop: 10, marginBotton: -40}}>
                    <Button className="dead-bottom">
                        <Moment format="HH:mm D MMM YYYY" interval={60000}>
                            {Date(createdAt).toISOString}
                        </Moment>
                    </Button>

                    <UpVoteButton id={id} upvotes={upvotes}/>
                    <DownVoteButton id={id} downvotes={downvotes}/>
                    <ConfirmButton id={id} confirms={confirms}/>

                    <Button>23 <i className="far fa-images"></i></Button>
                    <Button>2 <i className="fas fa-flag"></i></Button>
                    <Button onClick={() => this.setState({ open: !this.state.open })}>
                        <i className="fas fa-comments"></i>
                    </Button>
                    <Button><i className="fas fa-volume-mute"></i></Button>
                </ButtonGroup>
                <br/>
                    <Panel id="collapsible-panel-example-1" expanded={this.state.open} onToggle={() => alert("toggled")}>
                        <Panel.Collapse>
                            <Panel.Body>
                                <ul>
                                    <li><b>22:32 12/24</b> This part does not work yet. - J0301 </li>
                                    <li><b>22:32 12/24</b> Units clearning - J0301 </li>
                                    <li><b>22:31 12/24</b> Bulk of fire is knocked.  - R0302 </li>
                                    <li><b>22:30 12/24</b> Command reporting that there is a working fire. - R0302  </li>
                                </ul>
                                <div className="pull-right">
                                    <Form inline>
                                        <FormGroup controlId="formInlineName">
                                            <FormControl type="text" placeholder="send update.." />
                                        </FormGroup>{' '}
                                        <Button type="submit">send</Button>
                                    </Form>
                                </div>
                            </Panel.Body>
                        </Panel.Collapse>
                    </Panel>
            </div>

        </FeedElement>
        )
    }
}


export default IncidentCard