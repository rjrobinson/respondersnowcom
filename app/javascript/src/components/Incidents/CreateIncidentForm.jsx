import React, {Component} from 'react';
import Select, {Option, ReactSelectProps} from 'react-select'
import {Alert, Button, ControlLabel, Form, FormControl, FormGroup} from "react-bootstrap";
import LocationSearchInput from '../UIComponents/LocationSearchInput'
import {Mutation, Query} from "react-apollo";
import {CREATE_INCIDENT, FETCH_INCIDENT_GROUPS, GET_INCIDENTS} from "../../queries";
import Spinner from '../Spinner';

import 'react-toastify/dist/ReactToastify.css';

const renderErrors = data => {
    const errors = data ? data.createIncident.incident.errors : [];

    return errors.map((error) => {
        return (
            <Alert bsStyle={'danger'} key={error.fieldName}>
                {error.fieldName}:{error.errors}
            </Alert>
        )
    })
}
class CreateIncidentForm extends Component {

    state = {value: "", valid: true}

    handleAddressUpdate = (result) => this.setState({address: result});

    handleChange = (e) => this.setState({value: e.target.value});

    onCompleted = () => (this.props.handleTabChange(1))

    onSubmit = (e, createIncident) => {
        e.preventDefault();

        const {formatted_address, street_number, route, locality, latLng, administrative_area_level_2, administrative_area_level_1} = this.state.address;
        const {lat, lng} = latLng;

        createIncident({
            variables: {
                incidentInput: {
                    lat: lat,
                    lng: lng,
                    formattedAddress: formatted_address,
                    city: locality,
                    county: administrative_area_level_2,
                    incidentGroupId: this.state.incidentGroupID,
                    incidentStatusId: "598879c9-4d1f-4e90-b128-47ae5092ba98",
                    message: this.state.value,
                    state: administrative_area_level_1,
                    street: route,
                    streetNumber: street_number
                }
            }
        }).then(() => {
            this.setState({address: null, value: ""})
        })

    }

    updateCache = (cache, {data: createIncident}) => {
        const {incidents} = cache.readQuery({query: GET_INCIDENTS})
        const {incident} = createIncident.createIncident

        cache.writeQuery({
            query: GET_INCIDENTS, 
            data: {incidents: [incident, ...incidents]
        }})
    }




    render() {
        const {queryData, handleTabChange} = this.props;

        return (
            <Mutation
                mutation={CREATE_INCIDENT}
                onCompleted={this.onCompleted}
                update={this.updateCache}
                >
                {(createIncident, {loading, error, data}) => {
                    if (loading) return <Spinner name="line-scale-pulse-out-rapid" color="coral" />;
                    if (error) return `Error! ${error.message}`;

                    return (
                    <Form
                        onSubmit={e => this.onSubmit(e, createIncident)}>
                        {renderErrors(error)}
                        <FormGroup>
                            <ControlLabel>Incidnet Address / Location</ControlLabel>
                            <LocationSearchInput handleAddressUpdate={this.handleAddressUpdate}/>
                        </FormGroup>
                        <FormGroup>
                            <ControlLabel>Short Description</ControlLabel>
                            <FormControl
                                type="text"
                                value={this.state.value}
                                placeholder="Short Description"
                                onChange={this.handleChange}/>
                            <FormControl.Feedback/>
                        </FormGroup>
                        <FormGroup>
                            <ControlLabel>Type of Incident</ControlLabel>
                            <Select
                                value={this.state.role}
                                options={queryData.incidentGroups}
                                isSearchable={true}
                                onChange={option =>
                                    this.setState({incidentGroupID: option.id})
                                }
                                getOptionLabel={option => option.name}
                                getOptionValue={option => option.id}/>
                        </FormGroup>
                        <hr/>
                        <FormGroup>
                            <Button
                                block
                                bsStyle={"primary"}
                                type={'submit'}
                                disabled={!this.state.valid}>
                                Submit
                            </Button>
                        </FormGroup>
                    </Form>)

                }}
            </Mutation>
        );
    }
}

export const CreateIncident = ({handleTabChange}) => (
    <Query query={FETCH_INCIDENT_GROUPS}>
        {({loading, error, data}) => {
            if (loading) return <div>loading . . .</div>;
            if (error) return <div>Error</div>;

            return (
                <div>
                    <div className="panel-body">
                        <h4 className="text-center">
                            <strong>
                                Please fill out the form below to report on an incident.
                            </strong>
                        </h4>
                        <p>
                            All of the incidents will have human eyes on this before it goes out to the
                            world unless you have enough merit ponts to be automatically confirmed.
                        </p>
                    </div>
                    <hr/>
                    <CreateIncidentForm queryData={data} handleTabChange={handleTabChange}/>
                    <hr/>
                    <div className="panel-body">

                        <h4>Incident Location / Address</h4>
                        <p>At this time we only support street address automatically. If you need to report
                            an
                            intersection, please note that in the "Short Description" section and we will
                            update
                            that manually
                        </p>
                        <br/>
                        <h4>Short Description</h4>
                        <p>You are limited to 140 chacters. If you need to send more of an update, you will
                            be able
                            to add additional information once approved. examples ("Working Structure Fire,
                            WSF,
                            Rollover w/ Entrapment.")
                            There is a "status" field available to those with enough rep points.
                        </p>
                        <br/>
                        <h4>Only Registered First Responders will have the ability to upvote / confirm /
                            flag events
                            and gain points.</h4>
                        <p className={"text-muted"}>For more information on rep points, please see the
                            readme.</p>
                        <br/>
                        <h3>Thank you for your report</h3>
                    </div>
                    <hr/>
                </div>

            )
        }}
    </Query>
)
