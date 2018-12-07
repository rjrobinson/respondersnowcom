import React from 'react'


const IncidentCard = ({incident}) => {

    const {message, location} = incident;

    return (
        <div className="feed-element">
            <div>
                <small className="pull-right">2m ago</small>
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
                        {/* --- */}
                    </strong>
                </small>
                <div>{message}</div>
                <small className="text-info pull-right">2 confirmations</small>
                <small className="text-muted">Today 2:23 pm - 11.06.2014</small>
            </div>
        </div>
    )
}


export default IncidentCard