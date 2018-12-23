import React from 'react'
import TimeAgo from 'react-timeago'
import {Button, ButtonGroup, Label} from 'react-bootstrap';
import Moment from 'react-moment';
import FeedElement from '../UIComponents/FeedElement'

import {ConfirmButton} from './ConfirmButton'

const IncidentCard = ({incident}) => {

    const {message, location, status, createdAt, confirms, id} = incident;

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
                    <Button><i className="fas fa-arrow-circle-up"></i></Button>

                    <ConfirmButton id={id} confirms={confirms}/>


                    <Button>23 <i className="far fa-images"></i></Button>
                    <Button>2 <i className="fas fa-flag"></i></Button>
                </ButtonGroup>

            </div>

        </FeedElement>
    )
}


export default IncidentCard