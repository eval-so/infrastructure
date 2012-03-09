class breakpoint_frontend {
  include mysql::server
  include httpd::server
  include breakpoint::frontend
}
