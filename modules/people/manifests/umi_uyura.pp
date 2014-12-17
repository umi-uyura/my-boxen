class people::umi_uyura {  
  include homebrew
  include java
  include keepassx
  include chrome::beta
  include firefox
  include skitch
  include dropbox
  include bitcasa
  #include libreoffice
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
  include osx::global::enable_standard_function_keys
  include osx::dock::autohide
  include osx::dock::kill_dashbord
  #include osx::finder::show_external_hard_drives_on_desktop
  #include osx::finder::show_mounted_servers_on_desktop
  #include osx::finder::show_removable_media_on_desktop
  #include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::no_network_dsstores

  osx::dock::hot_corner { 'Top Left':
    action => 'Start Screen Saver'
  }

  osx::dock::hot_corner { 'Top Right':
    action => 'Put Display to Sleep'
  }

  # install homebrew packages
  package {
    [
	  'bash-completion',
	  'dgate',
	  'ffmpeg',
      'ghostscript',
	  'gifsicle',
	  'imagemagick',
	  'jq',
      'lv',
	  'meld',
	  'mongodb',
	  'pwgen',
      'subversion',
	  'terminal-notifier',
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
      source => "http://support.apple.com/downloads/DL1572/ja_JP/JavaForOSX2014-001.dmg",
      provider => pkgdmg;
    'ClamXav':
      source => "http://www.clamxav.com/downloads/ClamXav_2.6.4.dmg",
      provider => appdmg;
    'AppCleaner':
      source => "http://www.freemacsoft.net/downloads/AppCleaner_2.2.3.zip",
      provider => compressed_app;
#    'TotalTerminal':
#      source => "http://downloads.binaryage.com/TotalTerminal-1.4.11.dmg",
#      provider => pkgdmg;
    'iTerm2':
	   source => "https://iterm2.com/downloads/stable/iTerm2_v2_0.zip",
	   provider => compressed_app;
    'Copy':
      source => "https://copy.com/install/mac/Copy.dmg",
      provider => appdmg;
    'HerokuToolbelt':
      source => "https://s3.amazonaws.com/assets.heroku.com/heroku-toolbelt/heroku-toolbelt.pkg",
      provider => pkgdmg;
    'svnX':
      source => "https://svnx.googlecode.com/files/svnX%201.3.4.dmg",
      provider => appdmg;
    'XMind':
      source => "http://www.xmind.net/xmind/downloads/xmind-macosx-3.4.1.201401221918.dmg",
      provider => appdmg;
    'Haroopad':
      source => "https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.12.2.dmg",
      provider => appdmg;
    'GanttProject':
      source => "http://dl.ganttproject.biz/ganttproject-2.6.6/ganttproject-2.6.6-r1715.dmg",
      provider => appdmg;
    'Paintbrush':
      source => "http://downloads.sourceforge.net/paintbrush/Paintbrush-2.1.1.zip",
      provider => compressed_app;
    'ImageAlpha':
      source => "http://pngmini.com/ImageAlpha1.3.5.tar.bz2",
      provider => compressed_app,
      flavor => 'tbz';
	'PixelWinch':
	  source => "http://www.ricciadams.com/downloads/winch/PixelWinch.zip",
	  provider => compressed_app;
    'Kobito':
      source => "http://kobito.qiita.com/download/Kobito_v1.9.2.zip",
      provider => compressed_app;
#   'Genymotion':
#     source => "https://ssl-files.genymotion.com/genymotion/genymotion-2.0.3/genymotion-2.0.3.dmg",
#     provider => appdmg;
    'AndroidFileTransfer':
      source => "https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg",
	  provider => appdmg;
	'SimPholders':
	  source => "http://kfi-apps.com/site/assets/files/1007/simpholders-1_5_0.dmg",
	  provider => appdmg;
	'DatabaseBrowser4SQLite':
	  source => "https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v3.3.1/sqlitebrowser-3.3.1v2.dmg",
	  provider => appdmg;
# 	'Robomongo':
# 	  source => "http://robomongo.org/files/mac/Robomongo-0.8.4-x86_64.dmg",
# 	  provider => appdmg;
	'VagrantManager':
	  source => "https://github.com/lanayotech/vagrant-manager/releases/download/2.0.3/vagrant-manager-2.0.3.dmg",
	  provider => appdmg;
	'Onyx':
	  source => "http://joel.barriere.pagesperso-orange.fr/dl/109/OnyX.dmg",
	  provider => appdmg;
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
    'npm-check-updates',
    'titanium',
    'titanium-code-processor',
    'alloy',
    'acs',
    'tishadow',
    'ti-inspector',
	'tn',
	'tiapp.xml',
	'dev.tiapp',
	'ti-i18n',
    'gittio',
	'ticons',
	'alloy-smelter',
    'jslint',
	'jshint',
	'jscs',
	'plato',
    'node-inspector',
	'node-static',
    'express-generator',
    'jade',
    'stylus',
    'roots',
    'phonegap',
    'supervisor',
	'app.json',
	'umi-uyura/showip',
	'psi'
  ]

  nodejs::module { $nodejs_modules :
    node_version => 'v0.10'
  }

  # LibreOffice settings
  class { 'libreoffice':
    version => '4.3.2'
  }
  
  class { 'libreoffice::languagepack':
    locale => 'ja',
	version => '4.3.2'
  }
}
