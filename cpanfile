requires 'Plack';
requires 'Plack::Middleware::Session';
requires 'OAuth::Lite::Consumer';
requires 'JSON::XS';

on 'configure' => sub {
    requires 'Module::Build::Tiny';
};

on 'test' => sub {
    requires 'Test::Base';
    requires 'Test::More';
    requires 'Test::Mock::Guard';
    requires 'Plack::Test';
    requires 'Plack::Builder';
    requires 'Plack::Middleware::Session::Cookie';
    requires 'HTTP::Request';
    requires 'HTTP::Response';
    suggests 'LWP::UserAgent';
};
