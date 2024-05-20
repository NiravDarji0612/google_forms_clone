# Google Forms Clone

## Description

This project is a web application built with Ruby on Rails for managing forms and collecting responses. It allows users to create forms, distribute them, and gather responses from respondents.

## Features

- **Form Management**: Users can create, edit, and delete forms.
- **Question Management** : Users can add multiple questions to the particular form with multiple options.
- **Response Collection**: Forms can be shared with respondents, who can then submit their responses.

## Installation

1. Clone the repository:
    ```bash
    git clone <repository-url>
    ```

2. Install dependencies:
    ```bash
    bundle install
    ```

3. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

4. Start the server:
    ```bash
    rails server
    ```

5. Access the application at `http://localhost:3000`.

## Usage

1. Create a new form by providing the necessary details and questions.
3. Share the form link with respondents to collect responses.
4. View responses on the form's show page.

## Dependencies

- Ruby (3.2.3)
- Ruby on Rails (7.1)
- PostgreSQL
