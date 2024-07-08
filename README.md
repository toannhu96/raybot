# Raybot

Telegram bot on Raydium written in Go

## Features

- Get all liquidity pools on Raydium
- Get all concentrated liquidity pools on Raydium
- Get all standard liquidity pools on Raydium

## Project structure

This project follows structure of [Golang standard](https://github.com/golang-standards/project-layout). The project is structured as follows:

- `cmd`: contains the main package
- `internal`: contains the main logic of the bot
    - `app`: your actual application code
    - `conf`: load configuration environment
    - `handler`: view in MVC pattern. It is responsible for handling the incoming bot requests
    - `entity`: model in MVC pattern
    - `service`: controller in MVC pattern. It is responsible for handling the business logic, such as get all pools on Raydium from api.

## Installation

1. Get your bot token from BotFather
2. Create a `.env` file in the root directory and add the following line:
```
BOT_TOKEN=<your_bot_token>
```
3. Run the bot with docker
```bash
docker compose up -d
```

## Production

https://t.me/RaydiumTraderBot

## Demo

https://www.loom.com/share/670fe06248534169840c3698c06aea01?sid=5a9629b8-2058-4328-8baa-6cc40c1c838b

## Contact

Email: toanbk21096@gmail.com \
Twitter: @toannhu21096 \
Telegram: toannhu96