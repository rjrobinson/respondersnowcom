import React from 'react';
import { Button, ButtonGroup } from "react-bootstrap";
import { Mutation } from "react-apollo";
import { DOWNVOTE_INCIDENT, UPVOTE_INCIDENT } from '../../queries/incident_queries'

export const UpVoteButton = ({ id }) => (
    <Mutation
        mutation={UPVOTE_INCIDENT}
        onCompleted={this.onCompleted}>
        {(upVoteIncident) => (
            <Button
                onClick={() => {
                    upVoteIncident({
                        variables: { id }
                    }).then(({ data }) => {
                        const { errors } = data.incidentUpVote.incident;
                        console.log(errors)
                    })
                }}
                style={{ color: "green" }}>
                <i className="fas fa-arrow-circle-up"></i>
            </Button>
        )}
    </Mutation>
)
export const DownVoteButton = ({ id }) => (
    <Mutation
        mutation={DOWNVOTE_INCIDENT}
        onCompleted={this.onCompleted}>
        {(downVoteIncident) => (
            <Button
                onClick={() => {
                    downVoteIncident({
                        variables: { id }
                    }).then(({ data }) => {
                        const { errors } = data.incidentDownVote.incident;
                        console.log(errors)
                        // todo Add an error or notification here.
                    })
                }}
                style={{ color: "red" }}>
                <i className="fas fa-arrow-circle-down"></i>
            </Button>
        )}
    </Mutation>
    )
