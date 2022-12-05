# 🍺Ozei

Last minutes reservation for group of people.

<img width="319" alt="Screen Shot 2022-12-05 at 16 35 36" src="https://user-images.githubusercontent.com/88379080/205579823-d32c2192-bcbe-4c0a-a41a-36008b7e9597.png">

<br>
App home: https://www.ozei.fun/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Soren](https://github.com/sumstot)
- [Mattias Velamsson](https://github.com/smackdh)
- [Erika Ura](https://github.com/ErikaUra)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
