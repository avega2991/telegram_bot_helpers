# frozen_string_literal: true

module Tools
  BOT_ID = 1_043_894_792
  OWNER_ID = 786_714_018
  PRIVILEGED_IDS = [].freeze

  def get_id(bot, message)
    text = '$$$$$'
    bot.api.send_message(chat_id: message.chat.id, text: text)
    bot.listen do |response|
      if response.text.starts_with?('$$$$$')
        text = "module Tools
BOT_ID = #{response.from.id}
OWNER_ID = #{message.from.id}
end"
        bot.api.send_message(chat_id: message.chat.id, text: text)
        text = 'Copy-paste this text into your project'
        bot.api.send_message(chat_id: message.chat.id, text: text)
      end
    end
  end
end
