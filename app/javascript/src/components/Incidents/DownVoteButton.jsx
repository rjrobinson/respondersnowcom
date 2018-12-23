import React from 'react';
import {Button} from "react-bootstrap";
import {Mutation} from "react-apollo";
import {DOWNVOTE_INCIDENT} from '../../queries/incident_queries'

export const DownVoteButton = ({id, downvotes}) =>
    <Mutation
        mutation={DOWNVOTE_INCIDENT}
        onCompleted={this.onCompleted}>
        {(confirmIncident) => (
            <Button
                onClick={() => {
                    confirmIncident({
                        variables: {id}
                    }).then(({data}) => {
                        const {errors} = data.incidentDownVote.incident;
                        console.log(errors)
                        // todo Add an error or notification here.
                    })
                }}
                style={{color: "orange"}}>
                {downvotes} <i className="fas fa-arrow-circle-down"></i>
            </Button>
        )}
    </Mutation>
