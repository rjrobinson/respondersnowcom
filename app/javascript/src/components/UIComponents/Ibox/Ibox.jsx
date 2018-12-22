import React from 'react';

export const IBox = ({children}) => (<div className="ibox float-e-margins">{children}</div>)
export const IBoxTitle = ({children}) => (<div className="ibox-title">{children}</div>)

export const IBoxTools = ({children}) => (
    <div className="ibox-tools">
        <a className="collapse-link">
            <i className="fa fa-chevron-up"></i>
        </a>
        <a className="close-link">
            <i className="fa fa-times"></i>
        </a>
    </div>
)

export const IBoxContent = ({children}) => (<div className="ibox-content">{children}</div>)
//     < div className = "ibox float-e-margins" >
//     <div className = "ibox-title">
//     < h5 > Messages < /h5>
// <div className="ibox-tools">

// </div>
// < /div>
// <div className="ibox-content ibox-heading">
//     <h3><i className="fa fa-envelope-o"></i> New messages</h3>
//     <small><i className="fa fa-tim"></i> You have 22 new messages and 16 waiting in draft folder.</small>
// </div>
// < div
// className = "ibox-content" >
//     < div
// className = "feed-activity-list" >
