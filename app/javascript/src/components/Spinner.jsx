import React from 'react';

const Spinner = (props) => {
    return (
        <div>
            <div className="sk-spinner sk-spinner-wave">
                <div className="sk-rect1"></div>
                <div className="sk-rect2"></div>
                <div className="sk-rect3"></div>
                <div className="sk-rect4"></div>
                <div className="sk-rect5"></div>
            </div>
            <h5>{props.message}</h5>
        </div>
    )
}

Spinner.defaultProps = {
    message: ''
}


export default Spinner