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
