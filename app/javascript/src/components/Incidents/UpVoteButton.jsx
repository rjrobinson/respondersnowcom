import React from 'react';
import {Button} from "react-bootstrap";
import {Mutation} from "react-apollo";
import {UPVOTE_INCIDENT} from '../../queries/incident_queries'

export const UpVoteButton = ({id, upvotes}) =>
    <Mutation
        mutation={UPVOTE_INCIDENT}
        onCompleted={this.onCompleted}>
        {(confirmIncident) => (
            <Button
                onClick={() => {
                    confirmIncident({
                        variables: {id}
                    }).then(({data}) => {
                        const {errors} = data.incidentUpVote.incident;
                        console.log(errors)
                        // todo Add an error or notification here.
                    })
                }}
                style={{color: "green"}}>
                {upvotes} <i className="fas fa-arrow-circle-up"></i>
            </Button>
        )}
    </Mutation>
