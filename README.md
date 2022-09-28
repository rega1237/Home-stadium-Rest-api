
# Book game API
![drawSQL-export-2022-09-20_10_50](https://user-images.githubusercontent.com/58194121/192393232-da79aaa6-d655-4295-a29c-b4f33555cc69.png)

> The book your dream game API allows all the end points necessary for:

- Create a stadium
- Create a game by selecting the list of teams
- Choose the desired date of the game
- Reserve the seats you want (if available)
- View all the reservations that the user owns

# [Front End Repo](https://github.com/rega1237/front-end-capstone-fullstack)

## Live Demo (https://homestadium.netlify.app/home)

## Built With

- Ruby on Rails
- PostgreSQL
- JWT
- Rswag

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

### Setup

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone https://github.com/rega1237/back-end-capstone-fullstack
cd back-end-capstone-fullstack
bundle install
bundle exec figaro install
```
- The bundle exec figaro install is to install and create the `application.yml` file and create the environment variables
- You will need to configure your  `application.yml` file before you install and run the project. The `application.yml` file contains environment variables needed to deploy the webpage. You can find this file in the folder config/application.yml. There is a commented `application_example.txt` file you can use as a guide to configure your own.

- Edit file application.yml

  - Provide the values for the variables
    - DATABASE_HOST
    - DATABASE_USER
    - DATABASE_PASSWORD

- Type this commands into the terminal:

```
rails db:create
rails db:reset
```

### Run application

- Type this command into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

### Testing

- Type this command into the terminal:

```
rails db:migrate RAILS_ENV=test
rails db:seed RAILS_ENV=test
rspec
```

### Documentation

- With the server open go to [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)


## Author

👤 **Rafael E. Guzman Arias**

- GitHub: [@rega1237](https://github.com/rega1237)
- LinkedIn: [Rafael E. Guzman Arias](https://www.linkedin.com/in/rafael-eduardo-guzman/)

👤 **Dangelo Arrivillaga**

- GitHub: [@Dangelo-JAN](https://github.com/Dangelo-JAN)
- LinkedIn: [Soluciones Empresriales Dangelo Arrivillaga](https://www.linkedin.com/in/soluciones-empresariales-dangelo-arrivillaga-2a144718a/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/) for the motivation.

## 📝 License

This project is [MIT](./MIT.md) licensed.
