import gql from "graphql-tag";

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
`;

export const UPVOTE_INCIDENT = gql`
  mutation UpVoteIncident($id: ID!) {
    incidentUpVote(id: $id) {
      incident {
        id
        errors {
          fieldName
          errors
        }
        message
        confirmed
      }
    }
  }
`;

export const DOWNVOTE_INCIDENT = gql`
  mutation DownVoteIncident($id: ID!) {
    incidentDownVote(id: $id) {
      incident {
        id
        message
        confirmed
        upvotes
        downvotes
        score
      }
    }
  }
`;

export const CREATE_INCIDENT_REPORT = gql`
  mutation createIR($reportInput: ReportInputType!) {
    createIncidentReport(reportInput: $reportInput) {
      incident {
        id
        incidentReports {
          id
          createdAt
          message
          user {
            id
            displayId
          }
        }        
      }
    }
  }
`;
