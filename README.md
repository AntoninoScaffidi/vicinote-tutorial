# vicinote-tutorial

Companion Rails app for the [VicinoTe](https://antoninoscaffidi.github.io/series/vicinote/) tutorial series ([Italiano](https://antoninoscaffidi.github.io/it/series/vicinote/)) — a local services marketplace built from scratch, from `rails new` to an AI module powered by [RubyLLM](https://rubyllm.com).

*VicinoTe — from the Italian "vicino a te", "close to you".*

Each blog post has a matching git tag here (`episode-1`, `episode-2`, ...) so you can check out the exact code state discussed in that post:

```bash
git checkout episode-1
```

## Stack

- Rails 8, Tailwind CSS
- PostgreSQL
- [RubyLLM](https://rubyllm.com) (from the advanced episodes onwards)

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/dev
```

App available at `http://127.0.0.1:3000`.
