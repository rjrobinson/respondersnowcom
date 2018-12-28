import React from 'react';
import { Form, FormControl, FormGroup, ButtonGroup, Button } from "react-bootstrap";
import { CREATE_INCIDENT_REPORT } from '../../queries/incident_queries';
import { GET_INCIDENTS } from "../../queries/";
import { Mutation } from "react-apollo";
import  Spinner  from '../Spinner'

export class CreateMessageForm extends React.Component {
    state = { message: "", valid: false }

    handleChange = (e) => {
        this.setState({ message: e.target.value });
        (this.state.message.length >= 1) ? this.setState({ valid: true }) : this.setState({ valid: false })
    }

    onError = () => {
        console.log("there was an error. ")
    }

    submitForm = (e, createReport) => {
        e.preventDefault()
        const { id } = this.props;
        const { message } = this.state;

        createReport({
            variables: {
                reportInput: { incidentId: id, message }
            }
        })
    }

    render() {

        return (
            <Mutation
                mutation={CREATE_INCIDENT_REPORT}
                onCompleted={this.onCompleted}
                refetchQueries={GET_INCIDENTS}
            >
                {(createReport, { loading, error, data }) => {

                    if (loading) return <Spinner name="line-scale-pulse-out-rapid" color="coral" />;
                    if (error) return `Error! ${error.message}`;

                    return (<Form onSubmit={e => this.submitForm(e, createReport)}>
                        <FormGroup>
                            <FormControl type="text" value={this.state.value} placeholder="send an update . . ." onChange={this.handleChange} />
                        </FormGroup>
                        <FormGroup>
                            <Button block bsStyle={"primary"} type={"submit"} disabled={!this.state.valid}>
                                Send Update
                  </Button>
                        </FormGroup>
                    </Form>)

                }}
            </Mutation>
        );
    }
}