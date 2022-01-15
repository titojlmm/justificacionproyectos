// plugins/util.js
export function getIdFromURI(uri) {
  var id = "";
  if (typeof uri === "string") {
    id = uri.substr(uri.lastIndexOf("/"));
  }
  return id;
}
