import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import HomePage from "./pages/home";
import ListPage from "./pages/list";

const AppRoutes = () => (
  <BrowserRouter>
    <Routes>
      <Route exact path="/" element={<HomePage />} />
      <Route exact path="/list" element={<ListPage />} />
    </Routes>
  </BrowserRouter>
)

export default AppRoutes;
