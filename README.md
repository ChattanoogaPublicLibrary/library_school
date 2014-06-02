# Library School

http://library-school.herokuapp.com

## Prerequisites 

* Ruby 2.1.2 ([rvm](http://rvm.io/) or [rbenv](https://github.com/sstephenson/rbenv) highly recommended for installation)
* Bundler 1.6
* MySQL 5.5 (Production)
* SQLite (For local development, **temporarily**)

## Local Development

From root of project directory run `bundle install`

### Bootstrapping The Database

For now SQLite is used for local development, but this **will** change soon. We are using MySQL on production and this should be reflected in development.

The database configuration, `database.yml` is not kept in the repository. You will need to write it yourself and place in `config`. An example `database.yml` for SQLite can be found [here](https://gist.github.com/danopia/940155)

Next, you will need to bootstrap the database by running `rake db:create`, `rake db:schema:load`, and `rake db:seed`.

The default sign-in credentials are e-mail address `user@example.com` with `changeme` as the password. You can actually change this before you run the bootstrapping process by editing `config/secrets.yml`.

### Running the server

You can either run `guard` or `rails s`. `guard` will reboot the development server when relevant files are changed, which is handy. It will also run tests as you work. By the way, we need more tests. [Help us write them!](https://github.com/ChattanoogaPublicLibrary/library_school/pulls)

## Deployment

The absolute easiest method is via [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku), that is definitely not required. Regardless of how you choose to deploy, install the prerequisites and ensure the following environment variables are set:


| Environment Variable   | Value                      |
| ---------------------- |:--------------------------:| 
| ADMIN_NAME             | Admin's personal name      |
| ADMIN_EMAIL            | Admin' e-mail address      | 
| ADMIN_PASSWORD         | Admin's password           |
| DOMAIN_NAME            | Domain name of app         |
| SECRET_KEY_BASE        | Rails session secret key   |

`ADMIN_NAME`, `ADMIN_EMAIL`, and `ADMIN_PASSWORD` are used temporarily to bootstrap the initial admin user on production, so you may clear those out after the database bootstrapping process.

### Secret Key

In ruby, a secret key can be generated with

```ruby
SecureRandom.hex(64)
```
