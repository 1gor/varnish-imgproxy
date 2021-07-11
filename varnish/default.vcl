vcl 4.0;
backend default{
  .host ="img";
  .port ="8080";
}
sub vcl_recv {
  if (req.method == "PURGE") {
    # if (!client.ip ~ purge) {
    #   return(synth(405,"Not allowed."));
    # }
    return (purge);
  }
}
sub vcl_backend_response {
  set beresp.ttl =1d;
}
sub vcl_deliver {
# # remove these headers to make headers same
#   unset resp.http.Via;
#   unset resp.http.Age;
#   unset resp.http.X-Varnish;
}
