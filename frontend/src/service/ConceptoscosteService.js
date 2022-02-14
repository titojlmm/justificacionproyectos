
import http from './http-common';

export default class ConceptoscosteService {
  getParams(params) {
    var strparam = this.getparametros(params);
    return http.get('/conceptocoste' + strparam);
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
    return http.get('/conceptocoste')
  }

  get(id) {
    return http.get(`/conceptocoste/${id}`)
  }
}
