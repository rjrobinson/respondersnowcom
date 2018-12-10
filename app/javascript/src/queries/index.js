import {gql} from 'apollo-boost'

export const GET_INCIDENTS = gql`
    {
        incidents {
            id
            score
            status
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
    }
`;


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