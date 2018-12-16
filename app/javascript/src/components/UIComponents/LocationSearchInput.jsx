import React from 'react';
import PlacesAutocomplete, {geocodeByAddress,} from 'react-places-autocomplete';


const addressFromComponents = ({address_components, coordinates, formatted_address}) => {
    const components_by_type = {};
    address_components.map(component => {
        components_by_type[component.types[0]] = component.short_name;
    });

    if (components_by_type["street_number"] && components_by_type["route"]) {
        components_by_type["street"] = `${components_by_type["street_number"]} ${components_by_type["route"]}`
    }
    components_by_type["coordinates"] = coordinates;
    components_by_type["formatted_address"] = formatted_address;

    return components_by_type
}

export default class LocationSearchInput extends React.Component {

    constructor(props) {
        super(props);
        this.state = {results: null, address: ""};
    }


    handleChange = address => {
        this.setState({address});
    };

    handleSelect = address => {
        geocodeByAddress(address)
            .then(results => {
                let {formatted_address} = results[0];
                this.setState({address: formatted_address});
                this.props.handleAddressUpdate(addressFromComponents(results[0]));
            })
            .catch(error => console.error('Error', error));
    };

    render() {
        return (
            <PlacesAutocomplete
                value={this.state.address}
                onChange={this.handleChange}
                onSelect={this.handleSelect}
            >
                {({getInputProps, suggestions, getSuggestionItemProps, loading}) => (
                    <div>
                        <input
                            {...getInputProps({
                                placeholder: 'Enter Incident Address',
                                className: 'location-search-input form-control',
                            })}
                        />
                        <div className="autocomplete-dropdown-container">
                            {loading && <div>Loading...</div>}
                            {suggestions.map(suggestion => {
                                const className = suggestion.active
                                    ? 'suggestion-item--active form-control'
                                    : 'suggestion-item form-control';
                                // inline style for demonstration purpose
                                const style = suggestion.active
                                    ? {backgroundColor: '#fafafa', cursor: 'pointer'}
                                    : {backgroundColor: '#ffffff', cursor: 'pointer'};
                                return (
                                    <div
                                        {...getSuggestionItemProps(suggestion, {
                                            className,
                                            style,
                                        })}
                                    >
                                        <span>{suggestion.description}</span>
                                    </div>
                                );
                            })}
                        </div>
                    </div>
                )}
            </PlacesAutocomplete>
        );
    }
}