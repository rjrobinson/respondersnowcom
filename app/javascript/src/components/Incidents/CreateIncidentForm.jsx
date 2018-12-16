import React, {Component} from 'react';
import Select, {Option, ReactSelectProps} from 'react-select'
import {FormControl, FormGroup, HelpBlock} from "react-bootstrap";
import LocationSearchInput from '../UIComponents/LocationSearchInput'
import {Query} from "react-apollo";
import {FETCH_INCIDENT_GROUPS} from "../../queries";


class CreateIncidentForm extends Component {

    constructor(props, context) {
        super(props, context);

        this.handleChange = this.handleChange.bind(this);

        this.state = {
            value: ''
        };


    }

    getValidationState() {
        const length = this.state.value.length;
        if (length > 10) return 'success';
        else if (length > 5) return 'warning';
        else if (length > 0) return 'error';
        return null;
    }

    handleAddressUpdate = (result) => this.setState({address: result});

    handleChange(e) {
        this.setState({value: e.target.value});
    }

    render() {
        const {queryData} = this.props;

        return (
            <form>
                <FormGroup
                    controlId="formBasicText"
                    validationState={this.getValidationState()}
                >
                    <LocationSearchInput handleAddressUpdate={this.handleAddressUpdate}/>
                    <FormControl
                        type="text"
                        value={this.state.value}
                        placeholder="Short Description"
                        onChange={this.handleChange}
                    />
                    <FormControl.Feedback/>
                    <Select
                        value={this.state.role}
                        options={queryData.incidentGroups}
                        isSearchable={true}
                        onChange={option =>
                            this.setState({role: option})
                        }
                        getOptionLabel={option => option.name}
                        getOptionValue={option => option.id}
                    />
                    <HelpBlock>Validation is based on string length.</HelpBlock>
                </FormGroup>
            </form>
        );
    }

}

const CreateIncident = () => (
    <Query query={FETCH_INCIDENT_GROUPS}>
        {({loading, error, data}) => {
            if (loading) return <div>loading . . .</div>;

            if (error) return <div>Error</div>;

            return <CreateIncidentForm queryData={data}/>
        }}
    </Query>
)


export default CreateIncident;