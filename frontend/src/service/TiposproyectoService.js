
import http from './http-common';

export default class TiposproyectoService {
  getParams(params) {
    var strparam = this.getparametros(params);
    return http.get('/tipo' + strparam);
  }

  getparametros(params) {
    var strparam = "";

    if (params.page) {
      strparam += (strparam.length==0 ? "?": "&") + "page=" + params.page;
    }
    if (params.rows) {
      strparam += (strparam.length==0 ? "?" : "&") + "size=" + params.rows;
    }
    if (params.sortField) {
      strparam += (strparam.length==0 ? "?" : "&") + "sort=" + params.sortField + (params.sortOrder==-1 ? ",desc" : "");
    }
/*
    if (params.getFilters()) {
    }
*/
    return strparam;
  }

  getAll() {
    return http.get('/tipo')
  }

  get(id) {
    return http.get(`/tipo/${id}`)
  }

  create(data) {
    data.numidtipo = data.strcodigo;
    data.strcodigo = data.strcodigo.toUpperCase();
    data.strdescripcion = data.strdescripcion.toUpperCase();
    return http.post('/tipo', data)
  }

  update(id, data) {
    return http.put(`/tipo/${id}`, data)
  }

  delete(id) {
    return http.delete(`/tipo/${id}`)
  }

}
