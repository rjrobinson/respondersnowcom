import React from 'react';
import {Option, ReactSelectProps} from 'react-select'
import {FormControl, FormGroup, HelpBlock} from "react-bootstrap";
import LocationSearchInput from '../UIComponents/LocationSearchInput'

class CreateIncidentForm extends React.Component {

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

    handleAddressUpdate = (result) => {
        console.log(result)

    }


    handleChange(e) {
        this.setState({value: e.target.value});
    }

    render() {
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
                        placeholder="Enter text"
                        onChange={this.handleChange}
                    />
                    <FormControl.Feedback/>
                    <HelpBlock>Validation is based on string length.</HelpBlock>
                </FormGroup>
            </form>
        );
    }

}

export default CreateIncidentForm;