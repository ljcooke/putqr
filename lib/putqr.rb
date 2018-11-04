# frozen_string_literal: true

require 'base64'
require 'rqrcode'

require 'putqr/version'

module PutQR
  # Display a QR code in your terminal.
  class QRCode
    attr_reader :qrcode

    # Initialize the QR code with a string.
    def initialize(content)
      @qrcode = QRCode.generate_qrcode(content)
    end

    # Can the string be encoded as a QR code?
    def valid?
      !qrcode.nil?
    end

    # Render the QR code for display in the terminal.
    # Returns a string.
    def render
      if ENV['TERM_PROGRAM'].start_with? 'iTerm'
        render_image_iterm2
      else
        render_ansi
      end
    end

    # Render the QR code using ANSI escape codes.
    # Returns a string.
    def render_ansi
      qrcode.as_ansi if valid?
    end

    # Render the QR code as an inline image for iTerm2.
    # Returns a string.
    def render_image_iterm2
      return nil unless valid?

      # References:
      # https://iterm2.com/documentation-images.html
      # https://iterm2.com/utilities/imgcat

      # tmux requires some extra work for unrecognised escape code sequences
      screen = ENV['TERM'].start_with? 'screen'
      prefix = screen ? "\ePtmux;\e\e]" : "\e]"
      suffix = screen ? "\a\e\\" : "\a"

      png = qrcode.as_png(size: 600)
      png_base64 = Base64.encode64(png.to_s).chomp
      options = 'inline=1'
      "#{prefix}1337;File=#{options}:#{png_base64}#{suffix}"
    end

    def self.generate_qrcode(content)
      # Try each size until one fits
      (min_qr_version(content.size)..40).each do |version|
        begin
          return RQRCode::QRCode.new(content, level: :h, size: version)
        rescue RQRCode::QRCodeRunTimeError
          next
        end
      end
      nil
    end

    def self.min_qr_version(input_size)
      # Skip the lower QR code versions where the input is known to be too
      # long. These figures are based on the maximum number of characters
      # that can be encoded for a numeric string with high error correction.
      if    input_size >= 2_524 then 36
      elsif input_size >= 1_897 then 31
      elsif input_size >=   969 then 21
      elsif input_size >=   331 then 11
      else 1
      end
    end
  end
end
