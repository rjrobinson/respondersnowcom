import React, {Component} from 'react'
import {Popover, Button, Modal, Tooltip} from 'react-bootstrap'

class FormModal extends Component {
    constructor(props, context) {
        super(props, context);

        this.handleShow = this.handleShow.bind(this);
        this.handleClose = this.handleClose.bind(this);Tooltip

        this.state = {
            show: false
        };
    }

    handleClose() {
        this.setState({ show: false });
    }

    handleShow() {
        this.setState({ show: true });
    }

    render() {
        const popover = (
            <Popover id="modal-popover" title="popover">
                {this.props.popoverText}
            </Popover>
        );
        const tooltip = <Tooltip id="modal-tooltip">{this.props.toolTip}</Tooltip>;

        return (
            <div>
                <Button bsStyle="primary" bsSize="small" onClick={this.handleShow}>
                    {this.props.buttonText}
                </Button>

                <Modal show={this.state.show} onHide={this.handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Send Report</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        {this.props.children}
                    </Modal.Body>
                    <Modal.Footer>
                        <Button onClick={this.handleClose}>Close</Button>
                    </Modal.Footer>
                </Modal>
            </div>
        );
    }
}

export default FormModal;