
import http from './http-common';

export default class BloquestecnicaService {
  getParams(params) {
    var strparam = this.getparametros(params);
    return http.get('/bloquetecnica' + strparam);
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
    return http.get('/bloquetecnica')
  }

  get(id) {
    return http.get(`/bloquetecnica/${id}`)
  }

  create(data) {
    data.strcodigo = data.strcodigo.toUpperCase();
    return http.post('/bloquetecnica', data)
  }

  update(id, data) {
    return http.put(`/bloquetecnica/${id}`, data)
  }

  delete(id) {
    return http.delete(`/bloquetecnica/${id}`)
  }

}
