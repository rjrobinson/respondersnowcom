import gql from 'graphql-tag'

export const CONFIRM_INCIDENT = gql`
    mutation confirmIncident($id: ID!) {
        confirmIncident(id: $id) {
            incident {
                id
                message
                confirmed
                confirms: confirmations {
                    id 
                }
                errors {
                    fieldName
                    errors
                }
            }
        }
    }
`