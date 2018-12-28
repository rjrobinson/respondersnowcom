import React from "react";
import Moment from "react-moment";
import { ListGroupItem } from 'react-bootstrap';


const IRListItem = ({ createdAt, user, message }) =>
    (<ListGroupItem bsStyle="info">
        <strong className="muted"><Moment format="HH:mm">{new Date(createdAt).toISOString()}</Moment></strong>{" "}|{" "}{message}
        <small className="blue pull-right">
            <i className="fas fa-user" /> {user}
        </small>
    </ListGroupItem>);

export default IRListItem;