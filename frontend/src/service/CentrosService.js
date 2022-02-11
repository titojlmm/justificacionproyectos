
import http from './http-common';

export default class CentrosService {
  getParams(params) {
    var strparam = this.getparametros(params);
    return http.get('/centro' + strparam);
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
    return http.get('/centro')
  }

  get(id) {
    return http.get(`/centro/${id}`)
  }

  create(data) {
    data.strrefextproyecto = data.strrefextproyecto.toUpperCase();
    data.strcodigocentro = data.strcodigocentro.toUpperCase();
    return http.post('/centro', data)
  }

  update(id, data) {
    return http.put(`/centro/${id}`, data)
  }

  delete(id) {
    return http.delete(`/centro/${id}`)
  }

}
