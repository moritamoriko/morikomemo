# morikomemo
140文字以上のつぶやきをURLでTwitterにシェアできるwebアプリ。
https://morikomemo.herokuapp.com/

## Local Setting
### GitHub上でFork
https://github.com/moritamoriko/morikomemo/

### リポジトリをローカルへ作成

```
cd ~/WORK_DIRECTORY
git clone https://github.com/moritamoriko/morikomemo.git
cd morikomemo
```

### ブランチ作成

```
git checkout -b YOUR_NEW_BRANCH
```

### Twitterアプリ登録

<a href="https://dev.twitter.com/apps/new" target="_blank">Twitter Create an application</a>

```
Name: [ (アプリケーションの名前) ]
Description: [ (アプリケーションの説明) ]
WebSite: [ http://0.0.0.0:3000/ ]
Callback URL: [ http://0.0.0.0:3000/ ] ※登録しないと動かない
□ Yes, I agree <= チェック
CAPTCHA入力後「Create your Twitter application」を押下
```

### ローカル用Twitterキー設定

Create: config/settings.local.yml

```ruby
# Twitter OAuth Local Setting
twitter_key:    "YOUR_CONSUMER_KEY"
twitter_secret: "YOUR_CONSUMER_SECRET"
```

※Twitterアプリ登録完了後に表示された「Consumer key」を「YOUR_CONSUMER_KEY」に、「Consumer secret」を「YOUR_CONSUMER_SECRET」にそれぞれ入力

### Rails起動

Gemインストール

```
bundle install --without production
```

ローカルDB作成

```
rake db:setup
```

ローカルサーバ起動

```
bundle exec rails s
```

ページアクセス

```
http://0.0.0.0:3000/
```

## Copyright

Copyright (c) 2013 moritamoriko. <a href="http://creativecommons.org/licenses/by-nc-sa/2.1/jp/" target="_blank">CC BY-NC-SA 2.1</a>
