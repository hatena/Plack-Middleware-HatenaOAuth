# NAME

Plack::Middleware::HatenaOAuth - provide a login endpoint for Hatena OAuth

# SYNOPSIS

    use Plack::Builder;
    use Plack::Session;

    my $app = sub {
        my $env = shift;
        my $session = Plack::Ssession->new($env);
        my $user_info = $session->get('hatenaoauth_user_info') || {};
        my $user_name = $user_info->{url_name};
        return [
            200,
            [ 'Content-Type' => 'text/html' ],
            [
                "<html><head><title>Hello</title><body>",
                $user_name
                    ? "Hello, id:$user_name !"
                    : "<a href='/login?location=/'>Login</a>"
            ],
        ];
    };

    builder {
        enable 'Session';
        enable 'Plack::Middleware::HatenaOAuth',
             consumer_key       => 'vUarxVrr0NHiTg==',
             consumer_secret    => 'RqbbFaPN2ubYqL/+0F5gKUe7dHc=',
             login_path         => '/login';
             # ua                 => LWP::UserAgent->new(...);
        $app;
    };

# DESCRIPTION

This middleware adds an endpoint for OAuth authorization of Hatena to
your Plack app.

# CONFIGURATIONS

- consumer\_key
=item consumer\_secret

        consumer_key    => 'vUarxVrr0NHiTg==',
        consumer_secret => 'RqbbFaPN2ubYqL/+0F5gKUe7dHc=',

    A consumer key and consumer secret registered on [the setting page
    for a developer](http://www.hatena.ne.jp/oauth/develop).  Follow the
    instructions on [the documentation on the devloper
    center](http://developer.hatena.ne.jp/en/documents/auth/apis/oauth/consumer)
    for registration.

- login\_path

    An endpoint for OAuth login, which is added to your Plack app.

- ua

    A user agent to make remote access to the OAuth server.

# LICENSE

Copyright (C) Hatena Co., Ltd..

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

INA Lintaro <tarao.gnn@gmail.com>
