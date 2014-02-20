class people::umi_uyura {  
  include homebrew
  include java
  include keepassx
  include chrome::beta
  include firefox
  include evernote
  include skitch
  include dropbox
  include bitcasa
  include libreoffice
  #include libreoffice::languagepack::ja
  include adobe_reader
  include skype
  #include android::sdk
  #include heroku
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
  include caffeine

  #
  # OS X Settings
  #

  class osx::dock::kill_dashbord {
    include osx::dock
    boxen::osx_defaults { 'kill dashbord':
      user   => $::boxen_user,
      domain => 'com.apple.dashboard',
      key    => 'mcx-disabled',
      value  => YES,
      notify => Exec['killall Dock'];
    }
  }
  
  include osx::global::enable_keyboard_control_access
  include osx::dock::autohide
  include osx::dock::kill_dashbord
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library
  include osx::no_network_dsstores

  # install homebrew packages
  package {
    [
	  'imagemagick',
	  'lv',
	  'subversion',
	  'tig',
	  'tree',
      'wget',
	  'w3m'
    ]:
  }

  # generate lgrep(lv) symlink
  file { "${homebrew::config::installdir}/bin/lgrep":
    ensure => link,
    target => "${homebrew::config::installdir}/bin/lv"
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
      source => "http://www.clamxav.com/downloads/ClamXav_2.6.2.dmg",
      provider => appdmg;
	'TotalTerminal':
	  source => "http://downloads.binaryage.com/TotalTerminal-1.4.10.dmg",
	  provider => pkgdmg;
    'Copy':
      source => "https://copy.com/install/mac/Copy.dmg",
      provider => appdmg;
	'HerokuToolbelt':
	  source => "https://s3.amazonaws.com/assets.heroku.com/heroku-toolbelt/heroku-toolbelt.pkg",
	  provider => pkgdmg;
    'svnX':
      source => "https://svnx.googlecode.com/files/svnX%201.3.4.dmg",
      provider => appdmg;
	'DiskWave':
	  source => "http://diskwave.barthe.ph/download/DiskWave_0.4.dmg",
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
	'GanttProject':
	  source => "https://ganttproject.googlecode.com/files/ganttproject-2.6.4-r1622.dmg",
	  provider => appdmg;
    'Paintbrush':
      source => "http://downloads.sourceforge.net/paintbrush/Paintbrush-2.1.1.zip",
      provider => compressed_app;
    'Kobito':
      source => "http://kobito.qiita.com/download/Kobito_v1.8.7.zip",
      provider => compressed_app;
#	'Genymotion':
#	  source => "https://ssl-files.genymotion.com/genymotion/genymotion-2.0.3/genymotion-2.0.3.dmg",
#	  provider => appdmg;
    'Wi2Connect':
	  source => "https://service.wi2.ne.jp/sw/autoLogin/MacOSX/Wi2-Connect-MacOSX.dmg",
      provider => appdmg;
	'1CheckerForMac':
	  source => "http://www.1checker.com/download?file=1Checker_for_Mac.dmg",
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
	'ti-inspector',
	'gittio',
	'jslint',
    'express',
	'jade',
	'stylus',
	'roots',
	'phonegap',
	'supervisor'
  ]

  nodejs::module { $nodejs_modules :
    node_version => 'v0.10'
  }

  # LibreOffice settings
  class { 'libreoffice::languagepack':
    locale => 'ja'
  }
}
