# Library School
We want to see you learning what you're interested in and sharing what you know how to do.
http://library-school.herokuapp.com

##Description

At its simplest, Library School is a tool to connect members of a community both with others who share their learning goals and with local content experts to lead participants toward those goals.

- Propose a course
- See what proposals are out there
- Express an interest in a proposed course
- Offer to lead a course for a particular proposal
- See what courses offerings are out there
- Express an interest in enrolling in a course offering

Once a course has been offered for a proposal and enough people have expressed interest in enrolling, we reach out to the course instructor and those interested to work out the details of when and where.

##Thought process behind LibrarySchool

Many libraries try to offer courses that they suspect members of the public will be interested in. Library School provides the data to support what classes are offered so that they actually represent the interests of the library’s community.

Community interest areas often extend beyond the expertise of a library's staff. Library School relies on pulling rather than pushing. Instead of staff using their connections to identify course leaders, those leaders identify themselves. Of note, course leaders don’t need to be experts themselves, per se. So long as they can find resources, be they available curricula, video lectures, etc. and are willing to lead participants through their course offering.

Since participants express their interest to enroll in a course based on the course leader’s course description and objectives, participants effectively take the onus of vetting courses and their course leaders on themselves.

How do we decide how many participants is enough? Course leaders specify the minimum and maximum number of students they are willing to teach. Once a course reaches the minimum number of students, that’s when we start to organize meetings.

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
| ADMIN_EMAIL            | Admin's e-mail address     | 
| ADMIN_PASSWORD         | Admin's password           |
| DOMAIN_NAME            | Domain name of app         |
| SECRET_KEY_BASE        | Rails session secret key   |

`ADMIN_NAME`, `ADMIN_EMAIL`, and `ADMIN_PASSWORD` are used temporarily to bootstrap the initial admin user on production, so you may clear those out after the database bootstrapping process.

### Secret Key

In ruby, a secret key can be generated with

```ruby
SecureRandom.hex(64)
```
