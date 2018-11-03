# frozen_string_literal: true

require 'base64'
require 'rqrcode'

module QRCat
  # QRCode renderer.
  class QRCode
    attr_reader :qrcode

    def initialize(content)
      @qrcode = QRCode.generate_qrcode(content)
    end

    def render
      if ENV['TERM_PROGRAM'].start_with? 'iTerm'
        render_image_iterm2
      else
        render_ansi
      end
    end

    def render_ansi
      qrcode.as_ansi
    end

    def render_image_iterm2
      png = qrcode.as_png(size: 600)
      png_base64 = Base64.encode64(png.to_s).chomp
      options = 'inline=1'
      "\033]1337;File=#{options}:#{png_base64}\007"
    end

    class << self
      def generate_qrcode(content)
        # Try each size until one fits
        (1..40).each do |size|
          begin
            return RQRCode::QRCode.new(content, level: :h, size: size)
          rescue RQRCode::QRCodeRunTimeError
            next
          end
        end
        nil
      end
    end
  end
end
