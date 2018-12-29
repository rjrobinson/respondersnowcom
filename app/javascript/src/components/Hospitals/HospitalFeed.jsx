import React from 'react';
import { Query } from "react-apollo";
import { HOSPITAL_DATA } from '../../queries/hospital_queries'
import { ListGroup, ListGroupItem, Button, ButtonGroup } from 'react-bootstrap';
import Moment from 'react-moment';

const pollIntervalTime = 30000

const renderHospitals = ({ hospitals }) => {
    return hospitals.map(({ id, name, status }) => {

        const { reason, startTime, expireTime } = status;

        return <ListGroupItem key={id} bsStyle="info">
            <div>
              <div className="pull-right">
                notice expires <Moment fromNow>
                  {new Date(expireTime).toISOString()}
                </Moment>
              </div>
              <h4>{name}</h4>

              <hr />
              <h4>
                status: {status.status} | reason:  {reason}
              </h4>
              <ButtonGroup>
                <Button bsStyle="primary">Starting At</Button>
                <Button bsStyle="primary">
                  <Moment format="HH:mm D MMM YY">
                    {new Date(startTime).toISOString()}
                  </Moment>
                </Button>
                <Button bsStyle="danger">Ending At</Button>
                <Button bsStyle="danger">
                  <Moment format="HH:mm D MMM YY">
                    {new Date(expireTime).toISOString()}
                  </Moment>
                </Button>
              </ButtonGroup>
            </div>
          </ListGroupItem>;
    })
}

const NoHospitalDivert = () => (
    <ListGroup>
        <ListGroupItem
            key={1}
            bsStyle="success">
            <h1 className="text-center">All Open</h1>
            <h3 className="text-center">No Hospitals that you are subscribbed to are on divert or bypass.</h3>
            <h5 className="text-center">We are not showing any alerts as per various sources right now. Please check back later. Note that this is updated every 5-10 minutes.
            If you would like a text notification, that feature is coming soon.</h5>
        </ListGroupItem>
    </ListGroup>
)

const HospitalFeed = () => (

    <Query
        query={HOSPITAL_DATA}
        pollInterval={pollIntervalTime}>

        {
            ({ loading, error, data }) => {
                if (loading) return <div>loading . . .</div>;
                if (error) return <div>Error</div>;
                if (data.hospitals.length === 0) return <div><NoHospitalDivert /></div>;

                return (
                    <ListGroup>
                    {renderHospitals(data)}
                    </ListGroup>
                )
            }
        }

    </Query>
)

export default HospitalFeed;