

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>

### About The Project
## Background and Description
This project is an extension of the Little Esty Shop group project. You will add functionality for merchants to create bulk discounts for their items. A “bulk discount” is a discount based on the quantity of items the customer is buying, for example “20% off orders of 10 or more items”.
## Learning Goals

- Write migrations to create tables and relationships between tables
- Implement CRUD functionality for a resource using forms (form_tag or form_with), buttons, and links
- Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
- Use built-in ActiveRecord methods to join multiple tables of data, make calculations, and group data based on one or more attributes
- Write model tests that fully cover the data logic of the application
- Write feature tests that fully cover the functionality of the application
### Built With

* [Ruby on Rails](https://rubyonrails.org)
* [HTML](https://html.com)
* [JavaScript](https://www.javascript.com)


## Database Design Document
![Database Design Document](https://imgur.com/4B6qZD0.png)


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* rails
  ```sh
  gem install rails --version 5.2.4.3
  ```
* postgreSQL
  ```sh
  install link: https://www.postgresql.org/download/
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/domo2192/little-esty-shop.git
   ```
2. Bundle Install
   ```sh
   bundle install
   ```
3. (Optional Heroku deployment)
   ```sh
   heroku install guide: https://devcenter.heroku.com/articles/git
   ```



<!-- USAGE EXAMPLES -->
## Usage
_Work in progress_
1. Start rails server
```sh
$ rails s
```
2. Create rails database and migrate
```sh
$ rails db:create
$ rails db:migrate
```
3. Read data from CSV's
```sh
$ rails import
```
4. Nagivate to `http://localhost:3000/`



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/b-enji-cmd/little_esty_shop_bulk_discounts/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request




