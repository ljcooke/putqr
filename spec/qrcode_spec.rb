require_relative 'spec_helper'
require 'qrcat'

RSpec.describe QRCat::QRCode do
  let(:qrcode) { described_class.new(content) }

  context 'with a short string of digits' do
    let(:content) { '12345' }

    it 'is valid' do
      expect(qrcode.valid?).to be true
    end
  end

  context 'with a URL' do
    let(:content) { 'https://example.com' }

    it 'is valid' do
      expect(qrcode.valid?).to be true
    end
  end

  context 'with more than the maximum input length' do
    let(:content) { 'Long string...' * 1_000 }

    it 'is invalid' do
      expect(qrcode.valid?).to be false
    end
  end
end
