import { gql } from "apollo-boost";

export const GET_INCIDENTS = gql`
  {
    incidents {
      id
      status {
        name
        abvr
      }
      votes: score
      confirms: confirmations {
        id
      }
      message
      incidentReports {
        id
        createdAt
        message
        user {
          id
          displayId
        }
      }
      location {
        lat: latitude
        long: longitude
        state
        county
        city
        street
      }
      user {
        id
        displayId
      }
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

export const FETCH_INCIDENT_GROUPS = gql`
  {
    incidentGroups {
      id
      name
    }
  }
`;

export const CREATE_INCIDENT = gql`
  mutation createIncident($incidentInput: IncidentInputType!) {
    createIncident(incidentInput: $incidentInput) {
      incident {
        id
        status {
          name
        }
        votes: score
        confirms: confirmations {
          id
        }
        message
        incidentReports {
          id
          createdAt
          message
          user {
            id
            displayId
          }
        }
        location {
          lat: latitude
          long: longitude
          state
          county
          city
          street
        }
        user {
          id
          displayId
        }
        createdAt
      }
    }
  }
`;
