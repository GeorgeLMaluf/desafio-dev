import React, { useState, useEffect } from "react";
import Select from "react-select";
import Axios from 'axios';

const ListTransactionsByProvider = () => {
  let [transaction, setTransaction] = useState({
    provider_name: "",
    balance: 0.0,
    transactions: []
  })

  let [providers, setProviders] = useState([]);

  useEffect(() => {
    if (providers.length === 0) {
      Axios.get('http://localhost:4000/api/v1/providers/').then((response) => {
        const options = response.data.map(d => ({
          "value": d.id,
          "label": d.name_provider
        }))
        setProviders(options)
      })
    }
  })

  const handleChange = (e) => {
    Axios.get("http://localhost:4000/api/v1/transactions/by_provider/" + e.value)
    .then((response) => {
      setTransaction(response.data)
    });
  }

  return (
    <>
      <Select options={providers} onChange={handleChange} />
      { transaction.transactions.length > 0 ?
        <>
          <table>
            <thead>
              <tr>
                <th>Cpf Cliente</th>
                <th>Tipo</th>
                <th>No. Cartao</th>
                <th>Natureza</th>
                <th>Valor</th>
              </tr>
            </thead>
            <tbody>
              {transaction.transactions.map((t) => {
                return (
                  <tr>                    
                    <td>{t.customer_cpf}</td>
                    <td>{t.type}</td>
                    <td>{t.card}</td>
                    <td>{t.nature}</td>
                    <td>{t.signalized_value}</td>
                  </tr>
                )
              })}
            </tbody>
          </table>
          <p>Saldo Atual: { transaction.balance} </p>
        </>
      : null}
    </>
  )
}

export default ListTransactionsByProvider