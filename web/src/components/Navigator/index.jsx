import React from "react";
import { Link } from 'react-router-dom';

const Navigator = () => {
  return (
    <div>
      <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/list">Transações por Loja</Link>
          </li>
        </ul>
      </nav>
    </div>
  )
}

export default Navigator;