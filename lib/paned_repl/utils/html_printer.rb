
class PanedRepl::Utils::HtmlPrinter

  Delimiter = PanedRepl.const("HTML_PRINTER_DELIMITER")

  using Gemmy.patch("object/i/ergo")

  def self.start &blk
    Html.io_loop &:ergo
  end

  def self.io_loop &blk
    html = ''
    loop do
      str = gets.chomp
      if str.ends_with? Delimiter
        new(html: html).print
        html = blk.call html
      else
        html = html + str
      end
    end
  end

  include AutoInitializer

  attr_reader :html

  def create_path
    Tempfile.new.tap { |f|
      f.write html
      f.close
    }.path
  end

  def print
    puts `cat #{create_path} | w3m -dump -T text/html`
  end

end
