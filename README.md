# Members Only!

## Introduction

Members Only is an exclusive clubhouse where members can write anonymous posts. Inside the clubhouse, members can see who the author of a post is, but outside, they can only see the story and wonder who wrote it.

This project is part of [The Odin Project's](https://www.theodinproject.com/) Ruby on Rails Curriculum.

## Live Demo

You can see a live version of the app [here](https://members-only-ror.onrender.com).
Please note that the app is hosted on a free tier and may take a moment to load if it has been inactive.

## Features

- User authentication system, built with Devise. Github and google sign in.
- Users can sign up, log in, and log out.
- Only logged in users can create posts.
- Only logged in users can see the authors of posts.
- Real-time updates of posts using Action Cable. **Only for posting secrets.**

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have Ruby and Rails installed on your machine. See [this guide](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails) for instructions on setting up Rails.

### Installing

1. Clone the repository: `git clone https://github.com/DiptoSarkar182/members_only_ROR.git`
2. Navigate into the project directory: `cd members-only`
3. Install the dependencies: `bundle install`
4. Set up the database: `rails db:create db:migrate`
5. Start the server: `rails server`
6. Visit `http://127.0.0.1:3000/` in your browser to access the application.