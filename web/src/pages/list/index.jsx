import React from "react";
import ListTransactionsByProvider from '../../components/ListTransactionsByProvider';
import Navigator from "../../components/Navigator"

const ListPage = () => (
  <div>
    <Navigator/>
    <ListTransactionsByProvider/>
  </div>
)

export default ListPage;