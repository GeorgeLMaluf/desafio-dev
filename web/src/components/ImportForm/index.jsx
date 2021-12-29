import React, { useRef } from "react";
import axios from "axios";

const ImportForm = () => {
  const inputRef = useRef(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    const data = new FormData();
    data.append("files", inputRef.current.files[0])
    axios.post("http://localhost:4000/api/v1/import_file", data).then(() => {
      window.alert('Arquivo importado.');
      window.location.reload();
    })
  }

  return (
    <>
      <form
        action="http://localhost:4000/api/v1/import_file"
        method="post"
        enctype="multipart/form-data"
        onSubmit={handleSubmit}>
          <label htmlFor='fileInsert'>Upload do Arquivo</label>
          <input
            type="file"
            name="files"
            ref={inputRef}
          />
          <button type="submit">Enviar</button>
      </form>
    </>
  )
}

export default ImportForm;