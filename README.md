# Ngwords
Ngwords prevents prohibited words from being registered in your application. The prohibited word list can be set in the YAML data format. Ngwords currently only works with Rails.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ngwords'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ngwords
```
## Usage

#### 1. Create your settings in `config/ngwords.yml`

```yml
defaults: &defaults
  en:
    - shit
    - id password input
  ja:
    - 白痴
    - ID パスワード 入力

development:
  <<: *defaults

test:
  <<: *defaults

production:
  <<: *defaults
```

Block of `en` is a list of prohibited words for space-separated languages ​​such as English. The block in `ja` is for non-space delimited languages ​​such as Japanese.

Note: To prevent data registration when all words are included, set prohibited words with a space delimiter like `id password input`.

#### 2. Add `ngwords: true` to your model's validates method

```ruby
class Post < ApplicationRecord
  validates :title, presence: true, ngwords: true
  validates :body, ngwords: true
end
```

Note: If you want to customize the error message, set your locale setting file (e.g.: `config/locales/ja.yml`) as follows.

```yml
ja:
  activerecord:
    errors:
      messages:
        includes_ngwords: "は禁止単語を含んでいます。"
```

## Contributing
1. Fork it ( https://github.com/chitamano/ngwords/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
