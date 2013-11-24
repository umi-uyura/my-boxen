class people::umi_uyura {
  include osx::global::enable_keyboard_control_access
  include osx::dock::autohide
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library
  include osx::no_network_dsstores
  include java
  include keepassx
  include chrome::beta
  include firefox
  include evernote
  include skitch
  include dropbox
  include bitcasa
  include libreoffice
  include libreoffice::languagepack::ja
  include adobe_reader
  include skype
#   include android::sdk
  include heroku
  include virtualbox
  include vagrant
  include github_for_mac
  include postgresapp
  include sourcetree
  include sequel_pro
  include pgadmin3
  include filezilla
  include cyberduck
  include appcleaner
  include imageoptim
  include inkscape
  include gimp
  include vlc
  include handbrake
  include mplayerx

  # install homebrew package
  package {
    [
	  'tree',
      'wget'
    ]:
  }

  # install mac apps
  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'CarbonEmacs':
      source => "http://macwiki.sourceforge.jp/emacs/CarbonEmacs-Leopard-20100115.dmg",
      provider => appdmg;
#     'CocoaEmacs':
#       source => "http://emacsformacosx.com/emacs-builds/Emacs-24.3-universal-10.6.8.dmg",
#       provider => appdmg;
    'JavaForOSX':
	  source => "http://support.apple.com/downloads/DL1572/ja_JP/JavaForOSX2013-05.dmg",
	  provider => pkgdmg;
    'ClamXav':
      source => "http://www.clamxav.com/downloads/ClamXav_2.6.1.dmg",
      provider => appdmg;
    'Copy':
      source => "https://copy.com/install/mac/Copy.dmg",
      provider => appdmg;
    'svnX':
      source => "http://www.lachoseinteractive.net/files/svnX_0.9.13.dmg",
      provider => appdmg;
    'Zipeg':
      source => "http://www.zipeg.net/downloads/zipeg_mac.dmg",
      provider => appdmg;
    'Keka':
      source => "http://download.kekaosx.com/Keka-1.0.3-intel.dmg",
      provider => appdmg;
	'XMind':
	  source => "http://www.xmind.net/xmind/downloads/xmind-macosx-3.4.0.201311050558.dmg",
	  provider => appdmg;
    'Mou':
      source => "http://mouapp.com/download/Mou.zip",
      provider => compressed_app;
    'Paintbrush':
      source => "http://downloads.sourceforge.net/paintbrush/Paintbrush-2.1.1.zip",
      provider => compressed_app;
    'Kobito':
      source => "http://kobito.qiita.com/download/Kobito_v1.8.2.zip",
      provider => compressed_app;
    'Wi2Connect':
	  source => "https://service.wi2.ne.jp/sw/autoLogin/MacOSX/Wi2-Connect-MacOSX.dmg",
      provider => appdmg;
  }

  $home     = "/Users/${::boxen_user}"
  $src      = "${home}/src"
  $dotfiles = "${src}/dotfile"

  # Node.js settings
  class { 'nodejs::global':
    version => 'v0.10'
  }

  $nodejs_modules = [
    'titanium',
	'titanium-code-processor',
	'alloy',
	'acs',
	'tishadow',
	'jslint',
    'express',
	'jade',
	'stylus',
	'supervisor',
	'roots'
  ]

  nodejs::module { $nodejs_modules :
    node_version => 'v0.10'
  }
  
}
