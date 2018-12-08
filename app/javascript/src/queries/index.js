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