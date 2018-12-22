import React from 'react'
import TimeAgo from 'react-timeago'
import Moment from 'react-moment';
import FeedElement from '../UIComponents/FeedElement'

const IncidentCard = ({incident}) => {

    const {message, location, status, createdAt, rank} = incident;

    return (
        <FeedElement>
            <small className="pull-right"><TimeAgo date={createdAt}/></small>
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

            <p>{message}</p>
            <small className="text-danger pull-right">{status.name}</small>
            <small className="text-muted">
                <Moment format="HH:mm D MMM YYYY" interval={60000}>
                    {Date(createdAt).toISOString}
                </Moment>
            </small>
        </FeedElement>
    )
}


export default IncidentCard