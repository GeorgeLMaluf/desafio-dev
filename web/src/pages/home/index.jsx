import React from "react"
import ImportForm from "../../components/ImportForm"
import ListTransactions from "../../components/ListTransactions"
import Navigator from "../../components/Navigator"

const HomePage = () => {
  return (
    <div>
      <Navigator/>
      <ImportForm/>
      <ListTransactions/>
    </div>
  )
}

export default HomePage