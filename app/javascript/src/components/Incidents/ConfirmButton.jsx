import React from 'react';
import {Button} from "react-bootstrap";
import {Mutation} from "react-apollo";
import {CONFIRM_INCIDENT} from '../../queries/incident_queries'


const renderDots = (confirms) => {
    return confirms.map(({id}) => {
        return (<i key={id} className="far fa-dot-circle"></i>)
    })
}

export const ConfirmButton = ({id, confirms}) =>
    <Mutation
        mutation={CONFIRM_INCIDENT}
        onCompleted={this.onCompleted}>
        {(confirmIncident, {data, error}) => (
            <Button
                disabled={confirms.length >= 3}
                onClick={e => {
                    confirmIncident({
                        variables: {id}
                    }).then(({data}) => {
                        const {errors} = data.confirmIncident.incident
                        console.log(errors)
                        // todo Add an error or notification here.
                    })
                }}
                style={{color: "green"}}>
                {confirms.length >= 1 ? renderDots(confirms) : <i className="far fa-dot-circle"></i>}
            </Button>
        )}
    </Mutation>

