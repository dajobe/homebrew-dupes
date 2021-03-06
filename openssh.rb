require 'formula'

class Openssh < Formula
  homepage 'http://www.openssh.com/'
  url 'ftp://ftp.lambdaserver.com/pub/OpenBSD/OpenSSH/portable/openssh-5.9p1.tar.gz'
  sha1 'ac4e0055421e9543f0af5da607a72cf5922dcc56'
  version '5.9p1'

  option 'with-hpn', 'Use high performance patches'

  def patches
    if build.include? 'with-hpn'
      'http://www.psc.edu/index.php/component/remository/func-download/596/chk,43adcff0c6e7f7bd58b8025e6489d1a9/no_html,1/'
    end
  end

  def install
    system "./configure", "--with-libedit", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
