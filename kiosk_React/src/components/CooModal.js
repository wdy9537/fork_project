import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Table from 'react-bootstrap/Table';
import useCooStore from '../store/cooStore';
import React, { useEffect } from 'react';

function CooModal(props) {

  const {cooList, getCoo} = useCooStore();

  useEffect(() => {
    getCoo();
  },[]);

  return (
    <Modal
      {...props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header>
        <Modal.Title id="contained-modal-title-vcenter">
          원산지 표기판
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Table striped bordered hover variant="dark">
          <thead>
            <tr>
              <th>재료명</th>
              <th>원산지</th>
            </tr>
          </thead>
          <tbody>

            {
              cooList.map(coo => {
                return(
                  <tr>
                    <td>{coo.cooName}</td>
                    <td>{coo.cooCountry}</td>
                  </tr>
                )
              })
            }
          </tbody>
        </Table>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={props.onHide}>Close</Button>
      </Modal.Footer>
    </Modal>
  );
}

export default CooModal;