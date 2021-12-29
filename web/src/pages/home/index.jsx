import React from "react"
import ImportForm from "../../components/ImportForm"
import ListTransactions from "../../components/ListTransactions"

const HomePage = () => {
  return (
    <div>
      <ImportForm/>
      <ListTransactions/>
    </div>
  )
}

export default HomePage