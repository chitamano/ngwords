require 'test_helper'

class Ngwords::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Ngwords
  end

  test 'loads config for en' do
    assert_kind_of Array, Ngwords::Settings.en
  end

  test 'loads config for ja' do
    assert_kind_of Array, Ngwords::Settings.ja
  end

  # accept test for en
  test 'accepts valid value for en' do
    post = Post.new(title: 'hello world', body: 'my name is hoge.')
    assert post.valid?
  end

  test 'accepts empty value for en' do
    post = Post.new(title: 'hello world', body: '')
    assert post.valid?
  end

  test 'accepts valid multiple value for en' do
    post = Post.new(title: 'hello world', body: 'my name is hoge. Multiple word')
    assert post.valid?
  end

  # reject test for en
  test 'rejects invalid value for en' do
    post = Post.new(title: 'hello test world', body: 'my name is hoge.')
    refute post.valid?
  end

  test 'rejects empty value for en' do
    post = Post.new(title: '')
    refute post.valid?
  end

  test 'rejects invalid multiple value for en' do
    post = Post.new(title: 'hello world', body: 'my name is hoge. Multiple word validation')
    refute post.valid?
  end

  test 'rejects invalid zenkaku value for en' do
    post = Post.new(title: 'hello ｔeSt world', body: 'my name is hoge.')
    refute post.valid?
  end

  test 'rejects invalid multiple zenkaku value for en' do
    post = Post.new(title: 'hello world', body: 'my name is hoge. ｍultiＰle ｗoＲd vaLiｄation')
    refute post.valid?
  end

  test 'rejects invalid multiline zenkaku value for en' do
    post = Post.new(title: 'hello world', body: "my name is hoge. ｍultiＰle ｗoＲd\n vaLiｄation")
    refute post.valid?
  end

  # accept test for ja
  test 'accepts valid value for ja' do
    post = Post.new(title: 'こんにちは世界', body: '私の名前はほげです。')
    assert post.valid?
  end

  test 'accepts empty value for ja' do
    post = Post.new(title: 'こんにちは世界', body: '')
    assert post.valid?
  end

  test 'accepts valid multiple value for ja' do
    post = Post.new(title: 'こんにちは世界', body: '私の名前はほげです。複数の禁止ワード')
    assert post.valid?
  end

  # reject test for ja
  test 'rejects invalid value for ja' do
    post = Post.new(title: 'こんにちはテスト世界', body: '私の名前はほげです。')
    refute post.valid?
  end

  test 'rejects empty value for ja' do
    post = Post.new(title: '')
    refute post.valid?
  end

  test 'rejects invalid multiple value for ja' do
    post = Post.new(title: 'こんにちは世界', body: '私の名前はほげです。複数の禁止ワードを含む検証です')
    refute post.valid?
  end

  test 'rejects invalid hankaku value for ja' do
    post = Post.new(title: 'こんにちはﾃｽﾄ世界', body: '私の名前はほげです。')
    refute post.valid?
  end

  test 'rejects invalid multiple hankaku value for ja' do
    post = Post.new(title: 'こんにちは世界', body: '私の名前はほげです。複数の禁止ﾜｰﾄﾞを含む検証です')
    refute post.valid?
  end

  test 'rejects invalid multiline hankaku value for ja' do
    post = Post.new(title: 'こんにちは世界', body: "私の名前はほげです。複数の禁止ﾜｰﾄﾞを\n含む検証です")
    refute post.valid?
  end
end
