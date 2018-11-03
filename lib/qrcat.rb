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

    def valid?
      !qrcode.nil?
    end

    def render
      if ENV['TERM_PROGRAM'].start_with? 'iTerm'
        render_image_iterm2
      else
        render_ansi
      end
    end

    def render_ansi
      qrcode.as_ansi if valid?
    end

    def render_image_iterm2
      return nil unless valid?

      png = qrcode.as_png(size: 600)
      png_base64 = Base64.encode64(png.to_s).chomp
      options = 'inline=1'
      "\033]1337;File=#{options}:#{png_base64}\007"
    end

    class << self
      # Try each size until one fits
      def generate_qrcode(content)
        (min_qr_version(content.size)..40).each do |version|
          begin
            return RQRCode::QRCode.new(content, level: :h, size: version)
          rescue RQRCode::QRCodeRunTimeError
            next
          end
        end
        nil
      end

      # Skip the lower QR code versions where the input is known to be too
      # long. These figures are based on the maximum number of characters
      # that can be encoded for a numeric string with high error correction.
      def min_qr_version(input_size)
        if    input_size >= 2_524 then 36
        elsif input_size >= 1_897 then 31
        elsif input_size >=   969 then 21
        elsif input_size >=   331 then 11
        else 1
        end
      end
    end
  end
end
