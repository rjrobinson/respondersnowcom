import {gql} from 'apollo-boost'

export const GET_INCIDENTS = gql`{
    incidents {
        id
        score
        status {
            name
        }
        upvotes
        message
        location {
            lat: latitude
            long: longitude
            state
            county
            city
            street
        }
        rank
        createdAt
    }
}`;


export const GET_INCIDENT_MARKERS = gql`
    {
        incidents {
            id
            location {
                id
                lat: latitude
                long: longitude
            }
        }
    }
`;

export const FETCH_INCIDENT_GROUPS = gql`
    {
        incidentGroups {
            id
            name
        }
    }

`

export const CREATE_INCIDENT = gql`
    mutation createIncident($incidentInput: IncidentInputType!) {
        createIncident(incidentInput: $incidentInput) {
            incident {
                errors {
                    fieldName
                    errors
                }
                id
                message
            }
        }
    }

`

// {
//     "incidentInput": {
//     "message" : "Some random message",
//         "state": "NJ",
//         "street": "980 Newton St",
//         "city": "North Brunswick",
//         "status": "1st alarm",
//         "sceneType": "EMS"
//
// }
// }