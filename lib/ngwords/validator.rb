require 'moji'

module ActiveModel
  module Validations
    class NgwordsValidator < EachValidator
      @@ngwords = nil

      def validate_each(record, attribute, value)
        return if value.blank?
        if Moji.normalize_zen_han(value) =~ ngwords
          record.errors.add(attribute, I18n.t('activerecord.errors.messages.includes_ngwords', default: 'includes prohibited words.'))
        end
      end

      private

      def ngwords
        return @@ngwords unless @@ngwords.nil?
        ngwords = []
        Ngwords::Settings.each do |lang, list|
          delim = lang == :en ? '\\b' : ''
          Array(list).reject(&:blank?).each do |ngword|
            escaped_ngword = ngword.split(/\p{blank}/).reject(&:blank?).map { |word| '(?=.*' + delim + Regexp.escape(word) + delim + ')' }.join('')
            ngwords.push(Regexp.compile("^#{escaped_ngword}", Regexp::IGNORECASE))
          end
        end
        @@ngwords = Regexp.union(ngwords)
      end
    end
  end
end
