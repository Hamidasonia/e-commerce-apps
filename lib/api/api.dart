import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryDatabase {
  static String loginUser = """
  query loginUser(\$email: String, \$password: String){
  user(where: {email: {_eq: \$email}, password: {_eq: \$password}}){
    id
    fullname
    email
    username
    password
    tgl_daftar
  }
}
  """;

  static String registerUser = """
  mutation addDataUser(\$fullname: String, \$username: String, \$email: String, \$password: String, \$tgl_daftar: date){
  insert_user(objects: {fullname: \$fullname, username: \$username, email: \$email, password: \$password, tgl_daftar: \$tgl_daftar}){
    returning {
      id
      fullname
      username
      email
      password
      tgl_daftar
    }
  }
}
  """;

  static String checkout = """
  mutation addDataOrder(\$product: String, \$total_price: Int, \$order_date: date, \$user_id: Int){
  insert_order(objects: {product: \$product, total_price: \$total_price, order_date: \$order_date, user_id: \$user_id}){
    returning {
       id
       product
       total_price
       order_date
       user_id
    }
  }
}
  """;

  static HttpLink httpLink =
      HttpLink("https://yusuf-nizam.hasura.app/v1/graphql", defaultHeaders: {
    "content_type": "application/json",
    "x-hasura-admin-secret":
        "ef5KaPVQooAPi07Sd0ePoAfsKbMn2JUjLOC2upUqhFCL6ZSCN5nFSEaxhbk57uWE",
  });

  static Link link = httpLink;
  static ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(link: link, cache: GraphQLCache()));
}
