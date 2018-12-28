import gql from "graphql-tag";

export const HOSPITAL_DATA = gql`
  {
    hospitals(onDivert: true) {
      id
      name
      county
      status {
        reason status startTime expireTime county
      }
    }
  }
`;
