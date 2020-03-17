# frozen_string_literal: true

module Telegram
  module Bot
    class Client
      def get_duration(message)
        @text = message.text.delete_prefix(message.command)
        @text.to_i
      end

      def mute(message, user_to_mute_id, seconds)
        if self_can_mute?(message)
          api.restrict_chat_member(chat_id: message.chat.id, user_id: user_to_mute_id, can_send_messages: false, until_date: Time.now.to_i + seconds)
          true
        else
          @text = "I don't have the rights to mute!"
          respond_to_user(message, text)
        end
      end

      def delete(message)
        if self_can_delete_messages?(message)
          api.delete_message(chat_id: message.chat.id, message_id: message.message_id)
        else
          @text = "I don't have the rights to delete messages!"
          respond_to_user(message, text)
        end
      end
    end
  end
end
