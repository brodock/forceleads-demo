Forceleads-demo
===============

Getting Started
---------------

This repository comes equipped with a self-setup script:

    % ./bin/setup

If you want to test locally, you can run with thin:

    % thin start --ssl


Setting up Salesforce API
-------------------------

For this demo to work correctly, you need to run the Rails application on HTTPS,
as Salesforce REST API mandates the use of secure connections for the OAuth2
authentication.

You will have to follow the [Defining connected Apps](https://www.salesforce.com/us/developer/docs/api_rest/Content/intro_defining_remote_access_applications.htm) reference to learn how to
generate the OAuth2 credentials to be able to connect this app with Salesforce API.


Try our Demo
------------

If you want to try it without deploying by yourself, you do so by visiting:
http://forceleads-demo-production.herokuapp.com

You need to generate a specific **Connected App** for your company, using
the following callback url: https://forceleads-demo-production.herokuapp.com/services/oauth2/callback
