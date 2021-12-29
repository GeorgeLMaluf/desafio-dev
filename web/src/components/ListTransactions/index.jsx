import React, { useState, useEffect } from "react";
import Axios from 'axios';

const ListTransactions = () => {

  let [dataList, setDataList ] = useState([]);

  useEffect(() => {
    Axios.get('http://localhost:4000/api/v1/transactions/').then((response) => setDataList(response.data));
  }, []);

  return (
      <>
      { dataList.length === 0 ? <p>Sem transações existents</p> 
        :
        <>
          <p>Transações existentes</p>
          <table>
            <thead>
              <tr>
                <th>Nome da Loja</th>
                <th>Cpf Cliente</th>
                <th>Tipo</th>
                <th>No. Cartao</th>
                <th>Natureza</th>
                <th>Valor</th>
              </tr>
            </thead>
            <tbody>
              {dataList.map((obj) => {
                return (
                  <tr>
                    <td>{obj.provider_name}</td>
                    <td>{obj.customer_cpf}</td>
                    <td>{obj.type}</td>
                    <td>{obj.card}</td>
                    <td>{obj.nature}</td>
                    <td>{obj.signalized_value}</td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </>
      }
    </>     
  )
}

export default ListTransactions