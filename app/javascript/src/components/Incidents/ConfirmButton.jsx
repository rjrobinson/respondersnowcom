import React from 'react';
import {Button} from "react-bootstrap";
import {Mutation} from "react-apollo";
import {CONFIRM_INCIDENT} from '../../queries/incident_queries'

const renderColor = length => {
    switch (length) {
        case 1:
            return "red";
        case 2:
            return "yellow";
        case (length > 3):
            return "green";
        default:
            return "orange";
    }
}

export const ConfirmButton = ({id, confirms}) =>
    <Mutation
        mutation={CONFIRM_INCIDENT}
        onCompleted={this.onCompleted}>
        {(confirmIncident) => (
            <Button
                
                disabled={confirms.length >= 3}
                onClick={() => {
                    confirmIncident({
                        variables: {id}
                    }).then(({data}) => {
                        const {errors} = data.confirmIncident.incident;
                        console.log(errors)
                        // todo Add an error or notification here.
                    })
                }}
                style={{color: renderColor(confirms.length)}}>
                <i className="far fa-dot-circle"></i> Confirm
            </Button>
        )}
    </Mutation>

