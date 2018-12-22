import React from 'react'
import TimeAgo from 'react-timeago'
import Moment from 'react-moment';
import FeedElement from '../UIComponents/FeedElement'
import {Button, ButtonGroup, Label} from 'react-bootstrap';

const IncidentCard = ({incident}) => {

    const {message, location, status, createdAt, rank} = incident;

    return (
        <FeedElement style={{paddingBottom: -25, display: "flex"}}>
            <small className="pull-right"><TimeAgo date={createdAt}/>
                <br/><br/>
                <Label bsStyle="success" style={{marginTop: 15}}>{status.name}</Label>
            </small>
            <small>
                <strong>
                    {/*Seperate this out to a component. */}
                    <ol className="breadcrumb">
                        <li><i className="fas fa-fire" style={{color: 'red'}}></i></li>
                        <li><span className="text-navy">{location.state}</span></li>
                        <li><span className="text-navy">{location.county}</span></li>
                        <li className="active"><span className="text-danger">{location.city}</span></li>
                        <li>{location.street}</li>
                    </ol>

                </strong>
            </small>

            <h4 style={{marginTop: 10, marginBotton: 10}}>{message}</h4>

            <div className="pull-left">
                <ButtonGroup bsSize={"xsmall"} style={{marginTop: 10, marginBotton: -40}}>
                    <Button>
                        <Moment format="HH:mm D MMM YYYY" interval={60000}>
                            {Date(createdAt).toISOString}
                        </Moment>
                    </Button>
                    <Button>{rank} <i className="fas fa-arrow-circle-up"></i></Button>
                    <Button style={{color: "green"}}>
                        <i className="far fa-dot-circle"></i>
                        <i className="far fa-dot-circle"></i>
                        <i className="far fa-dot-circle"></i>
                    </Button>
                    <Button>23 <i className="far fa-images"></i></Button>
                    <Button>2 <i className="fas fa-flag"></i></Button>
                </ButtonGroup>
            </div>

        </FeedElement>
    )
}


export default IncidentCard